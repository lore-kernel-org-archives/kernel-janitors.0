From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 07 May 2018 01:40:34 +0000
Subject: [PATCH -next] dmaengine: sprd: Fix potential NULL dereference in sprd_dma_probe()
Message-Id: <1525657234-88256-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference
a bit later in the code.

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = platform_get_resource(pdev, t, n);
+ if (!res)
+   return -EINVAL;
... when != res = NULL
e = devm_ioremap_nocache(e1, res->start, e2);

Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/dma/sprd-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index ccdeb8f..dba7a17 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -807,6 +807,8 @@ static int sprd_dma_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	sdev->glb_base = devm_ioremap_nocache(&pdev->dev, res->start,
 					      resource_size(res));
 	if (!sdev->glb_base)

