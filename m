From: Douglas Schilling Landgraf <dougsland@gmail.com>
Date: Fri, 16 Feb 2007 02:56:48 +0000
Subject: [KJ] [PATCH] 3c523.c: cleanup not needed casts
Message-Id: <20070216025648.GB6019@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed all unnecessary casts.

Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>

--- linux-2.6.20-vanilla/drivers/net/3c523.c	2007-02-04 16:44:54.000000000 -0200
+++ linux-2.6.20/drivers/net/3c523.c	2007-02-15 18:25:01.000000000 -0200
@@ -309,7 +309,7 @@
 
 static int __init check586(struct net_device *dev, unsigned long where, unsigned size)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	char *iscp_addrs[2];
 	int i = 0;
 
@@ -350,7 +350,7 @@
 
 void alloc586(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	elmc_id_reset586();
 	DELAY(2);
@@ -622,7 +622,7 @@
 	void *ptr;
 	unsigned long s;
 	int i, result = 0;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	volatile struct configure_cmd_struct *cfg_cmd;
 	volatile struct iasetup_cmd_struct *ias_cmd;
 	volatile struct tdr_cmd_struct *tdr_cmd;
@@ -860,7 +860,7 @@
 	volatile struct rfd_struct *rfd = (struct rfd_struct *) ptr;
 	volatile struct rbd_struct *rbd;
 	int i;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	memset((char *) rfd, 0, sizeof(struct rfd_struct) * p->num_recv_buffs);
 	p->rfd_first = rfd;
@@ -921,7 +921,7 @@
 	}
 	/* reading ELMC_CTRL also clears the INT bit. */
 
-	p = (struct priv *) dev->priv;
+	p = dev->priv;
 
 	while ((stat = p->scb->status & STAT_MASK))
 	{
@@ -977,7 +977,7 @@
 	unsigned short totlen;
 	struct sk_buff *skb;
 	struct rbd_struct *rbd;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	for (; (status = p->rfd_top->status) & STAT_COMPL;) {
 		rbd = (struct rbd_struct *) make32(p->rfd_top->rbd_offset);
@@ -1022,7 +1022,7 @@
 
 static void elmc_rnr_int(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	p->stats.rx_errors++;
 
@@ -1045,7 +1045,7 @@
 static void elmc_xmt_int(struct net_device *dev)
 {
 	int status;
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	status = p->xmit_cmds[p->xmit_last]->cmd_status;
 	if (!(status & STAT_COMPL)) {
@@ -1088,7 +1088,7 @@
 
 static void startrecv586(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	p->scb->rfa_offset = make16(p->rfd_first);
 	p->scb->cmd = RUC_START;
@@ -1102,7 +1102,7 @@
 
 static void elmc_timeout(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	/* COMMAND-UNIT active? */
 	if (p->scb->status & CU_ACTIVE) {
 #ifdef DEBUG
@@ -1138,7 +1138,7 @@
 #ifndef NO_NOPCOMMANDS
 	int next_nop;
 #endif
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 
 	netif_stop_queue(dev);
 
@@ -1209,7 +1209,7 @@
 
 static struct net_device_stats *elmc_get_stats(struct net_device *dev)
 {
-	struct priv *p = (struct priv *) dev->priv;
+	struct priv *p = dev->priv;
 	unsigned short crc, aln, rsc, ovrn;
 
 	crc = p->scb->crc_errs;	/* get error-statistic from the ni82586 */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
