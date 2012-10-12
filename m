From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Oct 2012 18:24:08 +0000
Subject: [dynticks:nohz/printk 1/5] include/linux/irq_work.h:5:26: fatal error: asm/irq_work.h: No such file
Message-Id: <20121012182408.GB24093@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, kernel build failed on

tree:   git://github.com/fweisbec/linux-dynticks.git nohz/printk
head:   f72ce6fbecebcf9faeaa740754ac71474758c1f6
commit: ed0f263e94f74a833ad1829e6acc218857f8e735 [1/5] irq_work: Move irq_work_raise() declaration/default definition to arch headers
config: cris-allyesconfig # make ARCH=cris allyesconfig

All error/warnings:

In file included from include/linux/perf_event.h:647:0,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from kernel/fork.c:39:
include/linux/irq_work.h:5:26: fatal error: asm/irq_work.h: No such file or directory
compilation terminated.

vim +5 include/linux/irq_work.h

e360adbe Peter Zijlstra      2010-10-14  1  #ifndef _LINUX_IRQ_WORK_H
e360adbe Peter Zijlstra      2010-10-14  2  #define _LINUX_IRQ_WORK_H
e360adbe Peter Zijlstra      2010-10-14  3  
38aaf809 Huang Ying          2011-09-08  4  #include <linux/llist.h>
ed0f263e Frederic Weisbecker 2012-10-12 @5  #include <asm/irq_work.h>
38aaf809 Huang Ying          2011-09-08  6  
e360adbe Peter Zijlstra      2010-10-14  7  struct irq_work {
38aaf809 Huang Ying          2011-09-08  8  	unsigned long flags;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
