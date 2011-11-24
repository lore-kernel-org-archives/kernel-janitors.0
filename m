From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 11:47:34 +0000
Subject: [patch] dmatest: store correct thread count in dmatest_add_channel()
Message-Id: <20111124114734.GB32522@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code added 1 to the thread_count, but the intent was to
add += cnt.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2b8661b..24225f0 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -599,7 +599,7 @@ static int dmatest_add_channel(struct dma_chan *chan)
 	}
 	if (dma_has_cap(DMA_PQ, dma_dev->cap_mask)) {
 		cnt = dmatest_add_threads(dtc, DMA_PQ);
-		thread_count += cnt > 0 ?: 0;
+		thread_count += cnt > 0 ? cnt : 0;
 	}
 
 	pr_info("dmatest: Started %u threads using %s\n",
