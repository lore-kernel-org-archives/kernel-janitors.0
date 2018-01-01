From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Jan 2018 16:54:07 +0000
Subject: [PATCH] net: systemport: Delete an error message for a failed memory allocation in two functions
Message-Id: <5852a936-de6d-f292-2791-b8469b5f8947@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jan 2018 17:50:02 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/broadcom/bcmsysport.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index 9d7a834c5f62..34e6ddde89e1 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -1396,7 +1396,6 @@ static int bcm_sysport_init_tx_ring(struct bcm_sysport_priv *priv,
 	if (!ring->cbs) {
 		dma_free_coherent(kdev, sizeof(struct dma_desc),
 				  ring->desc_cpu, ring->desc_dma);
-		netif_err(priv, hw, priv->netdev, "CB allocation failed\n");
 		return -ENOMEM;
 	}
 
@@ -1576,10 +1575,8 @@ static int bcm_sysport_init_rx_ring(struct bcm_sysport_priv *priv)
 	priv->rx_read_ptr = 0;
 	priv->rx_cbs = kcalloc(priv->num_rx_bds, sizeof(struct bcm_sysport_cb),
 				GFP_KERNEL);
-	if (!priv->rx_cbs) {
-		netif_err(priv, hw, priv->netdev, "CB allocation failed\n");
+	if (!priv->rx_cbs)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < priv->num_rx_bds; i++) {
 		cb = priv->rx_cbs + i;
-- 
2.15.1

