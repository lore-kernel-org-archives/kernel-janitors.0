From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 22 Sep 2019 12:37:13 +0000
Subject: [PATCH] dmaengine: zx: Use devm_platform_ioremap_resource() in zx_dma_probe()
Message-Id: <85de79fa-1ca5-a1e5-0296-9e8a2066f134@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Sep 2019 14:32:12 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/zx_dma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/zx_dma.c b/drivers/dma/zx_dma.c
index 9f4436f7c914..6b457e683e70 100644
--- a/drivers/dma/zx_dma.c
+++ b/drivers/dma/zx_dma.c
@@ -754,18 +754,13 @@ static struct dma_chan *zx_of_dma_simple_xlate(struct of_phandle_args *dma_spec,
 static int zx_dma_probe(struct platform_device *op)
 {
 	struct zx_dma_dev *d;
-	struct resource *iores;
 	int i, ret = 0;

-	iores = platform_get_resource(op, IORESOURCE_MEM, 0);
-	if (!iores)
-		return -EINVAL;
-
 	d = devm_kzalloc(&op->dev, sizeof(*d), GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;

-	d->base = devm_ioremap_resource(&op->dev, iores);
+	d->base = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(d->base))
 		return PTR_ERR(d->base);

--
2.23.0
