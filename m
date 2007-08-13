From: Surya Prabhakar N <surya.prabhakar@wipro.com>
Date: Mon, 13 Aug 2007 10:25:30 +0000
Subject: [KJ] drivers/net/tokenring/3c359.c
Message-Id: <1187000010.29518.27.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mikep@linuxtr.net, netdev@vger.kernel.org
Cc: linux-tr@linuxtr.net, Linux Kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>

Hi,
   Replacing kmalloc with kzalloc and cleaning up memset in 
drivers/net/tokenring/3c359.c


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/drivers/net/tokenring/3c359.c b/drivers/net/tokenring/3c359.c
index 9f1b6ab..d36dd53 100644
--- a/drivers/net/tokenring/3c359.c
+++ b/drivers/net/tokenring/3c359.c
@@ -641,14 +641,14 @@ static int xl_open(struct net_device *dev)
 	 * Now to set up the Rx and Tx buffer structures
 	 */
 	/* These MUST be on 8 byte boundaries */
-	xl_priv->xl_tx_ring = kmalloc((sizeof(struct xl_tx_desc) * XL_TX_RING_SIZE) + 7, GFP_DMA | GFP_KERNEL) ; 
+	xl_priv->xl_tx_ring = kzalloc((sizeof(struct xl_tx_desc) * XL_TX_RING_SIZE) + 7, GFP_DMA | GFP_KERNEL) ; 
 	if (xl_priv->xl_tx_ring = NULL) {
 		printk(KERN_WARNING "%s: Not enough memory to allocate rx buffers.\n",
 				     dev->name);
 		free_irq(dev->irq,dev);
 		return -ENOMEM;
 	}
-	xl_priv->xl_rx_ring = kmalloc((sizeof(struct xl_rx_desc) * XL_RX_RING_SIZE) +7, GFP_DMA | GFP_KERNEL) ; 
+	xl_priv->xl_rx_ring = kzalloc((sizeof(struct xl_rx_desc) * XL_RX_RING_SIZE) +7, GFP_DMA | GFP_KERNEL) ; 
 	if (xl_priv->xl_tx_ring = NULL) {
 		printk(KERN_WARNING "%s: Not enough memory to allocate rx buffers.\n",
 				     dev->name);
@@ -656,8 +656,6 @@ static int xl_open(struct net_device *dev)
 		kfree(xl_priv->xl_tx_ring);
 		return -ENOMEM;
 	}
-	memset(xl_priv->xl_tx_ring,0,sizeof(struct xl_tx_desc) * XL_TX_RING_SIZE) ; 
-	memset(xl_priv->xl_rx_ring,0,sizeof(struct xl_rx_desc) * XL_RX_RING_SIZE) ; 
 
 	 /* Setup Rx Ring */
 	 for (i=0 ; i < XL_RX_RING_SIZE ; i++) { 

--
thanks
surya.
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
