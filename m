From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 22 Sep 2019 10:09:42 +0000
Subject: [PATCH] dmaengine: k3dma: Use devm_platform_ioremap_resource() in k3_dma_probe()
Message-Id: <aaed7862-49bb-e368-3e7b-5cc2c3d915b1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Sep 2019 11:36:18 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/k3dma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index 4b36c8810517..adecea51814f 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -835,13 +835,8 @@ static int k3_dma_probe(struct platform_device *op)
 	const struct k3dma_soc_data *soc_data;
 	struct k3_dma_dev *d;
 	const struct of_device_id *of_id;
-	struct resource *iores;
 	int i, ret, irq = 0;

-	iores = platform_get_resource(op, IORESOURCE_MEM, 0);
-	if (!iores)
-		return -EINVAL;
-
 	d = devm_kzalloc(&op->dev, sizeof(*d), GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;
@@ -850,7 +845,7 @@ static int k3_dma_probe(struct platform_device *op)
 	if (!soc_data)
 		return -EINVAL;

-	d->base = devm_ioremap_resource(&op->dev, iores);
+	d->base = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(d->base))
 		return PTR_ERR(d->base);

--
2.23.0
