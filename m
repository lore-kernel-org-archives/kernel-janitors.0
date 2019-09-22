From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 22 Sep 2019 11:30:41 +0000
Subject: [PATCH] dmaengine: owl: Use devm_platform_ioremap_resource() in owl_dma_probe()
Message-Id: <d36b6a6c-2e3d-8d68-6ddc-969a377ca3b2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Dan Williams <dan.j.williams@intel.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Sep 2019 13:23:54 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/owl-dma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 90bbcef99ef8..023f951189a7 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1045,18 +1045,13 @@ static int owl_dma_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct owl_dma *od;
-	struct resource *res;
 	int ret, i, nr_channels, nr_requests;

 	od = devm_kzalloc(&pdev->dev, sizeof(*od), GFP_KERNEL);
 	if (!od)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-
-	od->base = devm_ioremap_resource(&pdev->dev, res);
+	od->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(od->base))
 		return PTR_ERR(od->base);

--
2.23.0
