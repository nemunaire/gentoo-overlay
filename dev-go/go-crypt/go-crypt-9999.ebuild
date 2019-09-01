# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/amoghe/go-crypt/..."

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
	KEYWORDS=""
else
	SRC_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="A golang implementation of crypt(3)."
HOMEPAGE="https://${EGO_PN%/*}"
LICENSE="BSD"
SLOT="0/${PVR}"
IUSE=""

src_compile() {
	GOPATH="${S}" \
		go install -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}" || die
}

src_install() {
	golang_install_pkgs
}

golang_install_pkgs() {
	insinto $(dirname "${EPREFIX}$(get_golibdir)/src/${EGO_PN%/*}")
	rm -rf "${S}"/src/${EGO_PN%/*}/.git*
	doins -r "${S}"/src/${EGO_PN%/*}
	insinto $(dirname "${EPREFIX}$(get_golibdir)/pkg/$(go env GOOS)_$(go env GOARCH)/${EGO_PN%/*}")
	doins -r "${S}"/pkg/$(go env GOOS)_$(go env GOARCH)/${EGO_PN%/*}.a
}
