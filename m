From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 17 Dec 2020 12:17:25 +0000
Subject: [PATCH] media: venus: core: Fix a resource leak in error handling paths of the probe function
Message-Id: <20201217121725.156649-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stanimir.varbanov@linaro.org, agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org, georgi.djakov@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Add 2 missing 'icc_put()' calls in the error handling path of the probe
function, as already done in the remove function.

Fixes: 32f0a6ddc8c9 ("media: venus: Use on-chip interconnect API")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/qcom/venus/core.c | 31 +++++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bdd293faaad0..2e6ce215740b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -200,27 +200,35 @@ static int venus_probe(struct platform_device *pdev)
 		return PTR_ERR(core->video_path);
 
 	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
-	if (IS_ERR(core->cpucfg_path))
-		return PTR_ERR(core->cpucfg_path);
+	if (IS_ERR(core->cpucfg_path)) {
+		ret = PTR_ERR(core->cpucfg_path);
+		goto err_video_path_put;
+	}
 
 	core->irq = platform_get_irq(pdev, 0);
-	if (core->irq < 0)
-		return core->irq;
+	if (core->irq < 0) {
+		ret = core->irq;
+		goto err_cpucfg_path_put;
+	}
 
 	core->res = of_device_get_match_data(dev);
-	if (!core->res)
-		return -ENODEV;
+	if (!core->res) {
+		ret = -ENODEV;
+		goto err_cpucfg_path_put;
+	}
 
 	mutex_init(&core->pm_lock);
 
 	core->pm_ops = venus_pm_get(core->res->hfi_version);
-	if (!core->pm_ops)
-		return -ENODEV;
+	if (!core->pm_ops) {
+		ret = -ENODEV;
+		goto err_cpucfg_path_put;
+	}
 
 	if (core->pm_ops->core_get) {
 		ret = core->pm_ops->core_get(dev);
 		if (ret)
-			return ret;
+			goto err_cpucfg_path_put;
 	}
 
 	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
@@ -305,6 +313,11 @@ static int venus_probe(struct platform_device *pdev)
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(dev);
+err_cpucfg_path_put:
+	icc_put(core->cpucfg_path);
+err_video_path_put:
+	icc_put(core->video_path);
+
 	return ret;
 }
 
-- 
2.27.0
