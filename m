From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 04 Aug 2012 16:50:45 +0000
Subject: [PATCH 2/6] drivers/mfd: drop frees of devm allocated data
Message-Id: <1344099049-15212-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_kfree should not have to be explicitly used.
devm_regmap_init_i2c also does not require an explicit free.

The semantic patch that fixes the first problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,d;
@@

x = devm_kzalloc(...)
...
?-devm_kfree(d,x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mfd/88pm800.c |    5 +----
 drivers/mfd/88pm80x.c |   20 +++-----------------
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index b67a301..a2e5bd8 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -530,7 +530,7 @@ static int __devinit pm800_probe(struct i2c_client *client,
 	ret = device_800_init(chip, pdata);
 	if (ret) {
 		dev_err(chip->dev, "%s id 0x%x failed!\n", __func__, chip->id);
-		goto err_800_init;
+		goto err_subchip_alloc;
 	}
 
 	ret = pm800_pages_init(chip);
@@ -545,8 +545,6 @@ static int __devinit pm800_probe(struct i2c_client *client,
 err_page_init:
 	mfd_remove_devices(chip->dev);
 	device_irq_exit_800(chip);
-err_800_init:
-	devm_kfree(&client->dev, subchip);
 err_subchip_alloc:
 	pm80x_deinit(client);
 out_init:
@@ -561,7 +559,6 @@ static int __devexit pm800_remove(struct i2c_client *client)
 	device_irq_exit_800(chip);
 
 	pm800_pages_exit(chip);
-	devm_kfree(&client->dev, chip->subchip);
 
 	pm80x_deinit(client);
 
diff --git a/drivers/mfd/88pm80x.c b/drivers/mfd/88pm80x.c
index cd0bf52..2bd090e 100644
--- a/drivers/mfd/88pm80x.c
+++ b/drivers/mfd/88pm80x.c
@@ -45,17 +45,14 @@ int __devinit pm80x_init(struct i2c_client *client,
 
 	map = devm_regmap_init_i2c(client, &pm80x_regmap_config);
 	if (IS_ERR(map)) {
-		ret = PTR_ERR(map);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
 			ret);
-		goto err_regmap_init;
+		return PTR_ERR(map);
 	}
 
 	chip->id = id->driver_data;
-	if (chip->id < CHIP_PM800 || chip->id > CHIP_PM805) {
-		ret = -EINVAL;
-		goto err_chip_id;
-	}
+	if (chip->id < CHIP_PM800 || chip->id > CHIP_PM805)
+		return -EINVAL;
 
 	chip->client = client;
 	chip->regmap = map;
@@ -82,19 +79,11 @@ int __devinit pm80x_init(struct i2c_client *client,
 	}
 
 	return 0;
-
-err_chip_id:
-	regmap_exit(map);
-err_regmap_init:
-	devm_kfree(&client->dev, chip);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(pm80x_init);
 
 int pm80x_deinit(struct i2c_client *client)
 {
-	struct pm80x_chip *chip = i2c_get_clientdata(client);
-
 	/*
 	 * workaround: clear the dependency between pm800 and pm805.
 	 * would remove it after HW chip fixes the issue.
@@ -104,9 +93,6 @@ int pm80x_deinit(struct i2c_client *client)
 	else
 		g_pm80x_chip = NULL;
 
-	regmap_exit(chip->regmap);
-	devm_kfree(&client->dev, chip);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pm80x_deinit);

