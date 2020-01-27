# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/NXPmicro/mfgtools.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/NXPmicro/mfgtools/archive/uuu_${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm"
fi

inherit cmake-utils udev

DESCRIPTION="Freescale/NXP I.MX Chip image deploy tools"
HOMEPAGE="https://github.com/NXPmicro/mfgtools"

LICENSE="BSD"
SLOT="0"
IUSE="-doc"

RDEPEND="
	dev-libs/libzip
	sys-libs/zlib
	virtual/libusb
	doc? ( app-doc/doxygen )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/0001-.patch"
)

S="${WORKDIR}/${PN}-uuu_${PV}"

src_prepare() {
	cmake-utils_src_prepare
	echo "#define GIT_VERSION \"libuuu_${PV}\"" > "${S}/libuuu/gitversion.h"
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_DOC=$(usex doc ON OFF)
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	udev_dorules "${FILESDIR}/99-librem5-devkit.rule"
}

pkg_postinst() {
	udev_reload
}
