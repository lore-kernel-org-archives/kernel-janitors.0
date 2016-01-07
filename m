From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jan 2016 10:03:08 +0000
Subject: [patch] regulator: core: remove some dead code
Message-Id: <20160107100308.GA27487@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Originally queue_delayed_work() used to negative error codes or 0 and 1
on success depending if the work was queued or not.  It caused a lot of
bugs where people treated all non-zero returns as failures so we changed
it to return bool instead in d4283e937861 ('workqueue: make queueing
functions return bool').  Now it never returns failure.

Checking for negative values causes a static checker warning since it is
impossible based on the bool type.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 3308c6b..744c988 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2368,7 +2368,6 @@ static void regulator_disable_work(struct work_struct *work)
 int regulator_disable_deferred(struct regulator *regulator, int ms)
 {
 	struct regulator_dev *rdev = regulator->rdev;
-	int ret;
 
 	if (regulator->always_on)
 		return 0;
@@ -2380,13 +2379,9 @@ int regulator_disable_deferred(struct regulator *regulator, int ms)
 	rdev->deferred_disables++;
 	mutex_unlock(&rdev->mutex);
 
-	ret = queue_delayed_work(system_power_efficient_wq,
-				 &rdev->disable_work,
-				 msecs_to_jiffies(ms));
-	if (ret < 0)
-		return ret;
-	else
-		return 0;
+	queue_delayed_work(system_power_efficient_wq, &rdev->disable_work,
+			   msecs_to_jiffies(ms));
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regulator_disable_deferred);
 
