From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 02:06:58 +0000
Subject: [signal:master 81/93] arch/m32r/kernel/signal.c:106:2: error: implicit declaration of function 'sys_
Message-Id: <20120921020658.GA21076@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
head:   d38625a1fb0a7adcc79f97c37d3afde2981aa02a
commit: dc40dcb629a5a335d78997445d7bb3e5512af6ed [81/93] m32r: convert sigaltstack()
config: m32r-m32104ut_defconfig

All related error/warning messages:

arch/m32r/kernel/signal.c: In function 'sys_rt_sigreturn':
arch/m32r/kernel/signal.c:106:2: error: implicit declaration of function 'sys_sigaltstack' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +106 arch/m32r/kernel/signal.c
   100	
   101		set_current_blocked(&set);
   102	
   103		if (restore_sigcontext(regs, &frame->uc.uc_mcontext, &result))
   104			goto badframe;
   105	
 > 106		if (sys_sigaltstack(&frame->uc.uc_stack, NULL) = -EFAULT)
   107			goto badframe;
   108	
   109		return result;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
