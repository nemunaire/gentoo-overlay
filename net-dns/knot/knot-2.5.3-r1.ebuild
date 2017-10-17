# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils systemd user

DESCRIPTION="High-performance authoritative-only DNS server"
HOMEPAGE="http://www.knot-dns.cz/"
SRC_URI="https://secure.nic.cz/files/knot-dns/${P/_/-}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

KNOT_MODULES="+dnsproxy dnstap +noudp +onlinesign rosedb +rrl +stats +synthrecord +whoami"
IUSE="doc caps +fastparser idn systemd +utils ${KNOT_MODULES}"

RDEPEND="
	>=net-libs/gnutls-3.3:=
	>=dev-db/lmdb-0.9.15
	dev-python/lmdb
	>=dev-libs/userspace-rcu-0.5.4
	caps? ( >=sys-libs/libcap-ng-0.6.4 )
	dnstap? (
		dev-libs/fstrm
		dev-libs/protobuf-c
	)
	idn? ( || ( net-dns/libidn >=net-dns/libidn2-2.0.0 ) )
	dev-libs/libedit
	systemd? ( >=sys-apps/systemd-229 )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( dev-python/sphinx )
"

S="${WORKDIR}/${P/_/-}"

PATCHES=(
	"${FILESDIR}/${PV}-link-with-libatomic.patch"
)

src_configure() {
	local my_conf=""
	for u in ${KNOT_MODULES//+/}; do
		my_conf+="$(use_with $u module-$u) "
	done

	econf \
		--with-storage="${EPREFIX}/var/lib/${PN}" \
		--with-rundir="${EPREFIX}/var/run/${PN}" \
		$(use_enable fastparser) \
		$(use_enable dnstap) \
		$(use_enable doc documentation) \
		$(use_enable utils utilities) \
		$(use_enable systemd) \
		$(use_with idn libidn) \
		${my_conf}
}

src_compile() {
	default

	if use doc; then
		emake -C doc html
		HTML_DOCS=( doc/_build/html/{*.html,*.js,_sources,_static} )
	fi
}

src_test() {
	emake check
}

src_install() {
	default

	rmdir "${D}/var/run/${PN}" "${D}/var/run/"
	keepdir /var/lib/${PN}

	newinitd "${FILESDIR}/knot.init" knot
	if use systemd; then
		systemd_newunit "${FILESDIR}/knot-1.service" knot
	fi

	prune_libtool_files
}

pkg_postinst() {
	enewgroup knot 53
	enewuser knot 53 -1 /var/lib/knot knot
}