From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Feb 2020 18:59:21 +0000
Subject: [PATCH][next] dmaengine: ti: edma: fix null dereference because of a typo in pointer name
Message-Id: <20200226185921.351693-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a dereference of the null pointer m_ddev.  This appears
to be a typo on the pointer, I believe s_ddev should be used instead.
Fix this by using the correct pointer.

Addresses-Coverity: ("Explicit null dereferenced")
Fixes: eb0249d50153 ("dmaengine: ti: edma: Support for interleaved mem to mem transfer")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/ti/edma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 2b1fdd438e7f..c4a5c170c1f9 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -1992,7 +1992,7 @@ static void edma_dma_init(struct edma_cc *ecc, bool legacy_mode)
 			 "Legacy memcpy is enabled, things might not work\n");
 
 		dma_cap_set(DMA_MEMCPY, s_ddev->cap_mask);
-		dma_cap_set(DMA_INTERLEAVE, m_ddev->cap_mask);
+		dma_cap_set(DMA_INTERLEAVE, s_ddev->cap_mask);
 		s_ddev->device_prep_dma_memcpy = edma_prep_dma_memcpy;
 		s_ddev->device_prep_interleaved_dma = edma_prep_dma_interleaved;
 		s_ddev->directions = BIT(DMA_MEM_TO_MEM);
-- 
2.25.0
