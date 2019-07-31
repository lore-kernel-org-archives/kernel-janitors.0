From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 07:38:42 +0000
Subject: [PATCH] net: ethernet: et131x: Use GFP_KERNEL instead of GFP_ATOMIC when allocating tx_ring->tcb_rin
Message-Id: <20190731073842.16948-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark.einon@gmail.com, davem@davemloft.net, willy@infradead.org, f.fainelli@gmail.com, andrew@lunn.ch
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no good reason to use GFP_ATOMIC here. Other memory allocations
are performed with GFP_KERNEL (see other 'dma_alloc_coherent()' below and
'kzalloc()' in 'et131x_rx_dma_memory_alloc()')

Use GFP_KERNEL which should be enough.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/agere/et131x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere/et131x.c
index e43d922f043e..174344c450af 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -2362,7 +2362,7 @@ static int et131x_tx_dma_memory_alloc(struct et131x_adapter *adapter)
 
 	/* Allocate memory for the TCB's (Transmit Control Block) */
 	tx_ring->tcb_ring = kcalloc(NUM_TCB, sizeof(struct tcb),
-				    GFP_ATOMIC | GFP_DMA);
+				    GFP_KERNEL | GFP_DMA);
 	if (!tx_ring->tcb_ring)
 		return -ENOMEM;
 
-- 
2.20.1
