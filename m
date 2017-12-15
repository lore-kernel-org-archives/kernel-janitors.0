From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 16:34:33 +0000
Subject: [PATCH 1/3] rapidio: tsi721_dma: Delete an error message for a failed memory allocation in tsi721_al
Message-Id: <a96fcaf8-ea24-bcac-0214-273620349d42@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <33c63b12-7828-891a-31ef-76a2e3c6b90c@users.sourceforge.net>
In-Reply-To: <33c63b12-7828-891a-31ef-76a2e3c6b90c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 14:11:08 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/devices/tsi721_dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rapidio/devices/tsi721_dma.c b/drivers/rapidio/devices/tsi721_dma.c
index e2a418598129..f7bc85a27d1b 100644
--- a/drivers/rapidio/devices/tsi721_dma.c
+++ b/drivers/rapidio/devices/tsi721_dma.c
@@ -754,9 +754,6 @@ static int tsi721_alloc_chan_resources(struct dma_chan *dchan)
 	desc = kcalloc(dma_txqueue_sz, sizeof(struct tsi721_tx_desc),
 			GFP_ATOMIC);
 	if (!desc) {
-		tsi_err(&dchan->dev->device,
-			"DMAC%d Failed to allocate logical descriptors",
-			bdma_chan->id);
 		tsi721_bdma_ch_free(bdma_chan);
 		return -ENOMEM;
 	}
-- 
2.15.1

