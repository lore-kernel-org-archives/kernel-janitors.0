From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 13 Nov 2018 14:13:45 +0000
Subject: [PATCH -next] thermal: armada: Use PTR_ERR_OR_ZERO in armada_thermal_probe_legacy()
Message-Id: <1542118425-20298-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/thermal/armada_thermal.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index 92f67d40..4b36a30 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -545,20 +545,14 @@ static int armada_thermal_probe_legacy(struct platform_device *pdev,
 
 	priv->syscon = devm_regmap_init_mmio(&pdev->dev, base,
 					     &armada_thermal_regmap_config);
-	if (IS_ERR(priv->syscon))
-		return PTR_ERR(priv->syscon);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(priv->syscon);
 }
 
 static int armada_thermal_probe_syscon(struct platform_device *pdev,
 				       struct armada_thermal_priv *priv)
 {
 	priv->syscon = syscon_node_to_regmap(pdev->dev.parent->of_node);
-	if (IS_ERR(priv->syscon))
-		return PTR_ERR(priv->syscon);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(priv->syscon);
 }
 
 static void armada_set_sane_name(struct platform_device *pdev,
