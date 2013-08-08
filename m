From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Thu, 08 Aug 2013 19:32:49 +0000
Subject: [PATCH] net:ethernet:korina.c Removed IRQF_DISABLED
Message-Id: <1375989649-7252-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, emilio@elopez.com.ar, mugunthanvnm@ti.com, jg1.han@samsung.com, hsweeten@visionengravers.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Kumar Gaurav <kumargauravgupta3@gmail.com>

Removed IRQF_DISABLED as it's no-op and should be removed

Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
---
 drivers/net/ethernet/korina.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index 270e65f..a36fa80 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -996,14 +996,14 @@ static int korina_open(struct net_device *dev)
 	 * that handles the Done Finished
 	 * Ovr and Und Events */
 	ret = request_irq(lp->rx_irq, korina_rx_dma_interrupt,
-			IRQF_DISABLED, "Korina ethernet Rx", dev);
+			0, "Korina ethernet Rx", dev);
 	if (ret < 0) {
 		printk(KERN_ERR "%s: unable to get Rx DMA IRQ %d\n",
 		    dev->name, lp->rx_irq);
 		goto err_release;
 	}
 	ret = request_irq(lp->tx_irq, korina_tx_dma_interrupt,
-			IRQF_DISABLED, "Korina ethernet Tx", dev);
+			0, "Korina ethernet Tx", dev);
 	if (ret < 0) {
 		printk(KERN_ERR "%s: unable to get Tx DMA IRQ %d\n",
 		    dev->name, lp->tx_irq);
@@ -1012,7 +1012,7 @@ static int korina_open(struct net_device *dev)
 
 	/* Install handler for overrun error. */
 	ret = request_irq(lp->ovr_irq, korina_ovr_interrupt,
-			IRQF_DISABLED, "Ethernet Overflow", dev);
+			0, "Ethernet Overflow", dev);
 	if (ret < 0) {
 		printk(KERN_ERR "%s: unable to get OVR IRQ %d\n",
 		    dev->name, lp->ovr_irq);
@@ -1021,7 +1021,7 @@ static int korina_open(struct net_device *dev)
 
 	/* Install handler for underflow error. */
 	ret = request_irq(lp->und_irq, korina_und_interrupt,
-			IRQF_DISABLED, "Ethernet Underflow", dev);
+			0, "Ethernet Underflow", dev);
 	if (ret < 0) {
 		printk(KERN_ERR "%s: unable to get UND IRQ %d\n",
 		    dev->name, lp->und_irq);
-- 
1.7.9.5

