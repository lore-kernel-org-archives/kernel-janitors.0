From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 04 Aug 2012 16:50:44 +0000
Subject: [PATCH 1/6] drivers/thermal/rcar_thermal.c: drop frees of devm allocated data
Message-Id: <1344099049-15212-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_kfree and devm_iounmap should not have to be explicitly used.

The semantic patch that fixes one of these problems is as follows:
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
 drivers/thermal/rcar_thermal.c |   16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 2496b4f..9edbe04 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -206,16 +206,14 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 					  res->start, resource_size(res));
 	if (!priv->base) {
 		dev_err(&pdev->dev, "Unable to ioremap thermal register\n");
-		ret = -ENOMEM;
-		goto error_free_priv;
+		return -ENOMEM;
 	}
 
 	zone = thermal_zone_device_register("rcar_thermal", 0, priv,
 					    &rcar_thermal_zone_ops, 0, 0, 0, 0);
 	if (IS_ERR(zone)) {
 		dev_err(&pdev->dev, "thermal zone device is NULL\n");
-		ret = PTR_ERR(zone);
-		goto error_iounmap;
+		return PTR_ERR(zone);
 	}
 
 	platform_set_drvdata(pdev, zone);
@@ -223,13 +221,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "proved\n");
 
 	return 0;
-
-error_iounmap:
-	devm_iounmap(&pdev->dev, priv->base);
-error_free_priv:
-	devm_kfree(&pdev->dev, priv);
-
-	return ret;
 }
 
 static int rcar_thermal_remove(struct platform_device *pdev)
@@ -240,9 +231,6 @@ static int rcar_thermal_remove(struct platform_device *pdev)
 	thermal_zone_device_unregister(zone);
 	platform_set_drvdata(pdev, NULL);
 
-	devm_iounmap(&pdev->dev, priv->base);
-	devm_kfree(&pdev->dev, priv);
-
 	return 0;
 }
 

