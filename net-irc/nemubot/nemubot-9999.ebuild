# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{4,5,6,7,8} )

inherit distutils-r1 user

DESCRIPTION="Nemunaire's IM bot"
HOMEPAGE="https://bot.nemunai.re/"

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="git://git.nemunai.re/nemubot.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/nemunaire/nemubot/archive/v${PV/_/-}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm"
fi

LICENSE="AGPL-3"
SLOT="0"
IUSE="backup +capstone +dns"

# TODO: append ratp.trafic
RDEPEND="
	backup? ( app-arch/bzip2 virtual/cron )
	app-text/aspell
	capstone? ( dev-libs/capstone[python,${PYTHON_USEDEP}] )
	dns? ( dev-python/dnspython[${PYTHON_USEDEP}] )
	dev-python/beautifulsoup[${PYTHON_USEDEP}]
	dev-python/unidecode[${PYTHON_USEDEP}]
	net-misc/youtube-dl[${PYTHON_USEDEP}]
	www-client/w3m
"
DEPEND="${RDEPEND}"

python_install() {
	distutils-r1_python_install

	newinitd "${FILESDIR}/nemubot.init" nemubot

	keepdir /var/lib/nemubot/data
	fowners nemubot:nemubot /var/lib/nemubot/data

	insinto /var/lib/nemubot/modules
	cp -R "${S}/modules" "${D}/var/lib/nemubot/" || die "Install failed during modules copy!"

	insinto /etc/
	newins "${S}/bot_sample.xml" nemubot.conf

	if use backup; then
		keepdir /var/lib/nemubot/backup
		insinto /etc/cron.d
		newins "${FILESDIR}/backup_crontab" "nemubot_backup"
	fi
}

pkg_setup() {
	enewgroup nemubot
	enewuser nemubot -1 -1 /var/lib/nemubot nemubot
}
