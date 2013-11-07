From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 08:06:17 +0000
Subject: [patch] pm2301-charger: remove unneeded NULL checks
Message-Id: <20131107080617.GQ21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <anton@enomsg.org>, Lee Jones <lee.jones@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If "pm2" were NULL we would oops printing the error message.
Fortunately, that's not possible so I have removed the NULL checks.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/power/pm2301_charger.c b/drivers/power/pm2301_charger.c
index b733c69..62c15af 100644
--- a/drivers/power/pm2301_charger.c
+++ b/drivers/power/pm2301_charger.c
@@ -957,37 +957,24 @@ static int  pm2xxx_runtime_suspend(struct device *dev)
 {
 	struct i2c_client *pm2xxx_i2c_client = to_i2c_client(dev);
 	struct pm2xxx_charger *pm2;
-	int ret = 0;
 
 	pm2 = (struct pm2xxx_charger *)i2c_get_clientdata(pm2xxx_i2c_client);
-	if (!pm2) {
-		dev_err(pm2->dev, "no pm2xxx_charger data supplied\n");
-		ret = -EINVAL;
-		return ret;
-	}
-
 	clear_lpn_pin(pm2);
 
-	return ret;
+	return 0;
 }
 
 static int  pm2xxx_runtime_resume(struct device *dev)
 {
 	struct i2c_client *pm2xxx_i2c_client = to_i2c_client(dev);
 	struct pm2xxx_charger *pm2;
-	int ret = 0;
 
 	pm2 = (struct pm2xxx_charger *)i2c_get_clientdata(pm2xxx_i2c_client);
-	if (!pm2) {
-		dev_err(pm2->dev, "no pm2xxx_charger data supplied\n");
-		ret = -EINVAL;
-		return ret;
-	}
 
 	if (gpio_is_valid(pm2->lpn_pin) && gpio_get_value(pm2->lpn_pin) = 0)
 		set_lpn_pin(pm2);
 
-	return ret;
+	return 0;
 }
 
 #endif
