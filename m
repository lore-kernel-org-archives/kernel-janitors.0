From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jun 2013 14:05:22 +0000
Subject: re: mfd: 88pm800: Enhance sub devices initialization
Message-Id: <20130618140521.GA9128@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Chao Xie,

This is a semi-automatic email about new static checker warnings.

The patch 1e9f033e4b6c: "mfd: 88pm800: Enhance sub devices 
initialization" from Jun 14, 2013, leads to the following Smatch 
complaint:

drivers/mfd/88pm800.c:504 device_800_init()
	 error: we previously assumed 'pdata' could be null (see line 480)

drivers/mfd/88pm800.c
   479		if (val & PM800_ALARM_WAKEUP) {
   480			if (pdata && pdata->rtc)
                            ^^^^^
Old check.

   481				pdata->rtc->rtc_wakeup = 1;
   482		}
   483	
   484		ret = device_gpadc_init(chip, pdata);
   485		if (ret < 0) {
   486			dev_err(chip->dev, "[%s]Failed to init gpadc\n", __func__);
   487			goto out;
   488		}
   489	
   490		chip->regmap_irq_chip = &pm800_irq_chip;
   491	
   492		ret = device_irq_init_800(chip);
   493		if (ret < 0) {
   494			dev_err(chip->dev, "[%s]Failed to init pm800 irq\n", __func__);
   495			goto out;
   496		}
   497	
   498		ret = device_onkey_init(chip, pdata);
   499		if (ret) {
   500			dev_err(chip->dev, "Failed to add onkey subdev\n");
   501			goto out_dev;
   502		}
   503	
   504		ret = device_rtc_init(chip, pdata);
                                            ^^^^^
New dereference.

   505		if (ret) {
   506			dev_err(chip->dev, "Failed to add rtc subdev\n");

regards,
dan carpenter
