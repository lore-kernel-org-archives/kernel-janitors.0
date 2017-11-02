From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 08:01:39 +0000
Subject: [PATCH 3/3] regulator/core: Adjust 18 checks for null pointers
Message-Id: <27bc701c-f8cb-150b-6b3d-df90eb3702d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <471498fb-58af-46d4-2150-614c0f9cdc22@users.sourceforge.net>
In-Reply-To: <471498fb-58af-46d4-2150-614c0f9cdc22@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 22:40:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/regulator/core.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 28859c186c9f..4aaf7e40524d 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1168,7 +1168,7 @@ static int set_supply(struct regulator_dev *rdev,
 		return -ENODEV;
 
 	rdev->supply = create_regulator(supply_rdev, &rdev->dev, "SUPPLY");
-	if (rdev->supply = NULL) {
+	if (!rdev->supply) {
 		err = -ENOMEM;
 		return err;
 	}
@@ -1195,10 +1195,10 @@ static int set_consumer_device_supply(struct regulator_dev *rdev,
 	struct regulator_map *node;
 	int has_dev;
 
-	if (supply = NULL)
+	if (!supply)
 		return -EINVAL;
 
-	if (consumer_dev_name != NULL)
+	if (consumer_dev_name)
 		has_dev = 1;
 	else
 		has_dev = 0;
@@ -1224,7 +1224,7 @@ static int set_consumer_device_supply(struct regulator_dev *rdev,
 	}
 
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
-	if (node = NULL)
+	if (!node)
 		return -ENOMEM;
 
 	node->regulator = rdev;
@@ -1232,7 +1232,7 @@ static int set_consumer_device_supply(struct regulator_dev *rdev,
 
 	if (has_dev) {
 		node->dev_name = kstrdup(consumer_dev_name, GFP_KERNEL);
-		if (node->dev_name = NULL) {
+		if (!node->dev_name) {
 			kfree(node);
 			return -ENOMEM;
 		}
@@ -1315,7 +1315,7 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 	int err, size;
 
 	regulator = kzalloc(sizeof(*regulator), GFP_KERNEL);
-	if (regulator = NULL)
+	if (!regulator)
 		return NULL;
 
 	mutex_lock(&rdev->mutex);
@@ -1332,7 +1332,7 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 			goto overflow_err;
 
 		regulator->supply_name = kstrdup(buf, GFP_KERNEL);
-		if (regulator->supply_name = NULL)
+		if (!regulator->supply_name)
 			goto overflow_err;
 
 		err = sysfs_create_link_nowarn(&rdev->dev.kobj, &dev->kobj,
@@ -1344,7 +1344,7 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 		}
 	} else {
 		regulator->supply_name = kstrdup_const(supply_name, GFP_KERNEL);
-		if (regulator->supply_name = NULL)
+		if (!regulator->supply_name)
 			goto overflow_err;
 	}
 
@@ -1599,7 +1599,7 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (id = NULL) {
+	if (!id) {
 		pr_err("get() with no identifier\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -1671,7 +1671,7 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 	}
 
 	regulator = create_regulator(rdev, dev, id);
-	if (regulator = NULL) {
+	if (!regulator) {
 		regulator = ERR_PTR(-ENOMEM);
 		put_device(&rdev->dev);
 		module_put(rdev->owner);
@@ -1965,7 +1965,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 		return ret;
 
 	pin = kzalloc(sizeof(*pin), GFP_KERNEL);
-	if (pin = NULL) {
+	if (!pin) {
 		gpio_free(config->ena_gpio);
 		return -ENOMEM;
 	}
@@ -3982,13 +3982,13 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	struct device *dev;
 	int ret, i;
 
-	if (regulator_desc = NULL || cfg = NULL)
+	if (!regulator_desc || !cfg)
 		return ERR_PTR(-EINVAL);
 
 	dev = cfg->dev;
 	WARN_ON(!dev);
 
-	if (regulator_desc->name = NULL || regulator_desc->ops = NULL)
+	if (!regulator_desc->name || !regulator_desc->ops)
 		return ERR_PTR(-EINVAL);
 
 	if (regulator_desc->type != REGULATOR_VOLTAGE &&
@@ -4012,7 +4012,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	}
 
 	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
-	if (rdev = NULL)
+	if (!rdev)
 		return ERR_PTR(-ENOMEM);
 
 	/*
@@ -4020,7 +4020,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	 * parsing init data.
 	 */
 	config = kmemdup(cfg, sizeof(*cfg), GFP_KERNEL);
-	if (config = NULL) {
+	if (!config) {
 		kfree(rdev);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -4154,7 +4154,7 @@ EXPORT_SYMBOL_GPL(regulator_register);
  */
 void regulator_unregister(struct regulator_dev *rdev)
 {
-	if (rdev = NULL)
+	if (!rdev)
 		return;
 
 	if (rdev->supply) {
-- 
2.14.3

