From: Douglas Schilling Landgraf <dougsland@gmail.com>
Date: Fri, 16 Mar 2007 03:11:47 +0000
Subject: [KJ] [PATCH] ni52.c: cleanup not needed casts
Message-Id: <20070316031147.GA5302@dougsland.poa.virtua.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed all unnecessary casts.
Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>


Index: linux-2.6.20.3/drivers/net/ni52.c
=================================--- linux-2.6.20.3.orig/drivers/net/ni52.c
+++ linux-2.6.20.3/drivers/net/ni52.c
@@ -326,7 +326,7 @@ static int check586(struct net_device *d
  */
 static void alloc586(struct net_device *dev)
 {
-	struct priv *p =	(struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	ni_reset586();
 	DELAY(1);
@@ -560,7 +560,7 @@ static int init586(struct net_device *de
 {
 	void *ptr;
 	int i,result=0;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	volatile struct configure_cmd_struct	*cfg_cmd;
 	volatile struct iasetup_cmd_struct *ias_cmd;
 	volatile struct tdr_cmd_struct *tdr_cmd;
@@ -796,7 +796,7 @@ static void *alloc_rfa(struct net_device
 	volatile struct rfd_struct *rfd = (struct rfd_struct *)ptr;
 	volatile struct rbd_struct *rbd;
 	int i;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	memset((char *) rfd,0,sizeof(struct rfd_struct)*(p->num_recv_buffs+rfdadd));
 	p->rfd_first = rfd;
@@ -848,7 +848,7 @@ static irqreturn_t ni52_interrupt(int ir
 		printk ("ni5210-interrupt: irq %d for unknown device.\n",irq);
 		return IRQ_NONE;
 	}
-	p = (struct priv *) dev->priv;
+	p = dev->priv;
 
 	if(debuglevel > 1)
 		printk("I");
@@ -918,7 +918,7 @@ static void ni52_rcv_int(struct net_devi
 	unsigned short totlen;
 	struct sk_buff *skb;
 	struct rbd_struct *rbd;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	if(debuglevel > 0)
 		printk("R");
@@ -1039,7 +1039,7 @@ static void ni52_rcv_int(struct net_devi
 
 static void ni52_rnr_int(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	p->stats.rx_errors++;
 
@@ -1063,7 +1063,7 @@ static void ni52_rnr_int(struct net_devi
 static void ni52_xmt_int(struct net_device *dev)
 {
 	int status;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	if(debuglevel > 0)
 		printk("X");
@@ -1113,7 +1113,7 @@ static void ni52_xmt_int(struct net_devi
 
 static void startrecv586(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	WAIT_4_SCB_CMD();
 	WAIT_4_SCB_CMD_RUC();
@@ -1125,7 +1125,7 @@ static void startrecv586(struct net_devi
 
 static void ni52_timeout(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 #ifndef NO_NOPCOMMANDS
 	if(p->scb->cus & CU_ACTIVE) /* COMMAND-UNIT active? */
 	{
@@ -1167,7 +1167,7 @@ static int ni52_send_packet(struct sk_bu
 #ifndef NO_NOPCOMMANDS
 	int next_nop;
 #endif
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	if(skb->len > XMIT_BUFF_SIZE)
 	{
@@ -1276,7 +1276,7 @@ static int ni52_send_packet(struct sk_bu
 
 static struct net_device_stats *ni52_get_stats(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	unsigned short crc,aln,rsc,ovrn;
 
 	crc = p->scb->crc_errs; /* get error-statistic from the ni82586 */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
