From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Oct 2012 16:42:37 +0000
Subject: drivers/pinctrl/pinctrl-at91.c:841:12: warning: assignment discards 'const' qualifier from pointer t
Message-Id: <20121012164237.GE19120@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jean-Christophe,

FYI, there are new compile warnings show up in

commit: 7f46dcb289fd5970296718ce20046792dfbc00a8  ARM: at91: add pinctrl support
config: arm-at91_dt_defconfig # make ARCH=arm at91_dt_defconfig

All warnings:

drivers/pinctrl/pinctrl-at91.c: In function 'at91_pinctrl_probe_dt':
drivers/pinctrl/pinctrl-at91.c:841:12: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
drivers/pinctrl/pinctrl-at91.c: In function 'at91_gpio_probe':
drivers/pinctrl/pinctrl-at91.c:1382:17: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]

vim +841 drivers/pinctrl/pinctrl-at91.c

7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  825  	{ /* sentinel */ }
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  826  };
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  827  
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  828  static int __devinit at91_pinctrl_probe_dt(struct platform_device *pdev,
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  829  					   struct at91_pinctrl *info)
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  830  {
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  831  	int ret = 0;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  832  	int i, j;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  833  	uint32_t *tmp;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  834  	struct device_node *np = pdev->dev.of_node;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  835  	struct device_node *child;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  836  
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  837  	if (!np)
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  838  		return -ENODEV;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  839  
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  840  	info->dev = &pdev->dev;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12 @841  	info->ops 7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  842  		of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  843  	at91_pinctrl_child_count(info, np);
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  844  
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  845  	if (info->nbanks < 1) {
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  846  		dev_err(&pdev->dev, "you need to specify atleast one gpio-controller\n");
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  847  		return -EINVAL;
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  848  	}
7f46dcb2 Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  849  

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
