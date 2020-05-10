From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 May 2020 15:48:33 +0000
Subject: [PATCH] drm/exynos: dsi: Remove bridge node reference in error handling path in probe function
Message-Id: <20200510154833.238320-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch, kgene@kernel.org, krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org

'exynos_dsi_parse_dt()' takes a reference to 'dsi->in_bridge_node'.
This must be released in the error handling path.

This patch is similar to commit 70505c2ef94b ("drm/exynos: dsi: Remove bridge node reference in removal")
which fixed the issue in the remove function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
A Fixes tag could be required, but I've not been able to figure out which
one to use.

I think that moving 'exynos_dsi_parse_dt()' in the probe could simplify
the error handling in the probe function. However, I don't know this code
well enough to play this game. So better safe than sorry.
So I've kept the logic in place and added goto everywhere. :(
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 28 ++++++++++++++++++-------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 902938d2568f..2aa74c3dc733 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1770,14 +1770,17 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_info(dev, "failed to get regulators: %d\n", ret);
-		return ret;
+		goto err_put_in_bridge_node;
 	}
 
 	dsi->clks = devm_kcalloc(dev,
 			dsi->driver_data->num_clks, sizeof(*dsi->clks),
 			GFP_KERNEL);
-	if (!dsi->clks)
-		return -ENOMEM;
+	if (!dsi->clks) {
+		ret = -ENOMEM;
+		goto err_put_in_bridge_node;
+	}
+
 
 	for (i = 0; i < dsi->driver_data->num_clks; i++) {
 		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
@@ -1791,7 +1794,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 			dev_info(dev, "failed to get the clock: %s\n",
 					clk_names[i]);
-			return PTR_ERR(dsi->clks[i]);
+			ret = PTR_ERR(dsi->clks[i]);
+			goto err_put_in_bridge_node;
 		}
 	}
 
@@ -1799,19 +1803,22 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->reg_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(dsi->reg_base)) {
 		dev_err(dev, "failed to remap io region\n");
-		return PTR_ERR(dsi->reg_base);
+		ret = PTR_ERR(dsi->reg_base);
+		goto err_put_in_bridge_node;
 	}
 
 	dsi->phy = devm_phy_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
-		return PTR_ERR(dsi->phy);
+		ret = PTR_ERR(dsi->phy);
+		goto err_put_in_bridge_node;
 	}
 
 	dsi->irq = platform_get_irq(pdev, 0);
 	if (dsi->irq < 0) {
 		dev_err(dev, "failed to request dsi irq resource\n");
-		return dsi->irq;
+		ret = dsi->irq;
+		goto err_put_in_bridge_node;
 	}
 
 	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
@@ -1820,7 +1827,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 					dev_name(dev), dsi);
 	if (ret) {
 		dev_err(dev, "failed to request dsi irq\n");
-		return ret;
+		goto err_put_in_bridge_node;
 	}
 
 	platform_set_drvdata(pdev, &dsi->encoder);
@@ -1828,6 +1835,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	return component_add(dev, &exynos_dsi_component_ops);
+
+err_put_in_bridge_node:
+	of_node_put(dsi->in_bridge_node);
+
+	return ret;
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
-- 
2.25.1
