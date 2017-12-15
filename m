From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 16:37:32 +0000
Subject: [PATCH 3/3] rapidio: tsi721_dma: Adjust six checks for null pointers
Message-Id: <c3e79a1a-891e-cb62-990f-bd99839311b9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <33c63b12-7828-891a-31ef-76a2e3c6b90c@users.sourceforge.net>
In-Reply-To: <33c63b12-7828-891a-31ef-76a2e3c6b90c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 14:35:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/devices/tsi721_dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/rapidio/devices/tsi721_dma.c b/drivers/rapidio/devices/tsi721_dma.c
index 14fc36ac3d85..006ea5a45020 100644
--- a/drivers/rapidio/devices/tsi721_dma.c
+++ b/drivers/rapidio/devices/tsi721_dma.c
@@ -222,7 +222,7 @@ static int tsi721_bdma_ch_free(struct tsi721_bdma_chan *bdma_chan)
 	struct tsi721_device *priv = to_tsi721(bdma_chan->dchan.device);
 #endif
 
-	if (bdma_chan->bd_base = NULL)
+	if (!bdma_chan->bd_base)
 		return 0;
 
 	/* Check if DMA channel still running */
@@ -346,7 +346,7 @@ tsi721_desc_fill_init(struct tsi721_tx_desc *desc,
 {
 	u64 rio_addr;
 
-	if (bd_ptr = NULL)
+	if (!bd_ptr)
 		return -EINVAL;
 
 	/* Initialize DMA descriptor */
@@ -370,7 +370,7 @@ tsi721_desc_fill_init(struct tsi721_tx_desc *desc,
 static int
 tsi721_desc_fill_end(struct tsi721_dma_desc *bd_ptr, u32 bcount, bool interrupt)
 {
-	if (bd_ptr = NULL)
+	if (!bd_ptr)
 		return -EINVAL;
 
 	/* Update DMA descriptor */
@@ -555,9 +555,7 @@ static void tsi721_advance_work(struct tsi721_bdma_chan *bdma_chan,
 	 * If there is no data transfer in progress, fetch new descriptor from
 	 * the pending queue.
 	*/
-
-	if (desc = NULL && bdma_chan->active_tx = NULL &&
-					!list_empty(&bdma_chan->queue)) {
+	if (!desc && !bdma_chan->active_tx && !list_empty(&bdma_chan->queue)) {
 		desc = list_first_entry(&bdma_chan->queue,
 					struct tsi721_tx_desc, desc_node);
 		list_del_init((&desc->desc_node));
@@ -796,7 +794,7 @@ static void tsi721_free_chan_resources(struct dma_chan *dchan)
 
 	tsi_debug(DMA, &dchan->dev->device, "DMAC%d", bdma_chan->id);
 
-	if (bdma_chan->bd_base = NULL)
+	if (!bdma_chan->bd_base)
 		return;
 
 	tsi721_bdma_interrupt_enable(bdma_chan, 0);
-- 
2.15.1

