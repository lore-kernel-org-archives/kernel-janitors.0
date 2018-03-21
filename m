From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Mar 2018 10:24:13 +0000
Subject: [PATCH][next] dmaengine: dw-axi-dmac: fix spelling mistake: "catched" -> "caught"
Message-Id: <20180321102413.29621-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index dbe7312c15c6..c4eb55e3011c 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -574,7 +574,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 	if (unlikely(axi_chan_is_hw_enable(chan))) {
-		dev_err(chan2dev(chan), "BUG: %s catched DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
+		dev_err(chan2dev(chan), "BUG: %s caught DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
 			axi_chan_name(chan));
 		axi_chan_disable(chan);
 	}
-- 
2.15.1

