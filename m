From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 12 Dec 2019 11:46:22 +0000
Subject: [PATCH -next] dmaengine: ti: edma: Fix error return code in edma_probe()
Message-Id: <20191212114622.127322-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Chuhong Yuan <hslester96@gmail.com>, Arnd Bergmann <arnd@arndb.de>, YueHaibing <yuehaibing@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/dma/ti/edma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 0628ee4bf1b4..03a7f647f7b2 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2342,8 +2342,10 @@ static int edma_probe(struct platform_device *pdev)
 	ecc->channels_mask = devm_kcalloc(dev,
 					   BITS_TO_LONGS(ecc->num_channels),
 					   sizeof(unsigned long), GFP_KERNEL);
-	if (!ecc->slave_chans || !ecc->slot_inuse || !ecc->channels_mask)
+	if (!ecc->slave_chans || !ecc->slot_inuse || !ecc->channels_mask) {
+		ret = -ENOMEM;
 		goto err_disable_pm;
+	}
 
 	/* Mark all channels available initially */
 	bitmap_fill(ecc->channels_mask, ecc->num_channels);
