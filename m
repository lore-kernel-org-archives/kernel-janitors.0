From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 08:50:41 +0000
Subject: [PATCH 1/8] rtc-ab-b5ze-s3: Better exception handling in abb5zes3_probe()
Message-Id: <5688E0E1.4020502@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688DF2D.6090204@users.sourceforge.net>
In-Reply-To: <5688DF2D.6090204@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Jan 2016 07:07:49 +0100

This issue was detected by using the Coccinelle software.

* Return directly before the data structure element "irq" was assigned.

* Drop the explicit initialisation for the variable "data"
  at the beginning then.

* Adjust jump targets according to the Linux coding style convention.

* Simplify a condition check at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index a319bf1..1291206 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -889,35 +889,31 @@ static const struct regmap_config abb5zes3_rtc_regmap_config = {
 static int abb5zes3_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
-	struct abb5zes3_rtc_data *data = NULL;
+	struct abb5zes3_rtc_data *data;
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
 				     I2C_FUNC_SMBUS_BYTE_DATA |
-				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
-		ret = -ENODEV;
-		goto err;
-	}
+				     I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
 
 	regmap = devm_regmap_init_i2c(client, &abb5zes3_rtc_regmap_config);
 	if (IS_ERR(regmap)) {
 		ret = PTR_ERR(regmap);
 		dev_err(dev, "%s: regmap allocation failed: %d\n",
 			__func__, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = abb5zes3_i2c_validate_chip(regmap);
 	if (ret)
-		goto err;
+		return ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!data)
+		return -ENOMEM;
 
 	mutex_init(&data->lock);
 	data->regmap = regmap;
@@ -925,7 +921,7 @@ static int abb5zes3_probe(struct i2c_client *client,
 
 	ret = abb5zes3_rtc_check_setup(dev);
 	if (ret)
-		goto err;
+		return ret;
 
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
@@ -940,7 +936,7 @@ static int abb5zes3_probe(struct i2c_client *client,
 		} else {
 			dev_err(dev, "%s: irq %d unavailable (%d)\n",
 				__func__, client->irq, ret);
-			goto err;
+			return ret;
 		}
 	}
 
@@ -950,7 +946,7 @@ static int abb5zes3_probe(struct i2c_client *client,
 	if (ret) {
 		dev_err(dev, "%s: unable to register RTC device (%d)\n",
 			__func__, ret);
-		goto err;
+		goto check_irq;
 	}
 
 	/* Enable battery low detection interrupt if battery not already low */
@@ -959,12 +955,12 @@ static int abb5zes3_probe(struct i2c_client *client,
 		if (ret) {
 			dev_err(dev, "%s: enabling battery low interrupt "
 				"generation failed (%d)\n", __func__, ret);
-			goto err;
+			goto check_irq;
 		}
 	}
-
-err:
-	if (ret && data && data->irq)
+	return 0;
+check_irq:
+	if (data->irq)
 		device_init_wakeup(dev, false);
 	return ret;
 }
-- 
2.6.3

