From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 20 Sep 2012 10:57:11 +0000
Subject: [signal:master 55/67] kernel/signal.c:3119:35: error: 'current_pt_regs' undeclared
Message-Id: <20120920105711.GA20021@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
head:   956761f1dcc9e6aa894da19b991a087e5ca10812
commit: e51df018265e482f41993d80c1635634340e59ea [55/67] arm: sigaltstack conversion
config: arm-at91_dt_defconfig

All related error/warning messages:

kernel/signal.c: In function 'sys_sigaltstack':
kernel/signal.c:3119:35: error: 'current_pt_regs' undeclared (first use in this function)
kernel/signal.c:3119:35: note: each undeclared identifier is reported only once for each function it appears in
kernel/signal.c:3120:1: warning: control reaches end of non-void function [-Wreturn-type]

vim +3119 kernel/signal.c
  3113		return error;
  3114	}
  3115	
  3116	#ifdef __ARCH_WANT_SYS_SIGALTSTACK
  3117	SYSCALL_DEFINE2(sigaltstack, const stack_t __user *, uss, stack_t *, uoss)
  3118	{
> 3119		return do_sigaltstack(uss, uoss, current_user_stack_pointer());
  3120	}
  3121	#endif
  3122	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
