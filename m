From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 09:30:30 +0000
Subject: [PATCH] media: platform: Use devm_platform_ioremap_resource() in two functions
Message-Id: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>, Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 11:20:48 +0200

Simplify these function implementations by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 +-------
 drivers/media/platform/rcar-vin/rcar-core.c            | 7 +------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 00d090df11bb..944771ee5f5c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -253,13 +253,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}

 	for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (res == NULL) {
-			dev_err(&pdev->dev, "get memory resource failed.");
-			ret = -ENXIO;
-			goto err_res;
-		}
-		dev->reg_base[i] = devm_ioremap_resource(&pdev->dev, res);
+		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR((__force void *)dev->reg_base[i])) {
 			ret = PTR_ERR((__force void *)dev->reg_base[i]);
 			goto err_res;
diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 6993484ff0f3..334c62805959 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1282,7 +1282,6 @@ static int rcar_vin_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *attr;
 	struct rvin_dev *vin;
-	struct resource *mem;
 	int irq, ret;

 	vin = devm_kzalloc(&pdev->dev, sizeof(*vin), GFP_KERNEL);
@@ -1301,11 +1300,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	if (attr)
 		vin->info = attr->data;

-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (mem == NULL)
-		return -EINVAL;
-
-	vin->base = devm_ioremap_resource(vin->dev, mem);
+	vin->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vin->base))
 		return PTR_ERR(vin->base);

--
2.23.0
