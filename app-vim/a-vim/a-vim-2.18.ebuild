# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/nerdcommenter/nerdcommenter-2.1.18.ebuild,v 1.1 2008/09/21 12:07:34 hawking Exp $

VIM_PLUGIN_VIM_VERSION=7.0
inherit vim-plugin

DESCRIPTION="vim plugin: A few of quick commands to swtich between source files
and header files quickly"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=31"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=7218"
LICENSE="public-domain"
KEYWORDS="~amd64 ~x86"
IUSE=""
S=${WORKDIR}

src_unpack () {
	cd ${S}
	mkdir plugin
	cp ${DISTDIR}/${A} plugin/a.vim
}
