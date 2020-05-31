From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 14:06:11 +0000
Subject: Re: [PATCH v2] iio: magnetometer: ak8974: Fix runtime PM imbalance on error in ak8974_probe()
Message-Id: <dd84c12f-277d-27e7-3727-4592e530e4ed@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, Linus Walleij <linus.walleij@linaro.org>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Kangjie Lu <kjlu@umn.edu>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>

> When devm_regmap_init_i2c() returns an error code, a pairing
> runtime PM usage counter decrement is needed to keep the
> counter balanced.

How do you think about to replace the word “pairing” by “corresponding”?


> For error paths after ak8974_set_power(),
> ak8974_detect() and ak8974_reset(), things are the same.

Will an other wording become more helpful than this information?


> However, When iio_triggered_buffer_setup() returns an error
> code, there will be two PM usgae counter decrements.

Please avoid two typos in this sentence.


Would you like to add the tag “Fixes” to the commit message?


…
+++ b/drivers/iio/magnetometer/ak8974.c
…
@@ -854,7 +856,6 @@  static int ak8974_probe(struct i2c_client *i2c,
…

Can a source code variant like the following make sense
for a more complete exception handling?

power_off:
	ak8974_set_power(ak8974, AK8974_PWR_OFF);
put_pm:
	pm_runtime_put_noidle(&i2c->dev);
	pm_runtime_disable(&i2c->dev);
disable_regulator:
	regulator_bulk_disable(ARRAY_SIZE(ak8974->regs), ak8974->regs);
	return ret;


Regards,
Markus
