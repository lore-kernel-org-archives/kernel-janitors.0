From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 16:36:15 +0000
Subject: [PATCH 2/3] rapidio: tsi721_dma: Delete an unnecessary variable initialisation in tsi721_alloc_chan_
Message-Id: <728d8e20-4ae9-d661-d932-2d99ce67e71f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <33c63b12-7828-891a-31ef-76a2e3c6b90c@users.sourceforge.net>
In-Reply-To: <33c63b12-7828-891a-31ef-76a2e3c6b90c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 14:22:44 +0100

The local variable "desc" will eventually be set to an appropriate pointer
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/devices/tsi721_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rapidio/devices/tsi721_dma.c b/drivers/rapidio/devices/tsi721_dma.c
index f7bc85a27d1b..14fc36ac3d85 100644
--- a/drivers/rapidio/devices/tsi721_dma.c
+++ b/drivers/rapidio/devices/tsi721_dma.c
@@ -735,7 +735,7 @@ static dma_cookie_t tsi721_tx_submit(struct dma_async_tx_descriptor *txd)
 static int tsi721_alloc_chan_resources(struct dma_chan *dchan)
 {
 	struct tsi721_bdma_chan *bdma_chan = to_tsi721_chan(dchan);
-	struct tsi721_tx_desc *desc = NULL;
+	struct tsi721_tx_desc *desc;
 	int i;
 
 	tsi_debug(DMA, &dchan->dev->device, "DMAC%d", bdma_chan->id);
-- 
2.15.1

