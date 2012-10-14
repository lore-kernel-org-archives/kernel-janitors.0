From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Oct 2012 02:26:15 +0000
Subject: [signal:master 26/36] arch/mn10300/kernel/signal.c:188:2: error: implicit declaration of function 's
Message-Id: <20121014022615.GB6795@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
head:   4777474d7fd941142a914d54350cd34584f8ca14
commit: c8320e4430c3079ae3fddf42089eb26bfb898f70 [26/36] mn10300: sigaltstack conversion
config: mn10300-asb2364_defconfig # make ARCH=mn10300 asb2364_defconfig
branch date: 44 minutes ago
commit date: 46 minutes ago

All error/warnings:

arch/mn10300/kernel/signal.c: In function 'sys_rt_sigreturn':
arch/mn10300/kernel/signal.c:188:2: error: implicit declaration of function 'sys_sigaltstack' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +188 arch/mn10300/kernel/signal.c

b920de1b David Howells 2008-02-08  182  
00f35785 Matt Fleming  2012-05-11  183  	set_current_blocked(&set);
b920de1b David Howells 2008-02-08  184  
c8320e44 Al Viro       2012-09-20  185  	if (restore_sigcontext(&frame->uc.uc_mcontext, &d0))
b920de1b David Howells 2008-02-08  186  		goto badframe;
b920de1b David Howells 2008-02-08  187  
c8320e44 Al Viro       2012-09-20 @188  	if (sys_sigaltstack(&frame->uc.uc_stack, NULL) = -EFAULT)
b920de1b David Howells 2008-02-08  189  		goto badframe;
b920de1b David Howells 2008-02-08  190  
b920de1b David Howells 2008-02-08  191  	return d0;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
