From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 13 Oct 2012 00:04:07 +0000
Subject: [dynticks:nohz/printk 2/5] kernel/timer.c:1354:2: error: implicit declaration of function 'arch_irq_
Message-Id: <20121013000407.GA27431@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, kernel build failed on

tree:   git://github.com/fweisbec/linux-dynticks.git nohz/printk
head:   f72ce6fbecebcf9faeaa740754ac71474758c1f6
commit: 772082cbc0f9dccc7ae141fcbcca66aff6b8ac69 [2/5] irq_work: Only run irq_work from tick if arch needs it
config: sparc64-defconfig # make ARCH=sparc64 defconfig

All error/warnings:

kernel/timer.c: In function 'update_process_times':
kernel/timer.c:1354:2: error: implicit declaration of function 'arch_irq_work_use_tick' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +1354 kernel/timer.c

^1da177e Linus Torvalds      2005-04-16  1348  	/* Note: this timer irq context must be accounted for as well. */
fa13a5a1 Paul Mackerras      2007-11-09  1349  	account_process_tick(p, user_tick);
^1da177e Linus Torvalds      2005-04-16  1350  	run_local_timers();
a157229c Paul E. McKenney    2009-08-22  1351  	rcu_check_callbacks(cpu, user_tick);
b845b517 Peter Zijlstra      2008-08-08  1352  	printk_tick();
e360adbe Peter Zijlstra      2010-10-14  1353  #ifdef CONFIG_IRQ_WORK
772082cb Frederic Weisbecker 2012-10-12 @1354  	if (arch_irq_work_use_tick() && in_irq())
e360adbe Peter Zijlstra      2010-10-14  1355  		irq_work_run();
e360adbe Peter Zijlstra      2010-10-14  1356  #endif
^1da177e Linus Torvalds      2005-04-16  1357  	scheduler_tick();

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
