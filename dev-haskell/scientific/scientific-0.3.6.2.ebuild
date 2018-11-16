# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Numbers represented using scientific notation"
HOMEPAGE="https://github.com/basvandijk/scientific"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="integer-simple"

RDEPEND=">=dev-haskell/bytestring-builder-0.10.4:=[profile?] <dev-haskell/bytestring-builder-0.11:=[profile?]
	>=dev-haskell/hashable-1.1.2:=[profile?]
	>=dev-haskell/integer-logarithms-1:=[profile?]
	>=dev-haskell/primitive-0.1:=[profile?]
	>=dev-haskell/text-0.8:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	integer-simple? ( dev-haskell/integer-simple:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/quickcheck-2.5
		>=dev-haskell/smallcheck-1.0
		>=dev-haskell/tasty-0.5
		>=dev-haskell/tasty-ant-xml-1.0
		>=dev-haskell/tasty-hunit-0.8
		>=dev-haskell/tasty-quickcheck-0.8
		>=dev-haskell/tasty-smallcheck-0.2 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag integer-simple integer-simple)
}
