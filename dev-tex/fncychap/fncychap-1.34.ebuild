# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils latex-package

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://mirror.ctan.org/macros/latex/contrib/fncychap.zip"
S="${W}/${PN}"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile () {
	cd ${S}
	latex-package-src_compile 
}

src_install () {
	cd ${S}
	latex-package_src_doinstall sty
	if use doc; then
		dodoc README
		dodoc fncychap.pdf
	fi
}

