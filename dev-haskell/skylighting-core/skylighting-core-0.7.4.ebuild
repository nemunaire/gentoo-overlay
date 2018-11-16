# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="syntax highlighting library"
HOMEPAGE="https://github.com/jgm/skylighting"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="executable system-pcre"

RDEPEND=">=dev-haskell/aeson-1.0:=[profile?]
	>=dev-haskell/ansi-terminal-0.7:=[profile?]
	dev-haskell/attoparsec:=[profile?]
	dev-haskell/base64-bytestring:=[profile?]
	>=dev-haskell/blaze-html-0.5:=[profile?]
	dev-haskell/case-insensitive:=[profile?]
	>=dev-haskell/colour-2.0:=[profile?]
	dev-haskell/hxt:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/safe:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/utf8-string:=[profile?]
	>=dev-lang/ghc-8.0.1:=
	system-pcre? ( dev-haskell/regex-pcre:=[profile?] )
	!system-pcre? ( dev-haskell/regex-pcre-builtin:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.0.0
	test? ( dev-haskell/diff
		dev-haskell/hunit
		dev-haskell/pretty-show
		dev-haskell/quickcheck
		dev-haskell/random
		dev-haskell/tasty
		dev-haskell/tasty-golden
		dev-haskell/tasty-hunit
		dev-haskell/tasty-quickcheck )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag executable executable) \
		$(cabal_flag system-pcre system-pcre)
}
