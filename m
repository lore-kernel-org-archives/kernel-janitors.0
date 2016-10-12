From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:01:59 +0000
Subject: [patch 2/2] k3dma: tighten range checking a bit
Message-Id: <20161012060158.GB12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

My static checker complains that it's possible for "num" to be negative.
I haven't investigated this completely, but it's more natural to make
the type unsigned and that makes the static checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hm...  I probably should investigate this a bit more because the same
code is copy and pasted all over the place.

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index aabcb79..7c636c53 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -440,7 +440,7 @@ static void k3_dma_fill_desc(struct k3_dma_desc_sw *ds, dma_addr_t dst,
 	ds->desc_hw[num].config = ccfg;
 }
 
-static struct k3_dma_desc_sw *k3_dma_alloc_desc_resource(int num,
+static struct k3_dma_desc_sw *k3_dma_alloc_desc_resource(size_t num,
 							struct dma_chan *chan)
 {
 	struct k3_dma_chan *c = to_k3_chan(chan);
@@ -449,7 +449,7 @@ static struct k3_dma_desc_sw *k3_dma_alloc_desc_resource(int num,
 	int lli_limit = LLI_BLOCK_SIZE / sizeof(struct k3_desc_hw);
 
 	if (num > lli_limit) {
-		dev_dbg(chan->device->dev, "vch %p: sg num %d exceed max %d\n",
+		dev_dbg(chan->device->dev, "vch %p: sg num %lu exceed max %d\n",
 			&c->vc, num, lli_limit);
 		return NULL;
 	}
@@ -476,7 +476,7 @@ static struct dma_async_tx_descriptor *k3_dma_prep_memcpy(
 	struct k3_dma_chan *c = to_k3_chan(chan);
 	struct k3_dma_desc_sw *ds;
 	size_t copy = 0;
-	int num = 0;
+	size_t num = 0;
 
 	if (!len)
 		return NULL;
