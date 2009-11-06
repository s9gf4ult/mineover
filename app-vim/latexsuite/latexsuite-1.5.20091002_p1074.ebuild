# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit vim-plugin versionator

MY_P="vim-latex-$(get_version_component_range 1-2)-$(get_version_component_range 3)-r${PV/*_p}"

DESCRIPTION="vim plugin: a comprehensive set of tools to view, edit and compile
LaTeX documents"
HOMEPAGE="http://vim-latex.sourceforge.net/"
SRC_URI="mirror://sourceforge/vim-latex/snapshots/${MY_P}.tar.gz"
LICENSE="vim"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"

RDEPEND="virtual/latex-base"

VIM_PLUGIN_HELPFILES="latex-suite.txt latex-suite-quickstart.txt latexhelp.txt
imaps.txt"

src_prepare() {
	rm Makefile* doc/Makefile* doc/README*
}

src_install() {
	dobin ltags
	rm ltags
	vim-plugin_src_install
}

pkg_postinst() {
	vim-plugin_pkg_postinst
	elog
	elog "To use the latexSuite plugin add:"
	elog "   filetype plugin on"
	elog '   set grepprg=grep\ -nH\ $*'
	elog "to your ~/.vimrc-file"
	elog
}

