From: Douglas Schilling Landgraf <dougsland@gmail.com>
Date: Wed, 14 Mar 2007 05:17:01 +0000
Subject: [KJ] [PATCH] ni65.c: cleanup not needed casts
Message-Id: <20070314051701.GA23824@dougsland.poa.virtua.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed all unnecessary casts.
Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>


Index: linux-2.6.20.3/drivers/net/ni65.c
=================================--- linux-2.6.20.3.orig/drivers/net/ni65.c
+++ linux-2.6.20.3/drivers/net/ni65.c
@@ -295,7 +295,7 @@ static void ni65_set_performance(struct 
  */
 static int ni65_open(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	int irqval = request_irq(dev->irq, &ni65_interrupt,0,
                         cards[p->cardno].cardname,dev);
 	if (irqval) {
@@ -321,7 +321,7 @@ static int ni65_open(struct net_device *
  */
 static int ni65_close(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	netif_stop_queue(dev);
 
@@ -345,7 +345,7 @@ static int ni65_close(struct net_device 
 
 static void cleanup_card(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	disable_dma(dev->dma);
 	free_dma(dev->dma);
 	release_region(dev->base_addr, cards[p->cardno].total_size);
@@ -444,7 +444,7 @@ static int __init ni65_probe1(struct net
 		release_region(ioaddr, cards[i].total_size);
 		return j;
 	}
-	p = (struct priv *) dev->priv;
+	p = dev->priv;
 	p->cmdr_addr = ioaddr + cards[i].cmd_offset;
 	p->cardno = i;
 	spin_lock_init(&p->ring_lock);
@@ -792,7 +792,7 @@ static void ni65_stop_start(struct net_d
 static int ni65_lance_reinit(struct net_device *dev)
 {
 	 int i;
-	 struct priv *p = (struct priv *) dev->priv;
+	 struct priv *p = dev->priv;
 	 unsigned long flags;
 
 	 p->lock = 0;
@@ -878,7 +878,7 @@ static irqreturn_t ni65_interrupt(int ir
 	struct priv *p;
 	int bcnt = 32;
 
-	p = (struct priv *) dev->priv;
+	p = dev->priv;
 
 	spin_lock(&p->ring_lock);
 
@@ -901,7 +901,7 @@ static irqreturn_t ni65_interrupt(int ir
 
 		if(csr0 & CSR0_ERR)
 		{
-			struct priv *p = (struct priv *) dev->priv;
+			struct priv *p = dev->priv;
 			if(debuglevel > 1)
 				printk(KERN_ERR "%s: general error: %04x.\n",dev->name,csr0);
 			if(csr0 & CSR0_BABL)
@@ -926,7 +926,7 @@ static irqreturn_t ni65_interrupt(int ir
  int j;
  for(j=0;j<RMDNUM;j++)
  {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	int i,k,num1,num2;
 	for(i=RMDNUM-1;i>0;i--) {
 		 num2 = (p->rmdnum + i) & (RMDNUM-1);
@@ -984,7 +984,7 @@ static irqreturn_t ni65_interrupt(int ir
  */
 static void ni65_xmit_intr(struct net_device *dev,int csr0)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	while(p->xmit_queued)
 	{
@@ -1051,7 +1051,7 @@ static void ni65_recv_intr(struct net_de
 	struct rmd *rmdp;
 	int rmdstat,len;
 	int cnt=0;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	rmdp = p->rmdhead + p->rmdnum;
 	while(!( (rmdstat = rmdp->u.s.status) & RCV_OWN))
@@ -1143,7 +1143,7 @@ static void ni65_recv_intr(struct net_de
 static void ni65_timeout(struct net_device *dev)
 {
 	int i;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	printk(KERN_ERR "%s: xmitter timed out, try to restart!\n",dev->name);
 	for(i=0;i<TMDNUM;i++)
@@ -1160,7 +1160,7 @@ static void ni65_timeout(struct net_devi
 
 static int ni65_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	netif_stop_queue(dev);
 
@@ -1224,7 +1224,7 @@ static struct net_device_stats *ni65_get
 
 #if 0
 	int i;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	for(i=0;i<RMDNUM;i++)
 	{
 		struct rmd *rmdp = p->rmdhead + ((p->rmdnum + i) & (RMDNUM-1));
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
