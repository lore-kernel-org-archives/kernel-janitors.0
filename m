From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Aug 2020 13:52:04 +0000
Subject: [PATCH] net: sgi: ioc3-eth: Fix the size used in some 'dma_free_coherent()' calls
Message-Id: <20200802135204.690832-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, tbogendoerfer@suse.de
Cc: linux-mips@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Update the size used in 'dma_free_coherent()' in order to match the one
used in the corresponding 'dma_alloc_coherent()'.

Fixes: 369a782af0f1 ("net: sgi: ioc3-eth: ensure tx ring is 16k aligned.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 6646eba9f57f..6eef0f45b133 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -951,7 +951,7 @@ static int ioc3eth_probe(struct platform_device *pdev)
 		dma_free_coherent(ip->dma_dev, RX_RING_SIZE, ip->rxr,
 				  ip->rxr_dma);
 	if (ip->tx_ring)
-		dma_free_coherent(ip->dma_dev, TX_RING_SIZE, ip->tx_ring,
+		dma_free_coherent(ip->dma_dev, TX_RING_SIZE + SZ_16K - 1, ip->tx_ring,
 				  ip->txr_dma);
 out_free:
 	free_netdev(dev);
@@ -964,7 +964,7 @@ static int ioc3eth_remove(struct platform_device *pdev)
 	struct ioc3_private *ip = netdev_priv(dev);
 
 	dma_free_coherent(ip->dma_dev, RX_RING_SIZE, ip->rxr, ip->rxr_dma);
-	dma_free_coherent(ip->dma_dev, TX_RING_SIZE, ip->tx_ring, ip->txr_dma);
+	dma_free_coherent(ip->dma_dev, TX_RING_SIZE + SZ_16K - 1, ip->tx_ring, ip->txr_dma);
 
 	unregister_netdev(dev);
 	del_timer_sync(&ip->ioc3_timer);
-- 
2.25.1
