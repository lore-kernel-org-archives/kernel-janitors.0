From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jun 2014 19:22:34 +0000
Subject: [patch] staging: iio/ad7291: fix error code in ad7291_probe()
Message-Id: <20140620192234.GD19824@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lars-Peter Clausen <lars@metafoo.de>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Sachin Kamat <sachin.kamat@linaro.org>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

We should be returning a negative error code instead of success here.

This would have been detected by GCC, except that the "ret" variable was
initialized with a bogus value to disable GCC's uninitialized variable
warnings.  I've cleaned that up, as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/iio/adc/ad7291.c b/drivers/staging/iio/adc/ad7291.c
index 357cef2..7194bd1 100644
--- a/drivers/staging/iio/adc/ad7291.c
+++ b/drivers/staging/iio/adc/ad7291.c
@@ -465,7 +465,7 @@ static int ad7291_probe(struct i2c_client *client,
 	struct ad7291_platform_data *pdata = client->dev.platform_data;
 	struct ad7291_chip_info *chip;
 	struct iio_dev *indio_dev;
-	int ret = 0;
+	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
 	if (!indio_dev)
@@ -475,7 +475,7 @@ static int ad7291_probe(struct i2c_client *client,
 	if (pdata && pdata->use_external_ref) {
 		chip->reg = devm_regulator_get(&client->dev, "vref");
 		if (IS_ERR(chip->reg))
-			return ret;
+			return PTR_ERR(chip->reg);
 
 		ret = regulator_enable(chip->reg);
 		if (ret)
