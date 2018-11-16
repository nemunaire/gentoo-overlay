# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.6

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Alternative prelude with batteries and no dependencies"
HOMEPAGE="https://github.com/haskell-foundation/foundation"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="bench-all bounds-check doctest experimental linktest minimal-deps"

RDEPEND="~dev-haskell/basement-0.0.7:=[profile?]
	>=dev-lang/ghc-8.0.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.0.0
	test? ( dev-haskell/basement
		doctest? ( !minimal-deps? ( >=dev-haskell/doctest-0.9 ) ) )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag bench-all bench-all) \
		$(cabal_flag bounds-check bounds-check) \
		$(cabal_flag doctest doctest) \
		$(cabal_flag experimental experimental) \
		$(cabal_flag linktest linktest) \
		$(cabal_flag minimal-deps minimal-deps)
}
