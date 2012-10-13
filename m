From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 13 Oct 2012 01:14:25 +0000
Subject: [dynticks:nohz/printk 1/5] include/linux/irqdesc.h:73:33: error: 'NR_IRQS' undeclared here (not in a
Message-Id: <20121013011425.GA29336@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012182408.GB24093@localhost>
In-Reply-To: <20121012182408.GB24093@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, kernel build failed on

tree:   git://github.com/fweisbec/linux-dynticks.git nohz/printk
head:   f72ce6fbecebcf9faeaa740754ac71474758c1f6
commit: ed0f263e94f74a833ad1829e6acc218857f8e735 [1/5] irq_work: Move irq_work_raise() declaration/default definition to arch headers
config: sparc-defconfig # make ARCH=sparc defconfig

All error/warnings:

In file included from include/linux/irq.h:356:0,
                 from include/asm-generic/hardirq.h:12,
                 from arch/sparc/include/asm/hardirq_32.h:11,
                 from arch/sparc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:7,
                 from include/linux/interrupt.h:12,
                 from arch/sparc/mm/fault_32.c:22:
include/linux/irqdesc.h:73:33: error: 'NR_IRQS' undeclared here (not in a function)

vim +73 include/linux/irqdesc.h

cd7eab44 Ben Hutchings             2011-01-19  57  	struct irq_affinity_notify *affinity_notify;
e144710b Thomas Gleixner           2010-10-01  58  #ifdef CONFIG_GENERIC_PENDING_IRQ
e144710b Thomas Gleixner           2010-10-01  59  	cpumask_var_t		pending_mask;
e144710b Thomas Gleixner           2010-10-01  60  #endif
e144710b Thomas Gleixner           2010-10-01  61  #endif
b5faba21 Thomas Gleixner           2011-02-23  62  	unsigned long		threads_oneshot;
e144710b Thomas Gleixner           2010-10-01  63  	atomic_t		threads_active;
e144710b Thomas Gleixner           2010-10-01  64  	wait_queue_head_t       wait_for_threads;
e144710b Thomas Gleixner           2010-10-01  65  #ifdef CONFIG_PROC_FS
e144710b Thomas Gleixner           2010-10-01  66  	struct proc_dir_entry	*dir;
e144710b Thomas Gleixner           2010-10-01  67  #endif
b6873807 Sebastian Andrzej Siewior 2011-07-11  68  	struct module		*owner;
e144710b Thomas Gleixner           2010-10-01  69  	const char		*name;
e144710b Thomas Gleixner           2010-10-01  70  } ____cacheline_internodealigned_in_smp;
e144710b Thomas Gleixner           2010-10-01  71  
e144710b Thomas Gleixner           2010-10-01  72  #ifndef CONFIG_SPARSE_IRQ
e144710b Thomas Gleixner           2010-10-01 @73  extern struct irq_desc irq_desc[NR_IRQS];
e144710b Thomas Gleixner           2010-10-01  74  #endif
e144710b Thomas Gleixner           2010-10-01  75  
e144710b Thomas Gleixner           2010-10-01  76  #ifdef CONFIG_GENERIC_HARDIRQS
e144710b Thomas Gleixner           2010-10-01  77  
d9936bb3 Thomas Gleixner           2011-03-11  78  static inline struct irq_data *irq_desc_get_irq_data(struct irq_desc *desc)
d9936bb3 Thomas Gleixner           2011-03-11  79  {
d9936bb3 Thomas Gleixner           2011-03-11  80  	return &desc->irq_data;
d9936bb3 Thomas Gleixner           2011-03-11  81  }

The code at line 73 was first introduced by commit:
e144710 genirq: Distangle irq.h


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
