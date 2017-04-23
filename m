From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 09:09:19 +0000
Subject: [PATCH 2/2] dmaengine: k3dma: Adjust six checks for null pointers
Message-Id: <12cb50fb-63b7-8127-700d-1fe1c75c3961@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f83beedc-28fd-c373-cca8-7261e42577a5@users.sourceforge.net>
In-Reply-To: <f83beedc-28fd-c373-cca8-7261e42577a5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 10:47:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/k3dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index 31a51ee1a910..da20565f7a8d 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -230,7 +230,7 @@ static irqreturn_t k3_dma_int_handler(int irq, void *dev_id)
 			}
 			if (c && (tc2 & BIT(i))) {
 				spin_lock_irqsave(&c->vc.lock, flags);
-				if (p->ds_run != NULL)
+				if (p->ds_run)
 					vchan_cyclic_callback(&p->ds_run->vd);
 				spin_unlock_irqrestore(&c->vc.lock, flags);
 			}
@@ -312,7 +312,7 @@ static void k3_dma_tasklet(unsigned long arg)
 	for (pch = 0; pch < d->dma_channels; pch++) {
 		p = &d->phy[pch];
 
-		if (p->vchan = NULL && !list_empty(&d->chan_pending)) {
+		if (!p->vchan && !list_empty(&d->chan_pending)) {
 			c = list_first_entry(&d->chan_pending,
 				struct k3_dma_chan, node);
 			/* remove from d->chan_pending */
@@ -527,7 +527,7 @@ static struct dma_async_tx_descriptor *k3_dma_prep_slave_sg(
 	dma_addr_t addr, src = 0, dst = 0;
 	int num = sglen, i;
 
-	if (sgl = NULL)
+	if (!sgl)
 		return NULL;
 
 	c->cyclic = 0;
@@ -645,7 +645,7 @@ static int k3_dma_config(struct dma_chan *chan,
 	u32 maxburst = 0, val = 0;
 	enum dma_slave_buswidth width = DMA_SLAVE_BUSWIDTH_UNDEFINED;
 
-	if (cfg = NULL)
+	if (!cfg)
 		return -EINVAL;
 	c->dir = cfg->direction;
 	if (c->dir = DMA_DEV_TO_MEM) {
@@ -847,7 +847,7 @@ static int k3_dma_probe(struct platform_device *op)
 	/* init phy channel */
 	d->phy = devm_kcalloc(&op->dev, d->dma_channels, sizeof(*d->phy),
 			      GFP_KERNEL);
-	if (d->phy = NULL)
+	if (!d->phy)
 		return -ENOMEM;
 
 	for (i = 0; i < d->dma_channels; i++) {
@@ -877,7 +877,7 @@ static int k3_dma_probe(struct platform_device *op)
 	/* init virtual channel */
 	d->chans = devm_kcalloc(&op->dev, d->dma_requests, sizeof(*d->chans),
 				GFP_KERNEL);
-	if (d->chans = NULL)
+	if (!d->chans)
 		return -ENOMEM;
 
 	for (i = 0; i < d->dma_requests; i++) {
-- 
2.12.2

