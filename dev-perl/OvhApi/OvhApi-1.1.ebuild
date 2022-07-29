# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit perl-functions

MY_P="${PN}-perl-${PV}"

DESCRIPTION="OVH Perl wrapper upon the OVH RESTful API."
HOMEPAGE="https://api.ovh.com/"
SRC_URI="https://eu.api.ovh.com/wrappers/${MY_P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"

RDEPEND="dev-perl/libwww-perl[ssl]
	dev-perl/JSON
	dev-perl/Digest-SHA1"
BDEPEND="${RDEPEND}"

src_install() {
	perl_set_version

	insinto "${VENDOR_LIB}"
	doins OvhApi.pm
	insinto "${VENDOR_LIB}/OvhApi"
	doins OvhApi/Answer.pm
}
