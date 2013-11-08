From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 10:06:50 +0000
Subject: re: pinctrl: abx500: fix abx500_gpio_dbg_show_one() to show pull up/down
Message-Id: <20131108100650.GW27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Patrice Chotard,

This is a semi-automatic email about new static checker warnings.

The patch d2752ae54d4a: "pinctrl: abx500: fix 
abx500_gpio_dbg_show_one() to show pull up/down" from May 24, 2013, 
leads to the following Smatch complaint:

drivers/pinctrl/pinctrl-abx500.c:624 abx500_gpio_dbg_show_one()
	 warn: variable dereferenced before check 'pctldev' (see line 574)

drivers/pinctrl/pinctrl-abx500.c
   573	{
   574		struct abx500_pinctrl *pct = pinctrl_dev_get_drvdata(pctldev);
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Patch introduces new unchecked dereference.

   575		const char *label = gpiochip_is_requested(chip, offset - 1);
   576		u8 gpio_offset = offset - 1;
   577		int mode = -1;
   578		bool is_out;
   579		bool pd;
   580		enum abx500_gpio_pull_updown pud = 0;
   581		int ret;
   582	

[snip]

   618	
   619				seq_printf(s, " %-9s", pull_up_down[pd]);
   620			}
   621		} else
   622			seq_printf(s, " %-9s", chip->get(chip, offset) ? "hi" : "lo");
   623	
   624		if (pctldev)
                    ^^^^^^^
Existing check is too late.

   625			mode = abx500_get_mode(pctldev, chip, offset);
   626	

regards,
dan carpenter
