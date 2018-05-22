From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 22 May 2018 11:48:28 +0000
Subject: [PATCH -next] dmaengine: sprd: Fix return value check in sprd_dma_probe()
Message-Id: <1526989708-140048-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: e7f063ae1a31 ("dmaengine: sprd: Use devm_ioremap_resource() to map memory")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/dma/sprd-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index e715d07..36df3b0 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -808,8 +808,8 @@ static int sprd_dma_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sdev->glb_base = devm_ioremap_resource(&pdev->dev, res);
-	if (!sdev->glb_base)
-		return -ENOMEM;
+	if (IS_ERR(sdev->glb_base))
+		return PTR_ERR(sdev->glb_base);
 
 	dma_cap_set(DMA_MEMCPY, sdev->dma_dev.cap_mask);
 	sdev->total_chns = chn_count;

