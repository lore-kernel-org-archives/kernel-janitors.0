From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 13:07:15 +0000
Subject: [tip:master 27/35] kernel/sched/fair.c:791: warning: 'task_h_load' declared 'static' but never defin
Message-Id: <20120928130715.GB5158@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   2ef756a2e79149dc84c88f7ccc42ec38cbb7722e
commit: 4ae834f767c59b42cdf2a5077a18388525ba78b2 [27/35] sched/numa: Implement NUMA home-node selection code
config: avr32-atngw100_defconfig

All warnings:

kernel/sched/fair.c:791: warning: 'task_h_load' declared 'static' but never defined
kernel/sched/fair.c:909: warning: 'account_offnode_enqueue' defined but not used

vim +791 kernel/sched/fair.c

305e6835 kernel/sched_fair.c (Venkatesh Pallipadi 2010-10-04  775) 	se->exec_start = rq_of(cfs_rq)->clock_task;
bf0f6f24 kernel/sched_fair.c (Ingo Molnar         2007-07-09  776) }
bf0f6f24 kernel/sched_fair.c (Ingo Molnar         2007-07-09  777) 
bf0f6f24 kernel/sched_fair.c (Ingo Molnar         2007-07-09  778) /**************************************************
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  779)  * Scheduling class numa methods.
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  780)  *
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  781)  * The purpose of the NUMA bits are to maintain compute (task) and data
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  782)  * (memory) locality. We try and achieve this by making tasks stick to
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  783)  * a particular node (their home node) but if fairness mandates they run
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  784)  * elsewhere for long enough, we let the memory follow them.
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  785)  *
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  786)  * Tasks start out with their home-node unset (-1) this effectively means
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  787)  * they act !NUMA until we've established the task is busy enough to bother
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  788)  * with placement.
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  789)  */
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  790) 
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16 @791) static unsigned long task_h_load(struct task_struct *p);
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  792) 
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  793) #ifdef CONFIG_SCHED_NUMA
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  794) static void account_offnode_enqueue(struct rq *rq, struct task_struct *p)
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  795) {
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  796) 	p->numa_contrib = task_h_load(p);
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  797) 	rq->offnode_weight += p->numa_contrib;
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  798) 	rq->offnode_running++;
4ae834f7 kernel/sched/fair.c (Peter Zijlstra      2012-07-16  799) }

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
