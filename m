From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 11:02:54 +0000
Subject: [pinctrl:nomadik-multiplatform 16/16] drivers/pinctrl/pinctrl-nomadik.c:212:2: error: implicit decla
Message-Id: <20121020110254.GB5714@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Linus,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git nomadik-multiplatform
head:   2e88a0fdda1be5962b7e548ab487686daa5d9754
commit: 2e88a0fdda1be5962b7e548ab487686daa5d9754 [16/16] ARM: ux500: convert to multiplatorm
config: arm-imx_v6_v7_defconfig # make ARCH=arm 

All error/warnings:

In file included from drivers/pinctrl/pinctrl-nomadik.c:33:0:
include/linux/mfd/dbx500-prcmu.h:459:19: error: redefinition of 'prcmu_abb_read'
include/linux/mfd/db8500-prcmu.h:673:19: note: previous definition of 'prcmu_abb_read' was here
include/linux/mfd/dbx500-prcmu.h:464:19: error: redefinition of 'prcmu_abb_write'
include/linux/mfd/db8500-prcmu.h:678:19: note: previous definition of 'prcmu_abb_write' was here
include/linux/mfd/dbx500-prcmu.h:475:19: error: redefinition of 'prcmu_config_clkout'
include/linux/mfd/db8500-prcmu.h:643:19: note: previous definition of 'prcmu_config_clkout' was here
include/linux/mfd/dbx500-prcmu.h:537:19: error: redefinition of 'prcmu_ac_wake_req'
include/linux/mfd/db8500-prcmu.h:683:19: note: previous definition of 'prcmu_ac_wake_req' was here
include/linux/mfd/dbx500-prcmu.h:542:20: error: redefinition of 'prcmu_ac_sleep_req'
include/linux/mfd/db8500-prcmu.h:688:20: note: previous definition of 'prcmu_ac_sleep_req' was here
drivers/pinctrl/pinctrl-nomadik.c: In function 'nmk_gpio_disable_lazy_irq':
drivers/pinctrl/pinctrl-nomadik.c:212:2: error: implicit declaration of function 'NOMADIK_GPIO_TO_IRQ' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +212 drivers/pinctrl/pinctrl-nomadik.c

01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  196  	__nmk_gpio_set_mode(nmk_chip, offset, gpio_mode);
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  197  
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  198  	if (glitch && nmk_chip->set_ioforce) {
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  199  		nmk_chip->set_ioforce(false);
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  200  
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  201  		writel(rwimsc, nmk_chip->addr + NMK_GPIO_RWIMSC);
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  202  		writel(fwimsc, nmk_chip->addr + NMK_GPIO_FWIMSC);
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  203  	}
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  204  }
01727e61 arch/arm/plat-nomadik/gpio.c Rabin Vincent 2010-12-13  205  
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  206  static void
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  207  nmk_gpio_disable_lazy_irq(struct nmk_gpio_chip *nmk_chip, unsigned offset)
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  208  {
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  209  	u32 falling = nmk_chip->fimsc & BIT(offset);
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  210  	u32 rising = nmk_chip->rimsc & BIT(offset);
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  211  	int gpio = nmk_chip->chip.base + offset;
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23 @212  	int irq = NOMADIK_GPIO_TO_IRQ(gpio);
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  213  	struct irq_data *d = irq_get_irq_data(irq);
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  214  
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  215  	if (!rising && !falling)
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  216  		return;
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  217  
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  218  	if (!d || !irqd_irq_disabled(d))
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  219  		return;
6c42ad1c drivers/gpio/gpio-nomadik.c  Rabin Vincent 2011-05-23  220  

The code at line 212 was first introduced by commit:
6c42ad1 gpio/nomadik: fix spurious interrupts with SKE


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
