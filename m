From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 29 Apr 2016 20:09:10 +0000
Subject: [PATCH 3/5] dmaengine: ioatdma: Use dma_pool_zalloc
Message-Id: <1461960552-7429-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

Dma_pool_zalloc combines dma_pool_alloc and memset 0.  The semantic patch
that makes this transformation is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression d,e;
statement S;
@@

        d -            dma_pool_alloc
+            dma_pool_zalloc
             (...);
        if (!d) S
-       memset(d, 0, sizeof(*d));
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

 drivers/dma/ioat/init.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index efdee1a..d4c63d4 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -690,12 +690,11 @@ static int ioat_alloc_chan_resources(struct dma_chan *c)
 	/* allocate a completion writeback area */
 	/* doing 2 32bit writes to mmio since 1 64b write doesn't work */
 	ioat_chan->completion -		dma_pool_alloc(ioat_chan->ioat_dma->completion_pool,
-			       GFP_KERNEL, &ioat_chan->completion_dma);
+		dma_pool_zalloc(ioat_chan->ioat_dma->completion_pool,
+				GFP_KERNEL, &ioat_chan->completion_dma);
 	if (!ioat_chan->completion)
 		return -ENOMEM;
 
-	memset(ioat_chan->completion, 0, sizeof(*ioat_chan->completion));
 	writel(((u64)ioat_chan->completion_dma) & 0x00000000FFFFFFFF,
 	       ioat_chan->reg_base + IOAT_CHANCMP_OFFSET_LOW);
 	writel(((u64)ioat_chan->completion_dma) >> 32,
