# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Portable C Audio Library"
HOMEPAGE="https://github.com/espeak-ng/pcaudiolib"
SRC_URI="https://github.com/espeak-ng/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE="+alsa pulseaudio"

BDEPEND="
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )"

RDEPEND="${BDEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local my_conf=(
		$(use_with alsa)
		$(use_with pulseaudio)
	)
	econf "${my_conf[@]}"
}
