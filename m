From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 17 Oct 2012 04:35:48 +0000
Subject: [signal:master 38/39] arch/x86/kernel/signal.c:810:1: error: conflicting types for 'do_notify_resume
Message-Id: <20121017043548.GA16264@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
head:   af2357bcc89277780537db6479b3b757193a849a
commit: d9d195410bd397d1b4bb7ee6b337bbf127a9f009 [38/39] x86: kill pt_regs argument of do_notify_resume()
config: x86_64-allyesconfig # make ARCH=x86_64 

All error/warnings:

arch/x86/kernel/signal.c:810:1: error: conflicting types for 'do_notify_resume'
In file included from include/linux/signal.h:4:0,
                 from include/linux/sched.h:72,
                 from arch/x86/kernel/signal.c:12:
arch/x86/include/asm/signal.h:129:13: note: previous declaration of 'do_notify_resume' was here

vim +810 arch/x86/kernel/signal.c

^1da177e arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  804  
^1da177e arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  805  /*
^1da177e arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  806   * notification of userspace execution resumption
283828f3 arch/i386/kernel/signal.c   David Howells       2006-01-18  807   * - triggered by the TIF_WORK_MASK flags
^1da177e arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  808   */
7e907f48 arch/x86/kernel/signal_32.c Ingo Molnar         2008-03-06  809  void
d9d19541 arch/x86/kernel/signal.c    Al Viro             2012-05-31 @810  do_notify_resume(struct pt_regs *regs, __u32 thread_info_flags)
^1da177e arch/i386/kernel/signal.c   Linus Torvalds      2005-04-16  811  {
edf55fda arch/x86/kernel/signal.c    Frederic Weisbecker 2012-07-11  812  	rcu_user_exit();
edf55fda arch/x86/kernel/signal.c    Frederic Weisbecker 2012-07-11  813  

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
