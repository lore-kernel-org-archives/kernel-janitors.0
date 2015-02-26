From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Feb 2015 20:40:46 +0000
Subject: [patch] regulator: core: remove some unneeded conditions
Message-Id: <20150226204046.GE6820@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These always true or always false conditions cause static checker
warnings.

The check prior to checking "if (pin->enable_count <= 1) {" is
"if (pin->enable_count > 1) ", so we know that ->enable_count is <= 1
already and can delete the check.

The queue_delayed_work() function is type bool so the return value can
never be less than zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index f245214..9606bb7 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1758,11 +1758,9 @@ static int regulator_ena_gpio_ctrl(struct regulator_dev *rdev, bool enable)
 		}
 
 		/* Disable GPIO if not used */
-		if (pin->enable_count <= 1) {
-			gpiod_set_value_cansleep(pin->gpiod,
-						 pin->ena_gpio_invert);
-			pin->enable_count = 0;
-		}
+		gpiod_set_value_cansleep(pin->gpiod,
+					 pin->ena_gpio_invert);
+		pin->enable_count = 0;
 	}
 
 	return 0;
@@ -2146,7 +2144,6 @@ static void regulator_disable_work(struct work_struct *work)
 int regulator_disable_deferred(struct regulator *regulator, int ms)
 {
 	struct regulator_dev *rdev = regulator->rdev;
-	int ret;
 
 	if (regulator->always_on)
 		return 0;
@@ -2158,13 +2155,10 @@ int regulator_disable_deferred(struct regulator *regulator, int ms)
 	rdev->deferred_disables++;
 	mutex_unlock(&rdev->mutex);
 
-	ret = queue_delayed_work(system_power_efficient_wq,
-				 &rdev->disable_work,
-				 msecs_to_jiffies(ms));
-	if (ret < 0)
-		return ret;
-	else
-		return 0;
+	queue_delayed_work(system_power_efficient_wq,
+			   &rdev->disable_work,
+			   msecs_to_jiffies(ms));
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regulator_disable_deferred);
 
