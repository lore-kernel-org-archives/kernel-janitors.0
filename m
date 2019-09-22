From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 22 Sep 2019 09:25:20 +0000
Subject: [PATCH] dmaengine: jz4780: Use devm_platform_ioremap_resource() in jz4780_dma_probe()
Message-Id: <5dd19f28-349a-4957-ea3a-6aebbd7c97e2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Alex Smith <alex.smith@imgtec.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Sep 2019 11:18:27 +0200

Simplify this function implementation a bit by using
a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/dma-jz4780.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index cafb1cc065bb..f42b3ef8e036 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -858,13 +858,7 @@ static int jz4780_dma_probe(struct platform_device *pdev)
 	jzdma->soc_data = soc_data;
 	platform_set_drvdata(pdev, jzdma);

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get I/O memory\n");
-		return -EINVAL;
-	}
-
-	jzdma->chn_base = devm_ioremap_resource(dev, res);
+	jzdma->chn_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(jzdma->chn_base))
 		return PTR_ERR(jzdma->chn_base);

--
2.23.0
