From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 11:03:11 +0000
Subject: [pinctrl:nomadik-multiplatform 16/16] drivers/pinctrl/pinctrl-nomadik.c:1821:15: error: variable 'nm
Message-Id: <20121020110311.GC5714@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121020110254.GB5714@localhost>
In-Reply-To: <20121020110254.GB5714@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Linus,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git nomadik-multiplatform
head:   2e88a0fdda1be5962b7e548ab487686daa5d9754
commit: 2e88a0fdda1be5962b7e548ab487686daa5d9754 [16/16] ARM: ux500: convert to multiplatorm
config: arm-prima2_defconfig # make ARCH=arm 

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
drivers/pinctrl/pinctrl-nomadik.c: At top level:
drivers/pinctrl/pinctrl-nomadik.c:1821:15: error: variable 'nmk_pinconf_ops' has initializer but incomplete type
drivers/pinctrl/pinctrl-nomadik.c:1822:2: error: unknown field 'pin_config_get' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1822:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1822:2: warning: (near initialization for 'nmk_pinconf_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1823:2: error: unknown field 'pin_config_set' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1823:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1823:2: warning: (near initialization for 'nmk_pinconf_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:660:12: warning: 'nmk_prcm_gpiocr_get_mode' defined but not used [-Wunused-function]
cc1: some warnings being treated as errors

vim +1821 drivers/pinctrl/pinctrl-nomadik.c

d41af627 Linus Walleij 2012-05-03  1805  		/* No glitch when going to GPIO mode */
d41af627 Linus Walleij 2012-05-03  1806  		__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
d41af627 Linus Walleij 2012-05-03  1807  	if (output)
d41af627 Linus Walleij 2012-05-03  1808  		__nmk_gpio_make_output(nmk_chip, bit, val);
d41af627 Linus Walleij 2012-05-03  1809  	else {
d41af627 Linus Walleij 2012-05-03  1810  		__nmk_gpio_make_input(nmk_chip, bit);
d41af627 Linus Walleij 2012-05-03  1811  		__nmk_gpio_set_pull(nmk_chip, bit, pull);
d41af627 Linus Walleij 2012-05-03  1812  	}
d41af627 Linus Walleij 2012-05-03  1813  	/* TODO: isn't this only applicable on output pins? */
d41af627 Linus Walleij 2012-05-03  1814  	__nmk_gpio_set_lowemi(nmk_chip, bit, lowemi);
d41af627 Linus Walleij 2012-05-03  1815  
d41af627 Linus Walleij 2012-05-03  1816  	__nmk_gpio_set_slpm(nmk_chip, bit, slpm);
d41af627 Linus Walleij 2012-05-03  1817  	clk_disable(nmk_chip->clk);
d41af627 Linus Walleij 2012-05-03  1818  	return 0;
d41af627 Linus Walleij 2012-05-03  1819  }
d41af627 Linus Walleij 2012-05-03  1820  
d41af627 Linus Walleij 2012-05-03 @1821  static struct pinconf_ops nmk_pinconf_ops = {
d41af627 Linus Walleij 2012-05-03  1822  	.pin_config_get = nmk_pin_config_get,
d41af627 Linus Walleij 2012-05-03  1823  	.pin_config_set = nmk_pin_config_set,
d41af627 Linus Walleij 2012-05-03  1824  };
d41af627 Linus Walleij 2012-05-03  1825  
e98ea774 Linus Walleij 2012-04-26  1826  static struct pinctrl_desc nmk_pinctrl_desc = {
e98ea774 Linus Walleij 2012-04-26  1827  	.name = "pinctrl-nomadik",
e98ea774 Linus Walleij 2012-04-26  1828  	.pctlops = &nmk_pinctrl_ops,
dbfe8ca2 Linus Walleij 2012-05-02  1829  	.pmxops = &nmk_pinmux_ops,

The code at line 1821 was first introduced by commit:
d41af62 pinctrl/nomadik: implement pin configuration


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
