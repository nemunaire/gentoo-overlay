# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN=github.com/mattermost/mattermost-server

KEYWORDS="~amd64 ~arm"
SRC_URI="https://github.com/mattermost/mattermost-server/archive/v${PV}.tar.gz -> ${P}.tar.gz
build-client? ( https://github.com/mattermost/mattermost-webapp/archive/v${PV}.tar.gz -> ${P}-webapp.tar.gz )
!build-client? ( https://releases.mattermost.com/${PV}/mattermost-team-${PV}-linux-amd64.tar.gz )"

DESCRIPTION="Open source Slack-alternative in Golang and React"
HOMEPAGE="https://mattermost.com"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="+build-client"
DEPEND="dev-lang/go
	build-client? ( sys-apps/yarn )"
RDEPEND=""

S="${WORKDIR}/src/github.com/mattermost/mattermost-server"

src_unpack() {
	mkdir -p "${WORKDIR}/bin/" "${WORKDIR}/src/github.com/mattermost/"
	default
	mv "${WORKDIR}/mattermost-server-${PV}" "${WORKDIR}/src/github.com/mattermost/mattermost-server"
	use build-client && mv "${WORKDIR}/mattermost-webapp-${PV}" "${WORKDIR}/src/github.com/mattermost/mattermost-webapp"
}

src_prepare() {
	# We are not using docker, no need to stop it.
	sed -r -i "${S}/Makefile" \
		-e 's/^clean: stop-docker/clean:/'

	# Enforce build hash to Gentoo (Enterprise hash is already set to
	# none), instead of the official git hash value.
	sed -r -i "${S}/Makefile" \
		-e "s/^(\s*)BUILD_HASH(_ENTERPRISE)? =.*/\1BUILD_HASH\2 = Gentoo \(${CHOST}\)/"

	# The Go programming language only supports 8 instruction sets, therefore
	# we cannot rely on ${CARCH} and need to cast manually.
	# src.: https://golang.org/doc/install/source#introduction
	case "${CHOST}" in
		i686*)
			sed -r -i "${S}/build/release.mk" \
				-e "s/amd64/386/"
			;;
		armv8*|aarch64*)
			sed -r -i "${S}/build/release.mk" \
				-e "s/amd64/arm64/"
			;;
		arm*)
			sed -r -i "${S}/build/release.mk" \
				-e "s/amd64/arm/"
			;;
	esac

	# Remove platform specific lines from the Makefile from the line beginning
	# with that statement to the end of file (we do not care of the additional
	# file copy, nor the tar compression defined below the file).
	sed '/# ----- PLATFORM SPECIFIC -----/,//d' -i "${S}/build/release.mk"

	eapply_user
}

src_compile() {
	export BUILD_NUMBER="${PVR}"
	export LANG=C
	export GOPATH="${WORKDIR}"
	export LDFLAGS=""

	emake build-linux
	use build-client && emake build-client && emake package
	emake config-reset
}

src_install() {
	install -dm755 \
			"${D}/usr/share/webapps" \
			"${D}/var/log/${PN}" \
			"${D}/usr/share/doc/${PN}" || die

	if use build-client; then
		cp -a "${S}/dist/${PN}" "${D}"/usr/share/webapps/ || die
	else
		install -dm755 "${D}/usr/share/webapps/${PN}" || die
		cp -a "${WORKDIR}/${PN}/client" "${WORKDIR}/${PN}/fonts" "${WORKDIR}/${PN}/i18n" "${WORKDIR}/${PN}/templates" "${D}/usr/share/webapps/${PN}" || die
	fi

	rm -rf \
	   "${D}/usr/share/webapps/${PN}/logs" \
	   "${D}/usr/share/webapps/${PN}/plugins" \
	   "${D}/usr/share/webapps/${PN}/MIT-COMPILED-LICENSE.md" \
	   "${D}/usr/share/webapps/${PN}/NOTICE.txt" \
	   "${D}/usr/share/webapps/${PN}/README.md" || die

	keepdir "/var/log/${PN}/"
	keepdir "/var/lib/${PN}/plugins/"
	ln -s "/var/log/${PN}/" "${D}/usr/share/webapps/${PN}/logs" || die
	ln -s "/var/lib/${PN}/plugins/" "${D}/usr/share/webapps/${PN}/plugins" || die

	insinto /etc/
	sed -e 's@"Directory": ".*"@"Directory": "/var/lib/mattermost/"@g' \
		-e 's@tcp(dockerhost:3306)@unix(/run/mysqld/mysqld.sock)@g' \
		-i "${S}/config/config.json" || die
	newins "${S}/config/config.json" mattermost.json

	dodoc NOTICE.txt README.md

	dobin "${WORKDIR}/bin/${PN}"
	newinitd "${FILESDIR}/${PN}.init" "${PN}"
}
