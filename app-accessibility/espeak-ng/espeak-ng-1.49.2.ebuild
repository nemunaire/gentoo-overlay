# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs autotools

SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Speech synthesizer for English and other languages"
HOMEPAGE="https://github.com/espeak-ng/espeak-ng"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE="+async doc +klatt +mbrola +portaudio pulseaudio"

COMMON_DEPEND="portaudio? (
		media-libs/pcaudiolib
		>=media-libs/portaudio-19_pre20071207
	)
	pulseaudio? (
		media-libs/pcaudiolib[pulseaudio]
		media-sound/pulseaudio
	)
"

BDEPEND="${COMMON_DEPEND}
	app-arch/unzip
	doc? (
		app-text/ronn
		dev-ruby/kramdown
	)"

RDEPEND="${COMMON_DEPEND}
	media-sound/sox"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local my_conf=(
		$(use_with async)
		$(use_with klatt)
		$(use_with mbrola)
		$(use_with portaudio)
		$(use_with pulseaudio)
	)
	econf "${my_conf[@]}"
}

src_compile() {
	emake \
		PREFIX="${EPREFIX}/usr" \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		CXX="$(tc-getCXX)" \
		CXXFLAGS="${CXXFLAGS}" \
		AR="$(tc-getAR)" \
		src/espeak-ng src/speak-ng

	# README indicates "building voice data does not work with -jN option"
	emake \
		PREFIX="${EPREFIX}/usr" \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		CXX="$(tc-getCXX)" \
		CXXFLAGS="${CXXFLAGS}" \
		AR="$(tc-getAR)" \
		-j1 \
		all

	use doc && emake docs
}

src_install() {
	emake \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="\$(PREFIX)/$(get_libdir)" \
		DESTDIR="${D}" \
		install

	insinto /usr/share/espeak-data
	doins -r dictsource

	dodoc CHANGELOG.md README.md
	use doc && HTML_DOCS="docs/*.html" einstalldocs
}

pkg_preinst() {
	local voicedir="${ROOT}/usr/share/${PN}-data/voices/en"
	if [ -d "${voicedir}" ]; then
		rm -rf "${voicedir}"
	fi
}

pkg_postinst() {
	if ! use portaudio && ! use pulseaudio && ! use sada; then
		ewarn "Since portaudio and pulseaudio are not in your use flags,"
		ewarn "espeak will only be able to create wav files."
		ewarn "If this is not what you want, please reemerge ${CATEGORY}/${PN}"
		ewarn "with either portaudio or pulseaudio USE flag enabled."
	fi
}
