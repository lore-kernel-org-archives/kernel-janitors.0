From: Carlo Perassi <carlo@linux.it>
Date: Fri, 16 Jan 2004 15:22:03 +0000
Subject: [Kernel-janitors] [PATCH] some casts removed
Message-Id: <20040116152203.GA5416@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.
Line 346 of TODO states:
"Lots of unnecessary casts in drivers can be removed"

This micro patch removes some of them.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=rsuc

--- linux-2.6.1/drivers/net/dl2k.c	2004-01-16 15:56:02.000000000 +0100
+++ linux-2.6.1_mod/drivers/net/dl2k.c	2004-01-16 15:57:01.000000000 +0100
@@ -745,7 +745,7 @@
 static void 
 rio_free_tx (struct net_device *dev, int irq) 
 {
-	struct netdev_private *np = (struct netdev_private *) dev->priv;
+	struct netdev_private *np = dev->priv;
 	int entry = np->old_tx % TX_RING_SIZE;
 	int tx_use = 0;
 	unsigned long flag = 0;
@@ -855,7 +855,7 @@
 static int
 receive_packet (struct net_device *dev)
 {
-	struct netdev_private *np = (struct netdev_private *) dev->priv;
+	struct netdev_private *np = dev->priv;
 	int entry = np->cur_rx % RX_RING_SIZE;
 	int cnt = 30;
 
--- linux-2.6.1/drivers/net/fealnx.c	2004-01-16 15:56:02.000000000 +0100
+++ linux-2.6.1_mod/drivers/net/fealnx.c	2004-01-16 15:58:04.000000000 +0100
@@ -1426,7 +1426,7 @@
 	writel(0, dev->base_addr + IMR);
 
 	ioaddr = dev->base_addr;
-	np = (struct netdev_private *) dev->priv;
+	np = dev->priv;
 
 	do {
 		u32 intr_status = readl(ioaddr + ISR);
--- linux-2.6.1/drivers/net/sundance.c	2004-01-16 15:56:02.000000000 +0100
+++ linux-2.6.1_mod/drivers/net/sundance.c	2004-01-16 15:57:16.000000000 +0100
@@ -1136,7 +1136,7 @@
 static int
 reset_tx (struct net_device *dev)
 {
-	struct netdev_private *np = (struct netdev_private*) dev->priv;
+	struct netdev_private *np = dev->priv;
 	long ioaddr = dev->base_addr;
 	struct sk_buff *skb;
 	int i;

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--pWyiEgJYm5f9v55/--
