From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Sep 2011 06:23:43 +0000
Subject: re: mfd: Support software initiated shutdown of WM831x PMICs
Message-Id: <20110921062343.GB4999@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mark Brown,

This is a semi-automatic email about new static checker warnings.

Thu Sep 15 18:54:53 2011 +0200
7ba771ee9c6f: "mfd: Support software initiated shutdown of WM831x PMICs"

Leads to the following Smatch complaint:
drivers/mfd/wm831x-core.c +1750 wm831x_device_init()
	 warn: variable dereferenced before check 'pdata' (see line 1625)

drivers/mfd/wm831x-core.c
  1624		dev_set_drvdata(wm831x->dev, wm831x);
  1625		wm831x->soft_shutdown = pdata->soft_shutdown;
                                        ^^^^^^^^^^^^^^^^^^^^
New dereference.

  1626	
  1627		ret = wm831x_reg_read(wm831x, WM831X_PARENT_ID);
  1628		if (ret < 0) {
  1629			dev_err(wm831x->dev, "Failed to read parent ID: %d\n", ret);
  1630			goto err_regmap;
  1631		}

	[snip]

  1743		if (ret != 0) {
  1744			dev_warn(wm831x->dev, "Security key had non-zero value %x\n",
  1745				 ret);
  1746			wm831x_reg_write(wm831x, WM831X_SECURITY_KEY, 0);
  1747		}
  1748		wm831x->locked = 1;
  1749	
  1750		if (pdata && pdata->pre_init) {
                    ^^^^^
Check for NULL.

  1751			ret = pdata->pre_init(wm831x);
  1752			if (ret != 0) {

regards,
dan carpenter
