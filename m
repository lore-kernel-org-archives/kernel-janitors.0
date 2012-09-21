From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 12:44:37 +0000
Subject: [linux-next] drivers/mfd/88pm860x-core.c:982:11: error: too few arguments to function 'mfd_add_devic
Message-Id: <20120921124437.GA18287@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Hein,

FYI, kernel build failed possibly since

commit a830d28b48bf92944e57058e87d17cee5a7cd2a1
Author:     Jett.Zhou <jtzhou@marvell.com>
AuthorDate: Fri Jul 27 16:27:16 2012 +0800
Commit:     Anton Vorontsov <anton.vorontsov@linaro.org>
CommitDate: Thu Sep 20 15:32:55 2012 -0700

    power_supply: Enable battery-charger for 88pm860x


drivers/mfd/88pm860x-core.c:982:11: error: too few arguments to function 'mfd_add_devices'

vim +982 drivers/mfd/88pm860x-core.c
   966	
   967		power_devs[2].platform_data = &preg_init_data;
   968		power_devs[2].pdata_size = sizeof(struct regulator_init_data);
   969		ret = mfd_add_devices(chip->dev, 0, &power_devs[2], 1,
   970				      NULL, chip->irq_base, NULL);
   971		if (ret < 0)
   972			dev_err(chip->dev, "Failed to add preg subdev\n");
   973	
   974		if (pdata->chg_desc) {
   975			pdata->chg_desc->charger_regulators    976				&chg_desc_regulator_data[0];
   977			pdata->chg_desc->num_charger_regulators	   978				ARRAY_SIZE(chg_desc_regulator_data),
   979			power_devs[3].platform_data = pdata->chg_desc;
   980			power_devs[3].pdata_size = sizeof(*pdata->chg_desc);
   981			ret = mfd_add_devices(chip->dev, 0, &power_devs[3], 1,
 > 982					      NULL, chip->irq_base);
   983			if (ret < 0)
   984				dev_err(chip->dev, "Failed to add chg-manager subdev\n");
   985		}
   986	}
   987	
   988	static void __devinit device_onkey_init(struct pm860x_chip *chip,
   989						struct pm860x_platform_data *pdata)
   990	{

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
