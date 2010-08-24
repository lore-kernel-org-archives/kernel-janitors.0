From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 16:55:05 +0000
Subject: [patch 4/4] pxa168_eth: silence gcc warnings
Message-Id: <20100824165505.GK29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Sanap <ssanap@marvell.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Casting "pep->tx_desc_dma" to to a struct tx_desc pointer makes gcc
complain:

drivers/net/pxa168_eth.c:657: warning:
	cast to pointer from integer of different size

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/pxa168_eth.c b/drivers/net/pxa168_eth.c
index f324b76..b1f440b 100644
--- a/drivers/net/pxa168_eth.c
+++ b/drivers/net/pxa168_eth.c
@@ -654,15 +654,15 @@ static void eth_port_start(struct net_device *dev)
 	/* Assignment of Tx CTRP of given queue */
 	tx_curr_desc = pep->tx_curr_desc_q;
 	wrl(pep, ETH_C_TX_DESC_1,
-	    (u32) ((struct tx_desc *)pep->tx_desc_dma + tx_curr_desc));
+	    (u32) (pep->tx_desc_dma + tx_curr_desc * sizeof(struct tx_desc)));
 
 	/* Assignment of Rx CRDP of given queue */
 	rx_curr_desc = pep->rx_curr_desc_q;
 	wrl(pep, ETH_C_RX_DESC_0,
-	    (u32) ((struct rx_desc *)pep->rx_desc_dma + rx_curr_desc));
+	    (u32) (pep->rx_desc_dma + rx_curr_desc * sizeof(struct rx_desc)));
 
 	wrl(pep, ETH_F_RX_DESC_0,
-	    (u32) ((struct rx_desc *)pep->rx_desc_dma + rx_curr_desc));
+	    (u32) (pep->rx_desc_dma + rx_curr_desc * sizeof(struct rx_desc)));
 
 	/* Clear all interrupts */
 	wrl(pep, INT_CAUSE, 0);
