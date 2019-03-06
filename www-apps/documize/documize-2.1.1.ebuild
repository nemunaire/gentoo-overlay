# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit golang-vcs-snapshot systemd user

EGO_PN="github.com/documize/community"
KEYWORDS="~amd64 ~arm"

DESCRIPTION="Open source Confluence alternative built with Golang + EmberJS"
HOMEPAGE="https://www.documize.com/"
SRC_URI="https://github.com/documize/community/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL3"
SLOT="0"
IUSE=""

S="${WORKDIR}/${P}/src/${EGO_PN}"

DEPEND="
	net-libs/nodejs[npm]
"
RDEPEND=""

src_prepare() {
	default
	cd "gui"
	npm install || die
}

src_compile() {
	pushd gui
	./node_modules/ember-cli/bin/ember build ---environment=production --output-path dist-prod --suppress-sizes true || die
	popd

	rm -rf embed/bindata/public || die
	mkdir -p embed/bindata/public || die
	cp -r gui/dist-prod/assets embed/bindata/public || die
	cp -r gui/dist-prod/codemirror embed/bindata/public/codemirror || die
	cp -r gui/dist-prod/prism embed/bindata/public/prism || die
	cp -r gui/dist-prod/sections embed/bindata/public/sections || die
	cp -r gui/dist-prod/tinymce embed/bindata/public/tinymce || die
	cp gui/dist-prod/*.* embed/bindata || die
	cp gui/dist-prod/favicon.ico embed/bindata/public || die
	cp gui/dist-prod/manifest.json embed/bindata/public || die

	rm -rf embed/bindata/mail || die
	mkdir -p embed/bindata/mail || die
	cp domain/mail/*.html embed/bindata/mail || die
	cp core/database/templates/*.html embed/bindata || die

	rm -rf embed/bindata/scripts || die
	mkdir -p embed/bindata/scripts || die
	mkdir -p embed/bindata/scripts/mysql || die
	mkdir -p embed/bindata/scripts/postgresql || die
	cp -r core/database/scripts/mysql/*.sql embed/bindata/scripts/mysql || die
	cp -r core/database/scripts/postgresql/*.sql embed/bindata/scripts/postgresql || die

	pushd embed
	go generate || die
	popd

	GOPATH=${WORKDIR}/${P}:$(get_golibdir_gopath) go build -gcflags="all=-trimpath=$GOPATH" -o documize ./edition/community.go || die
}

src_install() {
	dobin documize

	diropts -m0750 -o nobody -g nobody
	keepdir /var/log/documize /var/lib/documize
	newinitd "${FILESDIR}"/documize.initd documize
	newconfd "${FILESDIR}"/documize.confd documize
	systemd_dounit "${FILESDIR}"/documize.service
}
