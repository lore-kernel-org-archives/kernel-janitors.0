From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 29 Apr 2016 20:09:08 +0000
Subject: [PATCH 1/5] dmaengine: mmp_pdma: Use dma_pool_zalloc
Message-Id: <1461960552-7429-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: kernel-janitors@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/dma/mmp_pdma.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index e39457f..56f1fd6 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -364,13 +364,12 @@ mmp_pdma_alloc_descriptor(struct mmp_pdma_chan *chan)
 	struct mmp_pdma_desc_sw *desc;
 	dma_addr_t pdesc;
 
-	desc = dma_pool_alloc(chan->desc_pool, GFP_ATOMIC, &pdesc);
+	desc = dma_pool_zalloc(chan->desc_pool, GFP_ATOMIC, &pdesc);
 	if (!desc) {
 		dev_err(chan->dev, "out of memory for link descriptor\n");
 		return NULL;
 	}
 
-	memset(desc, 0, sizeof(*desc));
 	INIT_LIST_HEAD(&desc->tx_list);
 	dma_async_tx_descriptor_init(&desc->async_tx, &chan->chan);
 	/* each desc has submit */

