From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Oct 2012 10:10:32 +0000
Subject: [parisc:for-next 1/1] include/linux/irq.h:361:24: fatal error: asm/hw_irq.h: No such file or directo
Message-Id: <20121014101032.GA7572@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi James,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git for-next
head:   07abad0579de44f8250dfee5ddc253062d050dc0
commit: 07abad0579de44f8250dfee5ddc253062d050dc0 [1/1] [PARISC] asm: redo generic includes
config: parisc-defconfig # make ARCH=parisc defconfig

All error/warnings:

In file included from include/asm-generic/hardirq.h:12:0,
                 from arch/parisc/include/asm/hardirq.h:9,
                 from include/linux/hardirq.h:7,
                 from arch/parisc/kernel/asm-offsets.c:34:
include/linux/irq.h:361:24: fatal error: asm/hw_irq.h: No such file or directory
compilation terminated.

vim +361 include/linux/irq.h

d4d5e089 Thomas Gleixner   2011-02-10  345   */
d4d5e089 Thomas Gleixner   2011-02-10  346  enum {
d4d5e089 Thomas Gleixner   2011-02-10  347  	IRQCHIP_SET_TYPE_MASKED		= (1 <<  0),
77694b40 Thomas Gleixner   2011-02-15  348  	IRQCHIP_EOI_IF_HANDLED		= (1 <<  1),
d209a699 Thomas Gleixner   2011-03-11  349  	IRQCHIP_MASK_ON_SUSPEND		= (1 <<  2),
b3d42232 Thomas Gleixner   2011-03-27  350  	IRQCHIP_ONOFFLINE_ENABLED	= (1 <<  3),
60f96b41 Santosh Shilimkar 2011-09-09  351  	IRQCHIP_SKIP_SET_WAKE		= (1 <<  4),
dc9b229a Thomas Gleixner   2012-07-13  352  	IRQCHIP_ONESHOT_SAFE		= (1 <<  5),
d4d5e089 Thomas Gleixner   2011-02-10  353  };
d4d5e089 Thomas Gleixner   2011-02-10  354  
e144710b Thomas Gleixner   2010-10-01  355  /* This include will go away once we isolated irq_desc usage to core code */
e144710b Thomas Gleixner   2010-10-01  356  #include <linux/irqdesc.h>
0b8f1efa Yinghai Lu        2008-12-05  357  
34ffdb72 Ingo Molnar       2006-06-29  358  /*
34ffdb72 Ingo Molnar       2006-06-29  359   * Pick up the arch-dependent methods:
34ffdb72 Ingo Molnar       2006-06-29  360   */
34ffdb72 Ingo Molnar       2006-06-29 @361  #include <asm/hw_irq.h>
^1da177e Linus Torvalds    2005-04-16  362  
b683de2b Thomas Gleixner   2010-09-27  363  #ifndef NR_IRQS_LEGACY
b683de2b Thomas Gleixner   2010-09-27  364  # define NR_IRQS_LEGACY 0
b683de2b Thomas Gleixner   2010-09-27  365  #endif
b683de2b Thomas Gleixner   2010-09-27  366  
1318a481 Thomas Gleixner   2010-09-27  367  #ifndef ARCH_IRQ_INIT_FLAGS
1318a481 Thomas Gleixner   2010-09-27  368  # define ARCH_IRQ_INIT_FLAGS	0
1318a481 Thomas Gleixner   2010-09-27  369  #endif

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
