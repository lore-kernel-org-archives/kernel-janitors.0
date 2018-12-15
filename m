From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 15 Dec 2018 09:41:52 +0000
Subject: [bug report] regulator: axp20x: add support for set_ramp_delay for AXP209
Message-Id: <20181215094152.GA6075@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Olliver Schinagl,

This is a semi-automatic email about new static checker warnings.

The patch d29f54df8b16: "regulator: axp20x: add support for 
set_ramp_delay for AXP209" from Dec 11, 2018, leads to the following 
Smatch complaint:

    drivers/regulator/axp20x-regulator.c:375 axp20x_set_ramp_delay()
    warn: variable dereferenced before check 'rdev' (see line 369)

drivers/regulator/axp20x-regulator.c
   368	{
   369		struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
                                                             ^^^^
   370		const struct regulator_desc *desc = rdev->desc;
                                                    ^^^^^^^^^^
Dereferences

   371		u8 reg, mask, enable, cfg = 0xff;
   372		const int *slew_rates;
   373		int rate_count = 0;
   374	
   375		if (!rdev)
                    ^^^^^
Check too late.

   376			return -EINVAL;
   377	

regards,
dan carpenter
