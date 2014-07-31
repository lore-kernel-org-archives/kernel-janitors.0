From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jul 2014 10:54:07 +0000
Subject: re: pinctrl: abx500: fix abx500_gpio_dbg_show_one() to show pull up/down
Message-Id: <20140731105407.GA12583@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ This is not very new, sorry.  -dan ]

Hello Patrice Chotard,

This is a semi-automatic email about new static checker warnings.

The patch d2752ae54d4a: "pinctrl: abx500: fix 
abx500_gpio_dbg_show_one() to show pull up/down" from May 24, 2013, 
leads to the following Smatch complaint:

drivers/pinctrl/nomadik/pinctrl-abx500.c:623 abx500_gpio_dbg_show_one()
	 warn: variable dereferenced before check 'pctldev' (see line 573)

drivers/pinctrl/nomadik/pinctrl-abx500.c
   572	{
   573		struct abx500_pinctrl *pct = pinctrl_dev_get_drvdata(pctldev);
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Patch adds a new unchecked dereference.

   574		const char *label = gpiochip_is_requested(chip, offset - 1);
   575		u8 gpio_offset = offset - 1;
   576		int mode = -1;
   577		bool is_out;
   578		bool pd;
   579		enum abx500_gpio_pull_updown pud = 0;
   580		int ret;
   581	
   582		const char *modes[] = {
   583			[ABX500_DEFAULT]	= "default",
   584			[ABX500_ALT_A]		= "altA",
   585			[ABX500_ALT_B]		= "altB",
   586			[ABX500_ALT_C]		= "altC",
   587		};
   588	
   589		const char *pull_up_down[] = {
   590			[ABX500_GPIO_PULL_DOWN]		= "pull down",
   591			[ABX500_GPIO_PULL_NONE]		= "pull none",
   592			[ABX500_GPIO_PULL_NONE + 1]	= "pull none",
   593			[ABX500_GPIO_PULL_UP]		= "pull up",
   594		};
   595	
   596		ret = abx500_gpio_get_bit(chip, AB8500_GPIO_DIR1_REG,
   597				gpio_offset, &is_out);
   598		if (ret < 0)
   599			goto out;
   600	
   601		seq_printf(s, " gpio-%-3d (%-20.20s) %-3s",
   602			   gpio, label ?: "(none)",
   603			   is_out ? "out" : "in ");
   604	
   605		if (!is_out) {
   606			if (abx500_pullud_supported(chip, offset)) {
   607				ret = abx500_get_pull_updown(pct, offset, &pud);
   608				if (ret < 0)
   609					goto out;
   610	
   611				seq_printf(s, " %-9s", pull_up_down[pud]);
   612			} else {
   613				ret = abx500_gpio_get_bit(chip, AB8500_GPIO_PUD1_REG,
   614						gpio_offset, &pd);
   615				if (ret < 0)
   616					goto out;
   617	
   618				seq_printf(s, " %-9s", pull_up_down[pd]);
   619			}
   620		} else
   621			seq_printf(s, " %-9s", chip->get(chip, offset) ? "hi" : "lo");
   622	
   623		if (pctldev)
                    ^^^^^^^
The existing code assumes "pctldev" can be NULL.

   624			mode = abx500_get_mode(pctldev, chip, offset);
   625	

regards,
dan carpenter
