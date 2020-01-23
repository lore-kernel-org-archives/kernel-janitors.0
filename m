From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 09:23:59 +0000
Subject: [PATCH] dmaengine: fix spelling mistake "to" -> "too"
Message-Id: <20200123092359.10714-1-colin.king@canonical.com>
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
index 1ed5dc1f597c..26fa863a709e 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_memcpy(
 			len, s3cchan->name);
 
 	if ((len & S3C24XX_DCON_TC_MASK) != len) {
-		dev_err(&s3cdma->pdev->dev, "memcpy size %zu to large\n", len);
+		dev_err(&s3cdma->pdev->dev, "memcpy size %zu too large\n", len);
 		return NULL;
 	}
 
-- 
2.24.0
