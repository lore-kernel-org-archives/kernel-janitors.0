From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 22 Sep 2019 11:00:09 +0000
Subject: [PATCH] dmaengine: mediatek: Use devm_platform_ioremap_resource() in mtk_cqdma_probe()
Message-Id: <c7e3bbae-44fa-9019-18ee-c6cdfd7c2a14@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Shun-Chih Yu <shun-chih.yu@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Sep 2019 12:52:25 +0200

Simplify this function implementation a bit by using
a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/mediatek/mtk-cqdma.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 723b11c190b3..6bf838e63be1 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -819,15 +819,7 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&cqdma->pc[i]->queue);
 		spin_lock_init(&cqdma->pc[i]->lock);
 		refcount_set(&cqdma->pc[i]->refcnt, 0);
-
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res) {
-			dev_err(&pdev->dev, "No mem resource for %s\n",
-				dev_name(&pdev->dev));
-			return -EINVAL;
-		}
-
-		cqdma->pc[i]->base = devm_ioremap_resource(&pdev->dev, res);
+		cqdma->pc[i]->base = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(cqdma->pc[i]->base))
 			return PTR_ERR(cqdma->pc[i]->base);

--
2.23.0
