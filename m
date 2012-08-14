From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 14 Aug 2012 20:38:57 +0000
Subject: [tip:auto-latest 25/37] kernel/softirq.c:843:36: sparse: incorrect type in initializer (different ad
Message-Id: <20120814203857.GD20732@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Thomas,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git auto-latest
head:   e42942691c8262b7fe2a7b88577623082b988217
commit: 3e339b5dae24a7065e196eb8d0145ab2f8cc2d2d [25/37] softirq: Use hotplug thread infrastructure

All sparse warnings:

  kernel/softirq.c:408:8: sparse: symbol 'tasklet_vec' was not declared. Should it be static?
  kernel/softirq.c:409:8: sparse: symbol 'tasklet_hi_vec' was not declared. Should it be static?
+ kernel/softirq.c:843:36: sparse: incorrect type in initializer (different address spaces)
  kernel/softirq.c:843:36:    expected struct task_struct [noderef] <asn:3>**store
  kernel/softirq.c:843:36:    got struct task_struct *[noderef] [toplevel] <asn:3>*<noident>

vim +843 kernel/softirq.c
   840	};
   841	
   842	static struct smp_hotplug_thread softirq_threads = {
 > 843		.store			= &ksoftirqd,
   844		.thread_should_run	= ksoftirqd_should_run,
   845		.thread_fn		= run_ksoftirqd,
   846		.thread_comm		= "ksoftirqd/%u",

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
