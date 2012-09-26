From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 17:02:17 +0000
Subject: [aarch64:soc-armv8-model 10/41] drivers/irqchip/gic.c:399:2: error: 'handle_arch_irq' undeclared
Message-Id: <20120926170217.GD25467@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Marc,

FYI, kernel build failed on

commit: dd584bb4775f75768183329c3ca52252bb0b6d12 [10/41] irqchip: Add ARM Generic Interrupt Controller support
config: arm-imx_v6_v7_defconfig

All error/warnings:

drivers/irqchip/gic.c: In function 'gic_init':
drivers/irqchip/gic.c:399:2: error: 'handle_arch_irq' undeclared (first use in this function)
drivers/irqchip/gic.c:399:2: note: each undeclared identifier is reported only once for each function it appears in

vim +399 drivers/irqchip/gic.c
   393			return;
   394	
   395		gic_dist_init(gic);
   396		gic_cpu_init(gic);
   397	
   398		/* Update the architecture handler */
 > 399		handle_arch_irq = gic_handle_irq;
   400	}
   401	
   402	#ifdef CONFIG_SMP

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
