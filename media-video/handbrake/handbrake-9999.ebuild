# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils subversion

MY_P="HandBrake-${PV}"
DESCRIPTION="Open-source DVD to MPEG-4 converter."
HOMEPAGE="http://handbrake.fr/"
ESVN_REPO_URI="svn://svn.handbrake.fr/HandBrake/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+gtk"

RDEPEND="gtk? (	>=x11-libs/gtk+-2.8
			>=net-libs/webkit-gtk-1 )
			>=media-libs/gstreamer-0.10
			x11-libs/libnotify"
DEPEND="sys-libs/zlib
	dev-lang/python
	$RDEPEND"

S="${WORKDIR}/HandBrake"

src_configure () {
	cd ${S}
	./configure --prefix=${PREFIX} $(use_enable gtk) || die "configure failed"
}

src_compile() {
	cd ${S}/build
	emake ||die "emake has died"
}

src_install() {
	cd ${S}/build
	emake DESTDIR=${D} install || die "install died"
}

