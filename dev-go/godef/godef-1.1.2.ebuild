# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/rogpeppe/godef/..."
ARCHIVE_URI="https://${EGO_PN%/*}/archive/v${PV/_/-}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~arm ~amd64"

DESCRIPTION="Print where symbols are defined in Go source code"
HOMEPAGE="https://github.com/rogpeppe/godef"
SRC_URI="${ARCHIVE_URI}"
LICENSE="BSD"
SLOT="0/${PVR}"
IUSE=""

src_install() {
	golang-build_src_install
	dobin bin/*
}
