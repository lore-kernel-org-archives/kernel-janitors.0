From: Julia Lawall <julia@diku.dk>
Date: Sun, 05 Jul 2009 07:23:21 +0000
Subject: [PATCH] drivers/net/cs89x0.c: Avoid using magic number in set_dma_mode
Message-Id: <Pine.LNX.4.64.0907050922570.27464@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The constant DMA_RX_MODE is defined to be 0x14 in the local include file
cs89x0.h.  Since a constant with the same name is used elsewhere with
set_dma_mode, it seems likely that this constant could be used here.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E1; identifier I; constant int C; @@
(
set_dma_mode(E1,I,...)
|
*set_dma_mode(E1,C,...)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/cs89x0.c    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/cs89x0.c b/drivers/net/cs89x0.c
index 3eee666..67c9702 100644
--- a/drivers/net/cs89x0.c
+++ b/drivers/net/cs89x0.c
@@ -1367,7 +1367,7 @@ net_open(struct net_device *dev)
 			spin_lock_irqsave(&lp->lock, flags);
 			disable_dma(dev->dma);
 			clear_dma_ff(dev->dma);
-			set_dma_mode(dev->dma, 0x14); /* auto_init as well */
+			set_dma_mode(dev->dma, DMA_RX_MODE); /* auto_init as well */
 			set_dma_addr(dev->dma, isa_virt_to_bus(lp->dma_buff));
 			set_dma_count(dev->dma, lp->dmasize*1024);
 			enable_dma(dev->dma);
