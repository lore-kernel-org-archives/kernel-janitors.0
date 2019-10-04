From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Oct 2019 10:22:09 +0000
Subject: [PATCH] ASoC: fsl_mqs: Fix error handling in probe
Message-Id: <20191004102208.GB823@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org

There are several problems in the error handling in fsl_mqs_probe().

1) "ret" isn't initialized on some paths.  GCC has a feature which
   warns about uninitialized variables but the code initializes "ret"
   to zero at the start of the function so the checking is turned off.
2) "gpr_np" is a pointer so initializing it to zero is confusing and
   generates a Sparse warning.
3) of_parse_phandle() doesn't return error pointers on error, it returns
   NULL.
4) If devm_snd_soc_register_component() fails then the function should
   free the "gpr_np".

Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/fsl/fsl_mqs.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index c1619a553514..f5f2f659bcbf 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -179,10 +179,10 @@ static const struct regmap_config fsl_mqs_regmap_config = {
 static int fsl_mqs_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *gpr_np = 0;
+	struct device_node *gpr_np = NULL;
 	struct fsl_mqs *mqs_priv;
 	void __iomem *regs;
-	int ret = 0;
+	int ret;
 
 	mqs_priv = devm_kzalloc(&pdev->dev, sizeof(*mqs_priv), GFP_KERNEL);
 	if (!mqs_priv)
@@ -199,17 +199,16 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 
 	if (mqs_priv->use_gpr) {
 		gpr_np = of_parse_phandle(np, "gpr", 0);
-		if (IS_ERR(gpr_np)) {
+		if (!gpr_np) {
 			dev_err(&pdev->dev, "failed to get gpr node by phandle\n");
-			ret = PTR_ERR(gpr_np);
-			goto out;
+			return -EINVAL;
 		}
 
 		mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
 		if (IS_ERR(mqs_priv->regmap)) {
 			dev_err(&pdev->dev, "failed to get gpr regmap\n");
 			ret = PTR_ERR(mqs_priv->regmap);
-			goto out;
+			goto err_free_gpr_np;
 		}
 	} else {
 		regs = devm_platform_ioremap_resource(pdev, 0);
@@ -230,7 +229,7 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 		if (IS_ERR(mqs_priv->ipg)) {
 			dev_err(&pdev->dev, "failed to get the clock: %ld\n",
 				PTR_ERR(mqs_priv->ipg));
-			goto out;
+			return PTR_ERR(mqs_priv->ipg);
 		}
 	}
 
@@ -238,17 +237,21 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	if (IS_ERR(mqs_priv->mclk)) {
 		dev_err(&pdev->dev, "failed to get the clock: %ld\n",
 			PTR_ERR(mqs_priv->mclk));
-		goto out;
+		ret = PTR_ERR(mqs_priv->mclk);
+		goto err_free_gpr_np;
 	}
 
 	dev_set_drvdata(&pdev->dev, mqs_priv);
 	pm_runtime_enable(&pdev->dev);
 
-	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
 			&fsl_mqs_dai, 1);
-out:
-	if (!IS_ERR(gpr_np))
-		of_node_put(gpr_np);
+	if (ret)
+		goto err_free_gpr_np;
+	return 0;
+
+err_free_gpr_np:
+	of_node_put(gpr_np);
 
 	return ret;
 }
-- 
2.20.1
