From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 02:07:07 +0000
Subject: [signal:master 89/93] arch/sh/kernel/signal_32.c:249:2: error: implicit declaration of function 'sys
Message-Id: <20120921020707.GB21076@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
head:   d38625a1fb0a7adcc79f97c37d3afde2981aa02a
commit: 9d5523cd164dd6ace6a8154a1c9d4f1c01fefdab [89/93] sh: sigaltstack conversion
config: sh-allnoconfig

All related error/warning messages:

arch/sh/kernel/signal_32.c: In function 'sys_rt_sigreturn':
arch/sh/kernel/signal_32.c:249:2: error: implicit declaration of function 'sys_sigaltstack' [-Werror=implicit-function-declaration]
cc1: all warnings being treated as errors

vim +249 arch/sh/kernel/signal_32.c
   243	
   244		set_current_blocked(&set);
   245	
   246		if (restore_sigcontext(regs, &frame->uc.uc_mcontext, &r0))
   247			goto badframe;
   248	
 > 249		if (sys_sigaltstack(&frame->uc.uc_stack, NULL) = -EFAULT)
   250			goto badframe;
   251	
   252		return r0;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
