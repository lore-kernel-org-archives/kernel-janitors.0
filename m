From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jan 2020 23:52:37 +0000
Subject: [PATCH] dmaengine: s3c24xx-dma: fix spelling mistake "to" -> "too"
Message-Id: <20200122235237.2830344-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 1ed5dc1f597c..8e14c72d03f0 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -1198,7 +1198,7 @@ static int s3c24xx_dma_probe(struct platform_device *pdev)
 
 	/* Basic sanity check */
 	if (pdata->num_phy_channels > MAX_DMA_CHANNELS) {
-		dev_err(&pdev->dev, "to many dma channels %d, max %d\n",
+		dev_err(&pdev->dev, "too many dma channels %d, max %d\n",
 			pdata->num_phy_channels, MAX_DMA_CHANNELS);
 		return -EINVAL;
 	}
-- 
2.24.0
