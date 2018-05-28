# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_VENDOR=( "github.com/orcaman/concurrent-map a05df785d2dcc16310fb997ee1702100d047cfe1"
	"golang.org/x/net f1d3149ecb40ffadf4a28d39a30f9a125fe57bdf github.com/golang/net"
	"github.com/igm/sockjs-go c8a8c6429d10e3b6865960ad8cb43779b8a834ef"
	"github.com/gobwas/glob f00a7392b43971b2fdb562418faab1f18da2067a"
	"gopkg.in/ini.v1 6529cf7c58879c08d927016dde4477f18a0634cb github.com/go-ini/ini"
	"github.com/OneOfOne/xxhash 84bd68eb036df97d139c0ca2cf33b0cf671dcc1b"
	"rsc.io/letsencrypt 800d85d42bc784015c7189f6fad2d342ad65dd99 github.com/rsc/letsencrypt"
	"github.com/gorilla/websocket 21ab95fa12b9bdd8fecf5fa3586aad941cc98785" )

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/kiwiirc/webircgateway"

if [[ ${PV} = *9999* ]]; then
	KEYWORDS=""
	EGO_COMMIT="cb966d1d79a3d03dc62775a331a2638f2a6b6a5c"
	SRC_URI="https://${EGO_PN}/archive/${EGO_COMMIT}.tar.gz -> ${PN}-${EGO_COMMIT}.tar.gz
	${EGO_VENDOR_URI}"
else
	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
	KEYWORDS="~arm ~amd64"
fi

DESCRIPTION="Websocket gateway to IRC networks."
HOMEPAGE="https://${EGO_PN}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
DEPEND="dev-go/go-text"

src_install() {
	dobin ${PN}
	newinitd "${FILESDIR}"/${PN}.init ${PN}

	insinto /etc/
	newins "${S}/src/${EGO_PN}/config.conf.example" kiwiirc-webircgateway.conf
}
