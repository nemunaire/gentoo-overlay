# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit bash-completion-r1 eutils systemd user

DESCRIPTION="High-performance authoritative-only DNS server"
HOMEPAGE="http://www.knot-dns.cz/"
SRC_URI="https://secure.nic.cz/files/knot-dns/${P/_/-}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug dnstap doc caps +fastparser idn systemd"

RDEPEND="
	>=net-libs/gnutls-3.0
	>=dev-libs/jansson-2.3
	>=dev-db/lmdb-0.9.15
	>=dev-libs/userspace-rcu-0.5.4
	caps? ( >=sys-libs/libcap-ng-0.6.4 )
	dnstap? (
		dev-libs/fstrm
		dev-libs/protobuf-c
	)
	idn? ( net-dns/libidn )
	dev-libs/libedit
	systemd? ( sys-apps/systemd )
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( dev-python/sphinx )
"

S="${WORKDIR}/${P/_/-}"

src_prepare() {
	epatch "${FILESDIR}/2.0.2-dont-create-extra-directories.patch"
	epatch "${FILESDIR}/2.3.0-added-conversion-to-wire-format-when-writing-FNV64-hash-values.patch"
	eapply_user
}

src_configure() {
	econf \
		--with-storage="${EPREFIX}/var/lib/${PN}" \
		--with-rundir="${EPREFIX}/var/run/${PN}" \
		--with-lmdb \
		--with-bash-completions="$(get_bashcompdir)" \
		$(use_enable fastparser) \
		$(use_enable debug debug server,zones,ns,loader,dnssec) \
		$(use_enable debug debuglevel details) \
		$(use_enable dnstap) \
		$(use_enable doc documentation) \
		$(use_with idn libidn) \
		$(usex systemd --enable-systemd=yes --enable-systemd=no)
}

src_compile() {
	default
	use doc && emake -C doc html
}

src_test() {
	emake check
}

src_install() {
	default
	keepdir /var/lib/${PN}

	if use doc; then
		docinto html
		dodoc doc/_build/html/*.html doc/_build/html/*.js
		docinto html/_sources
		dodoc doc/_build/html/_sources/*
		docinto html/_static
		dodoc doc/_build/html/_static/*
	fi

	newinitd "${FILESDIR}/knot.init" knot
	systemd_dounit "${FILESDIR}/knot.service"
}

pkg_postinst() {
	enewgroup knot 53
	enewuser knot 53 -1 /var/lib/knot knot
}
