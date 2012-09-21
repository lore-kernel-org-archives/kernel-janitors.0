From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 07:19:26 +0000
Subject: [signal:master 94/94] kernel/signal.c:3119:35: error: expected identifier before '(' token
Message-Id: <20120921071926.GA1253@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
head:   1320d2cc9be60744e2e0bbb73f8e2653a77bf59c
commit: 1320d2cc9be60744e2e0bbb73f8e2653a77bf59c [94/94] mips: sigaltstack conversion
config: mips-allnoconfig

All related error/warning messages:

kernel/signal.c: In function 'sys_sigaltstack':
kernel/signal.c:3119:35: error: expected identifier before '(' token
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
