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
IUSE="+gtk -asm"

RDEPEND="gtk? (	>=x11-libs/gtk+-2.8
			>=net-libs/webkit-gtk-1 )
			>=media-libs/gstreamer-0.10
			x11-libs/libnotify"
DEPEND="sys-libs/zlib
	dev-lang/python
	$RDEPEND"

S="${WORKDIR}/HandBrake"

src_compile() {
	econf $(use_enable gtk) \
		$(use_enable asm)||die "confugure died: it seems you used asm flag turn it
		off and try again "
	cd ${S}/build
	emake ||die "emake has died"
}

src_install() {
	emake DESTDIR=${D} install || die "install died"
}

