From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 11:03:36 +0000
Subject: [pinctrl:nomadik-multiplatform 16/16] drivers/pinctrl/pinctrl-nomadik.c:1705:15: error: variable 'nm
Message-Id: <20121020110336.GD5714@localhost>
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
config: arm-s3c2410_defconfig # make ARCH=arm 

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
drivers/pinctrl/pinctrl-nomadik.c:1705:15: error: variable 'nmk_pinmux_ops' has initializer but incomplete type
drivers/pinctrl/pinctrl-nomadik.c:1706:2: error: unknown field 'get_functions_count' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1706:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1706:2: warning: (near initialization for 'nmk_pinmux_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1707:2: error: unknown field 'get_function_name' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1707:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1707:2: warning: (near initialization for 'nmk_pinmux_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1708:2: error: unknown field 'get_function_groups' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1708:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1708:2: warning: (near initialization for 'nmk_pinmux_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1709:2: error: unknown field 'enable' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1709:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1709:2: warning: (near initialization for 'nmk_pinmux_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1710:2: error: unknown field 'disable' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1710:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1710:2: warning: (near initialization for 'nmk_pinmux_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1711:2: error: unknown field 'gpio_request_enable' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1711:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1711:2: warning: (near initialization for 'nmk_pinmux_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1712:2: error: unknown field 'gpio_disable_free' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1712:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1712:2: warning: (near initialization for 'nmk_pinmux_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1821:15: error: variable 'nmk_pinconf_ops' has initializer but incomplete type
drivers/pinctrl/pinctrl-nomadik.c:1822:2: error: unknown field 'pin_config_get' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1822:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1822:2: warning: (near initialization for 'nmk_pinconf_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1823:2: error: unknown field 'pin_config_set' specified in initializer
drivers/pinctrl/pinctrl-nomadik.c:1823:2: warning: excess elements in struct initializer [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:1823:2: warning: (near initialization for 'nmk_pinconf_ops') [enabled by default]
drivers/pinctrl/pinctrl-nomadik.c:660:12: warning: 'nmk_prcm_gpiocr_get_mode' defined but not used [-Wunused-function]
cc1: some warnings being treated as errors

vim +1705 drivers/pinctrl/pinctrl-nomadik.c

dbfe8ca2 Linus Walleij 2012-05-02  1689  	__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
dbfe8ca2 Linus Walleij 2012-05-02  1690  	clk_disable(nmk_chip->clk);
dbfe8ca2 Linus Walleij 2012-05-02  1691  
dbfe8ca2 Linus Walleij 2012-05-02  1692  	return 0;
dbfe8ca2 Linus Walleij 2012-05-02  1693  }
dbfe8ca2 Linus Walleij 2012-05-02  1694  
dbfe8ca2 Linus Walleij 2012-05-02  1695  void nmk_gpio_disable_free(struct pinctrl_dev *pctldev,
dbfe8ca2 Linus Walleij 2012-05-02  1696  			   struct pinctrl_gpio_range *range,
dbfe8ca2 Linus Walleij 2012-05-02  1697  			   unsigned offset)
dbfe8ca2 Linus Walleij 2012-05-02  1698  {
dbfe8ca2 Linus Walleij 2012-05-02  1699  	struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
dbfe8ca2 Linus Walleij 2012-05-02  1700  
dbfe8ca2 Linus Walleij 2012-05-02  1701  	dev_dbg(npct->dev, "disable pin %u as GPIO\n", offset);
dbfe8ca2 Linus Walleij 2012-05-02  1702  	/* Set the pin to some default state, GPIO is usually default */
dbfe8ca2 Linus Walleij 2012-05-02  1703  }
dbfe8ca2 Linus Walleij 2012-05-02  1704  
dbfe8ca2 Linus Walleij 2012-05-02 @1705  static struct pinmux_ops nmk_pinmux_ops = {
dbfe8ca2 Linus Walleij 2012-05-02  1706  	.get_functions_count = nmk_pmx_get_funcs_cnt,
dbfe8ca2 Linus Walleij 2012-05-02  1707  	.get_function_name = nmk_pmx_get_func_name,
dbfe8ca2 Linus Walleij 2012-05-02  1708  	.get_function_groups = nmk_pmx_get_func_groups,
dbfe8ca2 Linus Walleij 2012-05-02  1709  	.enable = nmk_pmx_enable,
dbfe8ca2 Linus Walleij 2012-05-02  1710  	.disable = nmk_pmx_disable,
dbfe8ca2 Linus Walleij 2012-05-02  1711  	.gpio_request_enable = nmk_gpio_request_enable,
dbfe8ca2 Linus Walleij 2012-05-02  1712  	.gpio_disable_free = nmk_gpio_disable_free,
dbfe8ca2 Linus Walleij 2012-05-02  1713  };

The code at line 1705 was first introduced by commit:
dbfe8ca pinctrl/nomadik: implement pin multiplexing


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
