From: Dan Carpenter <error27@gmail.com>
Date: Thu, 10 Jun 2010 07:54:31 +0000
Subject: [patch] input: error handling bug in lm8323_probe()
Message-Id: <20100610075431.GK5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Richard Purdie <rpurdie@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

We reuse the "i" variable later on so if we goto fail3 or fail4 then "i"
will be set to the wrong thing and cause a crash.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index 40b032f..f7c2a16 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -642,6 +642,7 @@ static int __devinit lm8323_probe(struct i2c_client *client,
 	struct lm8323_platform_data *pdata = client->dev.platform_data;
 	struct input_dev *idev;
 	struct lm8323_chip *lm;
+	int pwm;
 	int i, err;
 	unsigned long tmo;
 	u8 data[2];
@@ -710,8 +711,9 @@ static int __devinit lm8323_probe(struct i2c_client *client,
 		goto fail1;
 	}
 
-	for (i = 0; i < LM8323_NUM_PWMS; i++) {
-		err = init_pwm(lm, i + 1, &client->dev, pdata->pwm_names[i]);
+	for (pwm = 0; pwm < LM8323_NUM_PWMS; pwm++) {
+		err = init_pwm(lm, pwm + 1, &client->dev,
+			       pdata->pwm_names[pwm]);
 		if (err < 0)
 			goto fail2;
 	}
@@ -764,9 +766,9 @@ fail4:
 fail3:
 	device_remove_file(&client->dev, &dev_attr_disable_kp);
 fail2:
-	while (--i >= 0)
-		if (lm->pwm[i].enabled)
-			led_classdev_unregister(&lm->pwm[i].cdev);
+	while (--pwm >= 0)
+		if (lm->pwm[pwm].enabled)
+			led_classdev_unregister(&lm->pwm[pwm].cdev);
 fail1:
 	input_free_device(idev);
 	kfree(lm);
