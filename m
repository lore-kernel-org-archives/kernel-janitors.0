From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 04 Jun 2005 18:22:37 +0000
Subject: Multiple gccs (was Re: [KJ] [patch] wireless: char* -> char[]
Message-Id: <200506042222.38188.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 04 June 2005 20:38, randy_dunlap wrote:

[snip size(1) output of 3 gccs]

> For those of us who don't routinely have multiple gcc versions
> available, is there any trick to doing that?  Could give a small
> explanation?

On how to setup multiple gccs?

My default compiler is gcc 3.3.5.20050130-r1 which is stable compiler
according to Gentoo maintainers. 3.4.4 can be easily installed with:

	# ACCEPT_KEYWORDS="~x86" emerge sys-devel/gcc

Now for distro-neutral things.

2.95.3 and 4.1-20050522 live in /usr/local/gcc-* and where installed by hand.
Yeah, I know portage could do it, but I was lazy to read docs.

Downloads: ftp://ftp.gnu.org/gnu/gcc/

Keyword is "gcc-core". Same for 4.1 snapshots. Save bandwidth.

Actual installation. Mostly from Adrian's email about project to fix gcc 4
warnings. That's what I actually did.
======================================
$ tar xvzf gcc-core-2.95.3.tar.gz
$ mkdir gcc-2.95.3-build
$ cd gcc-2.95.3-build
$ ../gcc-2.95.3/configure \
	# skip gcc's internal testsuite, takes quite a while to pass
		--disable-checking \
	# It's a bloody stupid idea to have nls for gcc. Equally stupid to
	# having nls in kernel. Ever seen french warnings in emails? You can't
	# even google for similar ones when _your_ package/game/library don't
	# compile.
		--disable-nls \
	# C-only. Similar idea for cross-compiling: binutils and core gcc
	# _without_ glibc.
		--enable-languages=c \
	# To know what to rm -rf. Try to not screw existing gcc.
		--prefix=/usr/local/gcc-2.95.3
	[Wait ~1 minute]
$ make bootstrap
	[Wait much more. Even more for 4.1. Count the number of times build
	 system is figuring out how to run C preprocessor... Then do something
	 useful.]
$ su -c "make install"
	[Use it!]
$ make CC=/usr/local/gcc-2.95.3/bin/gcc <whatever>
======================================
Maybe I'll write similar text for cross-compilers. Those built with crosstool
on Fedora died.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
