From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 08 Dec 2012 16:16:45 +0000
Subject: [PATCH] drivers/power/88pm860x_battery.c: use devm_request_threaded_irq
Message-Id: <1354986995-2324-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <cbou@mail.ru>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_request_threaded_irq requests and irq that is freed when a driver
detaches.  This patch uses devm_request_threaded_irq for irqs that are
requested in the probe function of a platform device and are only freed in
the remove function.

Additionally, the original code used devm_kzalloc, but kfree.  This would
lead to a double free.  The problem was found using the following semantic
match (http://coccinelle.lip6.fr/):

// <smpl>
@@
expression x,e;
@@
x = devm_kzalloc(...)
... when != x = e
?-kfree(x,...);
// </smpl>

The error handling code in the probe function is also simplified in the
cases where there is now nothing to do other than return.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/power/88pm860x_battery.c |   24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/power/88pm860x_battery.c b/drivers/power/88pm860x_battery.c
index 8bc80b0..b808177 100644
--- a/drivers/power/88pm860x_battery.c
+++ b/drivers/power/88pm860x_battery.c
@@ -915,15 +915,13 @@ static int pm860x_battery_probe(struct platform_device *pdev)
 	info->irq_cc = platform_get_irq(pdev, 0);
 	if (info->irq_cc <= 0) {
 		dev_err(&pdev->dev, "No IRQ resource!\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	info->irq_batt = platform_get_irq(pdev, 1);
 	if (info->irq_batt <= 0) {
 		dev_err(&pdev->dev, "No IRQ resource!\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	info->chip = chip;
@@ -957,10 +955,10 @@ static int pm860x_battery_probe(struct platform_device *pdev)
 
 	ret = power_supply_register(&pdev->dev, &info->battery);
 	if (ret)
-		goto out;
+		return ret;
 	info->battery.dev->parent = &pdev->dev;
 
-	ret = request_threaded_irq(info->irq_cc, NULL,
+	ret = devm_request_threaded_irq(&pdev->dev, info->irq_cc, NULL,
 				pm860x_coulomb_handler, IRQF_ONESHOT,
 				"coulomb", info);
 	if (ret < 0) {
@@ -969,23 +967,20 @@ static int pm860x_battery_probe(struct platform_device *pdev)
 		goto out_reg;
 	}
 
-	ret = request_threaded_irq(info->irq_batt, NULL, pm860x_batt_handler,
-				IRQF_ONESHOT, "battery", info);
+	ret = devm_request_threaded_irq(&pdev->dev, info->irq_batt, NULL,
+					pm860x_batt_handler,
+					IRQF_ONESHOT, "battery", info);
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to request IRQ: #%d: %d\n",
 			info->irq_batt, ret);
-		goto out_coulomb;
+		goto out_reg;
 	}
 
 
 	return 0;
 
-out_coulomb:
-	free_irq(info->irq_cc, info);
 out_reg:
 	power_supply_unregister(&info->battery);
-out:
-	kfree(info);
 	return ret;
 }
 
@@ -994,9 +989,6 @@ static int pm860x_battery_remove(struct platform_device *pdev)
 	struct pm860x_battery_info *info = platform_get_drvdata(pdev);
 
 	power_supply_unregister(&info->battery);
-	free_irq(info->irq_batt, info);
-	free_irq(info->irq_cc, info);
-	kfree(info);
 	platform_set_drvdata(pdev, NULL);
 	return 0;
 }

