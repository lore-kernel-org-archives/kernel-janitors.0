From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Sep 2012 00:50:21 +0000
Subject: [tty:tty-next 10/16] fs/compat_ioctl.c:869:1: error: 'TIOCSRS485' undeclared here (not in a function
Message-Id: <20120922005021.GM5959@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaeden Amero <jaeden.amero@ni.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, linux-serial@vger.kernel.org

Hi Jaeden,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
head:   ac57e7f38ea6fe7358cd0b7a2f2d21aef5ab70cd
commit: 84c3b84860440a9e3a3666c14112f41311b8f623 [10/16] compat_ioctl: Add RS-485 IOCTLs to the list
config: mips-fuloong2e_defconfig

All related error/warning messages:

fs/compat_ioctl.c:869:1: error: 'TIOCSRS485' undeclared here (not in a function)
fs/compat_ioctl.c:870:1: error: 'TIOCGRS485' undeclared here (not in a function)

vim +869 fs/compat_ioctl.c
   863	COMPATIBLE_IOCTL(TIOCSPGRP)
   864	COMPATIBLE_IOCTL(TIOCGPGRP)
   865	COMPATIBLE_IOCTL(TIOCGPTN)
   866	COMPATIBLE_IOCTL(TIOCSPTLCK)
   867	COMPATIBLE_IOCTL(TIOCSERGETLSR)
   868	COMPATIBLE_IOCTL(TIOCSIG)
 > 869	COMPATIBLE_IOCTL(TIOCSRS485)
   870	COMPATIBLE_IOCTL(TIOCGRS485)
   871	#ifdef TCGETS2
   872	COMPATIBLE_IOCTL(TCGETS2)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
