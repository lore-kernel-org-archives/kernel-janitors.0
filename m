From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 17:06:47 +0000
Subject: [KJ] [PATCH] ethernet: Remove unnecessary cast of return value of
Message-Id: <468437FF020000F40000A9AF@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kmalloc() in
drivers/net/giantfar.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/drivers/net/gianfar.c b/drivers/net/gianfar.c
index 6822bf1..96fa639 100644
--- a/drivers/net/gianfar.c
+++ b/drivers/net/gianfar.c
@@ -700,8 +700,7 @@ int startup_gfar(struct net_device *dev)
 	gfar_write(&regs->rbase0, addr);
 
 	/* Setup the skbuff rings */
-	priv->tx_skbuff -	    (struct sk_buff **) kmalloc(sizeof (struct sk_buff *) *
+	priv->tx_skbuff = kmalloc(sizeof (struct sk_buff *) *
 					priv->tx_ring_size, GFP_KERNEL);
 
 	if (NULL = priv->tx_skbuff) {
@@ -715,8 +714,7 @@ int startup_gfar(struct net_device *dev)
 	for (i = 0; i < priv->tx_ring_size; i++)
 		priv->tx_skbuff[i] = NULL;
 
-	priv->rx_skbuff -	    (struct sk_buff **) kmalloc(sizeof (struct sk_buff *) *
+	priv->rx_skbuff = kmalloc(sizeof (struct sk_buff *) *
 					priv->rx_ring_size, GFP_KERNEL);
 
 	if (NULL = priv->rx_skbuff) {

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
