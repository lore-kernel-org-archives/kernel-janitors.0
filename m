From: Carlo Perassi <carlo@linux.it>
Date: Sun, 22 Feb 2004 12:05:20 +0000
Subject: Re: [Kernel-janitors] [PATCH] 90 patches for unnecessary casts
Message-Id: <20040222120519.GA1368@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="MGYHOYXEY6WxJCY8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125105212.GA2064@localhost>
In-Reply-To: <20040125105212.GA2064@localhost>
To: kernel-janitors@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I have most of these merged, but some of the changes no longer
> apply.  Please rediff and resend the changes for:
> 
> drivers/net/3c527.c
> drivers/net/tc35815.c
> drivers/net/68360enet.c
> 
> (against 2.6.3).

- a patch for drivers/net/3c527.c is attached
- drivers/net/tc35815.c is fine
- drivers/net/68360enet.c doesn't exist. which file do you mean?

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=3c527

--- drivers/net/3c527.c	2004-02-18 04:58:12.000000000 +0100
+++ tmp/3c527.c	2004-02-22 12:58:56.000000000 +0100
@@ -573,7 +573,7 @@
 
 static int mc32_command_nowait(struct net_device *dev, u16 cmd, void *data, int len)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int ioaddr = dev->base_addr;
 	int ret = -1;
 
@@ -619,7 +619,7 @@
   
 static int mc32_command(struct net_device *dev, u16 cmd, void *data, int len)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int ioaddr = dev->base_addr;
 	int ret = 0;
 	
@@ -671,7 +671,7 @@
 
 static void mc32_start_transceiver(struct net_device *dev) {
 
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int ioaddr = dev->base_addr;
 
 	/* Ignore RX overflow on device closure */ 
@@ -706,7 +706,7 @@
 
 static void mc32_halt_transceiver(struct net_device *dev) 
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int ioaddr = dev->base_addr;
 
 	mc32_ready_poll(dev);	
@@ -743,7 +743,7 @@
 	 
 static int mc32_load_rx_ring(struct net_device *dev)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int i;
 	u16 rx_base;
 	volatile struct skb_header *p;
@@ -792,7 +792,7 @@
 
 static void mc32_flush_rx_ring(struct net_device *dev)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int i; 
 
 	for(i=0; i < RX_RING_LEN; i++) 
@@ -824,7 +824,7 @@
 
 static void mc32_load_tx_ring(struct net_device *dev)
 { 
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	volatile struct skb_header *p;
 	int i; 
 	u16 tx_base;
@@ -861,7 +861,7 @@
 
 static void mc32_flush_tx_ring(struct net_device *dev)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int i;
 
 	for (i=0; i < TX_RING_LEN; i++)
@@ -899,7 +899,7 @@
 static int mc32_open(struct net_device *dev)
 {
 	int ioaddr = dev->base_addr;
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	u8 one=1;
 	u8 regs;
 	u16 descnumbuffs[2] = {TX_RING_LEN, RX_RING_LEN};
@@ -1022,7 +1022,7 @@
 
 static int mc32_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	u32 head = atomic_read(&lp->tx_ring_head);
 	
 	volatile struct skb_header *p, *np;
@@ -1092,7 +1092,7 @@
 
 static void mc32_update_stats(struct net_device *dev)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	volatile struct mc32_stats *st = lp->stats; 
 
 	u32 rx_errors=0; 
@@ -1236,7 +1236,7 @@
 
 static void mc32_tx_ring(struct net_device *dev) 
 {
-	struct mc32_local *lp=(struct mc32_local *)dev->priv;
+	struct mc32_local *lp=dev->priv;
 	volatile struct skb_header *np;
 
 	/*
@@ -1333,7 +1333,7 @@
 	}
  
 	ioaddr = dev->base_addr;
-	lp = (struct mc32_local *)dev->priv;
+	lp = dev->priv;
 
 	/* See whats cooking */
 
@@ -1450,7 +1450,7 @@
 
 static int mc32_close(struct net_device *dev)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	int ioaddr = dev->base_addr;
 
 	u8 regs;
@@ -1499,7 +1499,7 @@
 
 static struct net_device_stats *mc32_get_stats(struct net_device *dev)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	
 	mc32_update_stats(dev); 
 	return &lp->net_stats;
@@ -1531,7 +1531,7 @@
 
 static void do_mc32_set_multicast_list(struct net_device *dev, int retry)
 {
-	struct mc32_local *lp = (struct mc32_local *)dev->priv;
+	struct mc32_local *lp = dev->priv;
 	u16 filt = (1<<2); /* Save Bad Packets, for stats purposes */ 
 
 	if (dev->flags&IFF_PROMISC)

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--MGYHOYXEY6WxJCY8--
