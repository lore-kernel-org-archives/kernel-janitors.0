From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 03 Aug 2007 17:33:12 +0000
Subject: [PATCH 01/13] dev->priv to netdev_priv(dev), for drivers/net
Message-Id: <200708031733.TAA00724@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org
Cc: jeff@garzik.org, netdev@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


Replacing accesses to dev->priv to netdev_priv(dev). The replacment
is safe when netdev_priv is used to access a private structure that is
right next to the net_device structure in memory. Cf
http://groups.google.com/group/comp.os.linux.development.system/browse_thre=
ad/thread/de19321bcd94dbb8/0d74a4adcd6177bd
This is the case when the net_device structure was allocated with
a call to alloc_netdev or one of its derivative.

Here is an excerpt of the semantic patch that performs the transformation

@ rule1 @
type T;
struct net_device *dev;
@@

 dev =3D=20
(
        alloc_netdev
|        =20
        alloc_etherdev
|
        alloc_trdev
)
   (sizeof(T), ...)

@ rule1bis @
struct net_device *dev;
expression E;
@@
 dev->priv =3D E

@ rule2 depends on rule1 && !rule1bis  @
struct net_device *dev;
type rule1.T;
@@

- (T*) dev->priv
+ netdev_priv(dev)

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: jeff@garzik.org
Cc: netdev@vger.kernel.org
Cc: akpm@linux-foundation.org
---

 drivers/net/3c501.c        |    2 -
 drivers/net/3c505.c        |   36 +++++++++---------
 drivers/net/3c523.c        |   28 +++++++-------
 drivers/net/3c59x.c        |    4 +-
 drivers/net/acenic.c       |    2 -
 drivers/net/atarilance.c   |   22 +++++------
 drivers/net/atp.c          |    2 -
 drivers/net/au1000_eth.c   |   50 +++++++++++++-------------
 drivers/net/de600.c        |    8 ++--
 drivers/net/de620.c        |   14 +++----
 drivers/net/declance.c     |    2 -
 drivers/net/depca.c        |   42 ++++++++++-----------
 drivers/net/dgrs.c         |   32 ++++++++--------
 drivers/net/dm9000.c       |   32 ++++++++--------
 drivers/net/eepro.c        |    4 +-
 drivers/net/epic100.c      |   44 +++++++++++------------
 drivers/net/eth16i.c       |    2 -
 drivers/net/fec.c          |    2 -
 drivers/net/ibmveth.c      |   24 ++++++------
 drivers/net/iseries_veth.c |   20 +++++-----
 drivers/net/lp486e.c       |   30 +++++++--------
 drivers/net/mv643xx_eth.c  |    2 -
 drivers/net/mvme147.c      |    4 +-
 drivers/net/myri_sbus.c    |   14 +++----
 drivers/net/ne2k-pci.c     |    2 -
 drivers/net/ni5010.c       |    2 -
 drivers/net/ni52.c         |   32 ++++++++--------
 drivers/net/pci-skeleton.c |   38 +++++++++----------
 drivers/net/plip.c         |    8 ++--
 drivers/net/qla3xxx.c      |    2 -
 drivers/net/rionet.c       |   28 +++++++-------
 drivers/net/s2io.c         |   74 +++++++++++++++++++-------------------
 drivers/net/sgiseeq.c      |    2 -
 drivers/net/shaper.c       |   16 ++++----
 drivers/net/sis900.c       |   66 +++++++++++++++++-----------------
 drivers/net/smc9194.c      |    6 +--
 drivers/net/sonic.h        |   20 +++++-----
 drivers/net/sun3_82586.c   |   32 ++++++++--------
 drivers/net/sunbmac.c      |   18 ++++-----
 drivers/net/sungem.c       |   54 ++++++++++++++--------------
 drivers/net/sunhme.c       |   26 ++++++-------
 drivers/net/sunqe.c        |   16 ++++----
 drivers/net/tc35815.c      |   86 ++++++++++++++++++++++------------------=
-----
 drivers/net/typhoon.c      |    2 -
 drivers/net/znet.c         |   24 ++++++------
 45 files changed, 488 insertions(+), 488 deletions(-)

diff --git a/drivers/net/3c501.c b/drivers/net/3c501.c
index 4bee99b..2461688 100644
--- a/drivers/net/3c501.c
+++ b/drivers/net/3c501.c
@@ -304,7 +304,7 @@ #endif
 	if (el_debug)
 		printk(KERN_DEBUG "%s", version);
=20
-	memset(dev->priv, 0, sizeof(struct net_local));
+	memset(netdev_priv(dev), 0, sizeof(struct net_local));
 	lp =3D netdev_priv(dev);
 	spin_lock_init(&lp->lock);
=20
diff --git a/drivers/net/3c505.c b/drivers/net/3c505.c
index e985a85..4cf3dde 100644
--- a/drivers/net/3c505.c
+++ b/drivers/net/3c505.c
@@ -218,7 +218,7 @@ static inline int inb_command(unsigned i
 static inline void outb_control(unsigned char val, struct net_device *dev)
 {
 	outb(val, dev->base_addr + PORT_CONTROL);
-	((elp_device *)(dev->priv))->hcr_val =3D val;
+	((elp_device *)(netdev_priv(dev)))->hcr_val =3D val;
 }
=20
 #define HCR_VAL(x)   (((elp_device *)((x)->priv))->hcr_val)
@@ -262,7 +262,7 @@ static inline int get_status(unsigned in
=20
 static inline void set_hsf(struct net_device *dev, int hsf)
 {
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	spin_lock_irqsave(&adapter->lock, flags);
@@ -275,7 +275,7 @@ static int start_receive(struct net_devi
 static inline void adapter_reset(struct net_device *dev)
 {
 	unsigned long timeout;
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	unsigned char orig_hcr =3D adapter->hcr_val;
=20
 	outb_control(0, dev);
@@ -308,7 +308,7 @@ static inline void adapter_reset(struct=20
  */
 static inline void check_3c505_dma(struct net_device *dev)
 {
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	if (adapter->dmaing && time_after(jiffies, adapter->current_dma.start_tim=
e + 10)) {
 		unsigned long flags, f;
 		printk(KERN_ERR "%s: DMA %s timed out, %d bytes left\n", dev->name, adap=
ter->current_dma.direction ? "download" : "upload", get_dma_residue(dev->dm=
a));
@@ -355,7 +355,7 @@ static inline unsigned int send_pcb_fast
 /* Check to see if the receiver needs restarting, and kick it if so */
 static inline void prime_rx(struct net_device *dev)
 {
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	while (adapter->rx_active < ELP_RX_PCBS && netif_running(dev)) {
 		if (!start_receive(dev, &adapter->itx_pcb))
 			break;
@@ -390,7 +390,7 @@ static int send_pcb(struct net_device *d
 {
 	int i;
 	unsigned long timeout;
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	check_3c505_dma(dev);
@@ -478,7 +478,7 @@ static int receive_pcb(struct net_device
 	unsigned long timeout;
 	unsigned long flags;
=20
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
=20
 	set_hsf(dev, 0);
=20
@@ -558,7 +558,7 @@ static int receive_pcb(struct net_device
 static int start_receive(struct net_device *dev, pcb_struct * tx_pcb)
 {
 	int status;
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
=20
 	if (elp_debug >=3D 3)
 		printk(KERN_DEBUG "%s: restarting receiver\n", dev->name);
@@ -586,7 +586,7 @@ static int start_receive(struct net_devi
 static void receive_packet(struct net_device *dev, int len)
 {
 	int rlen;
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	void *target;
 	struct sk_buff *skb;
 	unsigned long flags;
@@ -658,7 +658,7 @@ static irqreturn_t elp_interrupt(int irq
 	unsigned long timeout;
=20
 	dev =3D dev_id;
-	adapter =3D (elp_device *) dev->priv;
+	adapter =3D netdev_priv(dev);
=20
 	spin_lock(&adapter->lock);
=20
@@ -856,7 +856,7 @@ static int elp_open(struct net_device *d
 	elp_device *adapter;
 	int retval;
=20
-	adapter =3D dev->priv;
+	adapter =3D netdev_priv(dev);
=20
 	if (elp_debug >=3D 3)
 		printk(KERN_DEBUG "%s: request to open device\n", dev->name);
@@ -986,7 +986,7 @@ static int elp_open(struct net_device *d
=20
 static int send_packet(struct net_device *dev, struct sk_buff *skb)
 {
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	unsigned long target;
 	unsigned long flags;
=20
@@ -1056,7 +1056,7 @@ static int send_packet(struct net_device
=20
 static void elp_timeout(struct net_device *dev)
 {
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	int stat;
=20
 	stat =3D inb_status(dev->base_addr);
@@ -1078,7 +1078,7 @@ static void elp_timeout(struct net_devic
 static int elp_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	unsigned long flags;
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
=20
 	spin_lock_irqsave(&adapter->lock, flags);
 	check_3c505_dma(dev);
@@ -1120,7 +1120,7 @@ static int elp_start_xmit(struct sk_buff
=20
 static struct net_device_stats *elp_get_stats(struct net_device *dev)
 {
-	elp_device *adapter =3D (elp_device *) dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
=20
 	if (elp_debug >=3D 3)
 		printk(KERN_DEBUG "%s: request for stats\n", dev->name);
@@ -1184,7 +1184,7 @@ static int elp_close(struct net_device *
 {
 	elp_device *adapter;
=20
-	adapter =3D dev->priv;
+	adapter =3D netdev_priv(dev);
=20
 	if (elp_debug >=3D 3)
 		printk(KERN_DEBUG "%s: request to close device\n", dev->name);
@@ -1225,7 +1225,7 @@ static int elp_close(struct net_device *
=20
 static void elp_set_mc_list(struct net_device *dev)
 {
-	elp_device *adapter =3D (elp_device *) dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	struct dev_mc_list *dmi =3D dev->mc_list;
 	int i;
 	unsigned long flags;
@@ -1396,7 +1396,7 @@ static int __init elp_autodetect(struct=20
=20
 static int __init elplus_setup(struct net_device *dev)
 {
-	elp_device *adapter =3D dev->priv;
+	elp_device *adapter =3D netdev_priv(dev);
 	int i, tries, tries1, okay;
 	unsigned long timeout;
 	unsigned long cookie =3D 0;
diff --git a/drivers/net/3c523.c b/drivers/net/3c523.c
index ab18343..98fef26 100644
--- a/drivers/net/3c523.c
+++ b/drivers/net/3c523.c
@@ -309,7 +309,7 @@ static int elmc_open(struct net_device *
=20
 static int __init check586(struct net_device *dev, unsigned long where, un=
signed size)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	char *iscp_addrs[2];
 	int i =3D 0;
=20
@@ -350,7 +350,7 @@ static int __init check586(struct net_de
=20
 void alloc586(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	elmc_id_reset586();
 	DELAY(2);
@@ -421,7 +421,7 @@ static int __init do_elmc_probe(struct n
 	int i =3D 0;
 	unsigned int size =3D 0;
 	int retval;
-	struct priv *pr =3D dev->priv;
+	struct priv *pr =3D netdev_priv(dev);
=20
 	SET_MODULE_OWNER(dev);
 	if (MCA_bus =3D 0) {
@@ -586,7 +586,7 @@ err_out:
=20
 static void cleanup_card(struct net_device *dev)
 {
-	mca_set_adapter_procfn(((struct priv *) (dev->priv))->slot, NULL, NULL);
+	mca_set_adapter_procfn(((struct priv *) (netdev_priv(dev)))->slot, NULL, =
NULL);
 	release_region(dev->base_addr, ELMC_IO_EXTENT);
 }
=20
@@ -622,7 +622,7 @@ static int init586(struct net_device *de
 	void *ptr;
 	unsigned long s;
 	int i, result =3D 0;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	volatile struct configure_cmd_struct *cfg_cmd;
 	volatile struct iasetup_cmd_struct *ias_cmd;
 	volatile struct tdr_cmd_struct *tdr_cmd;
@@ -860,7 +860,7 @@ static void *alloc_rfa(struct net_device
 	volatile struct rfd_struct *rfd =3D (struct rfd_struct *) ptr;
 	volatile struct rbd_struct *rbd;
 	int i;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	memset((char *) rfd, 0, sizeof(struct rfd_struct) * p->num_recv_buffs);
 	p->rfd_first =3D rfd;
@@ -921,7 +921,7 @@ elmc_interrupt(int irq, void *dev_id)
 	}
 	/* reading ELMC_CTRL also clears the INT bit. */
=20
-	p =3D (struct priv *) dev->priv;
+	p =3D netdev_priv(dev);
=20
 	while ((stat =3D p->scb->status & STAT_MASK))
 	{
@@ -977,7 +977,7 @@ static void elmc_rcv_int(struct net_devi
 	unsigned short totlen;
 	struct sk_buff *skb;
 	struct rbd_struct *rbd;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	for (; (status =3D p->rfd_top->status) & STAT_COMPL;) {
 		rbd =3D (struct rbd_struct *) make32(p->rfd_top->rbd_offset);
@@ -1021,7 +1021,7 @@ static void elmc_rcv_int(struct net_devi
=20
 static void elmc_rnr_int(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	p->stats.rx_errors++;
=20
@@ -1044,7 +1044,7 @@ static void elmc_rnr_int(struct net_devi
 static void elmc_xmt_int(struct net_device *dev)
 {
 	int status;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	status =3D p->xmit_cmds[p->xmit_last]->cmd_status;
 	if (!(status & STAT_COMPL)) {
@@ -1087,7 +1087,7 @@ #endif
=20
 static void startrecv586(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	p->scb->rfa_offset =3D make16(p->rfd_first);
 	p->scb->cmd =3D RUC_START;
@@ -1101,7 +1101,7 @@ static void startrecv586(struct net_devi
=20
 static void elmc_timeout(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	/* COMMAND-UNIT active? */
 	if (p->scb->status & CU_ACTIVE) {
 #ifdef DEBUG
@@ -1137,7 +1137,7 @@ static int elmc_send_packet(struct sk_bu
 #ifndef NO_NOPCOMMANDS
 	int next_nop;
 #endif
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	netif_stop_queue(dev);
=20
@@ -1208,7 +1208,7 @@ #endif
=20
 static struct net_device_stats *elmc_get_stats(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	unsigned short crc, aln, rsc, ovrn;
=20
 	crc =3D p->scb->crc_errs;	/* get error-statistic from the ni82586 */
diff --git a/drivers/net/3c59x.c b/drivers/net/3c59x.c
index 001c66d..a70fe56 100644
--- a/drivers/net/3c59x.c
+++ b/drivers/net/3c59x.c
@@ -804,7 +804,7 @@ static int vortex_suspend(struct pci_dev
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev);
=20
-	if (dev && dev->priv) {
+	if (dev && netdev_priv(dev)) {
 		if (netif_running(dev)) {
 			netif_device_detach(dev);
 			vortex_down(dev, 1);
@@ -3193,7 +3193,7 @@ #ifdef CONFIG_EISA
 #endif
=20
 	if (compaq_net_device) {
-		vp =3D compaq_net_device->priv;
+		vp =3D netdev_priv(compaq_net_device);
 		ioaddr =3D ioport_map(compaq_net_device->base_addr,
 		                    VORTEX_TOTAL_SIZE);
=20
diff --git a/drivers/net/acenic.c b/drivers/net/acenic.c
index 62e660a..dcfa951 100644
--- a/drivers/net/acenic.c
+++ b/drivers/net/acenic.c
@@ -468,7 +468,7 @@ static int __devinit acenic_probe_one(st
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
=20
-	ap =3D dev->priv;
+	ap =3D netdev_priv(dev);
 	ap->pdev =3D pdev;
 	ap->name =3D pci_name(pdev);
=20
diff --git a/drivers/net/atarilance.c b/drivers/net/atarilance.c
index dfa8b9b..223df93 100644
--- a/drivers/net/atarilance.c
+++ b/drivers/net/atarilance.c
@@ -524,7 +524,7 @@ static unsigned long __init lance_probe1
 	return( 0 );
=20
   probe_ok:
-	lp =3D (struct lance_private *)dev->priv;
+	lp =3D netdev_priv(dev);
 	MEM =3D (struct lance_memory *)memaddr;
 	IO =3D lp->iobase =3D (struct lance_ioreg *)ioaddr;
 	dev->base_addr =3D (unsigned long)ioaddr; /* informational only */
@@ -653,7 +653,7 @@ #endif
=20
 static int lance_open( struct net_device *dev )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
 	struct lance_ioreg	 *IO =3D lp->iobase;
 	int i;
=20
@@ -694,7 +694,7 @@ static int lance_open( struct net_device
=20
 static void lance_init_ring( struct net_device *dev )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
 	int i;
 	unsigned offset;
=20
@@ -742,7 +742,7 @@ #define	CHECK_OFFSET(o)														 \
=20
 static void lance_tx_timeout (struct net_device *dev)
 {
-	struct lance_private *lp =3D (struct lance_private *) dev->priv;
+	struct lance_private *lp =3D netdev_priv(dev);
 	struct lance_ioreg	 *IO =3D lp->iobase;
=20
 	AREG =3D CSR0;
@@ -785,7 +785,7 @@ #endif
=20
 static int lance_start_xmit( struct sk_buff *skb, struct net_device *dev )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
 	struct lance_ioreg	 *IO =3D lp->iobase;
 	int entry, len;
 	struct lance_tx_head *head;
@@ -879,7 +879,7 @@ static irqreturn_t lance_interrupt( int=20
 		return IRQ_NONE;
 	}
=20
-	lp =3D (struct lance_private *)dev->priv;
+	lp =3D netdev_priv(dev);
 	IO =3D lp->iobase;
 	spin_lock (&lp->devlock);
=20
@@ -980,7 +980,7 @@ #endif
=20
 static int lance_rx( struct net_device *dev )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
 	int entry =3D lp->cur_rx & RX_RING_MOD_MASK;
 	int i;
=20
@@ -1073,7 +1073,7 @@ static int lance_rx( struct net_device *
=20
 static int lance_close( struct net_device *dev )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
 	struct lance_ioreg	 *IO =3D lp->iobase;
=20
 	netif_stop_queue (dev);
@@ -1093,7 +1093,7 @@ static int lance_close( struct net_devic
=20
 static struct net_device_stats *lance_get_stats( struct net_device *dev )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
=20
 	return &lp->stats;
 }
@@ -1108,7 +1108,7 @@ static struct net_device_stats *lance_ge
=20
 static void set_multicast_list( struct net_device *dev )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
 	struct lance_ioreg	 *IO =3D lp->iobase;
=20
 	if (netif_running(dev))
@@ -1150,7 +1150,7 @@ static void set_multicast_list( struct n
=20
 static int lance_set_mac_address( struct net_device *dev, void *addr )
=20
-{	struct lance_private *lp =3D (struct lance_private *)dev->priv;
+{	struct lance_private *lp =3D netdev_priv(dev);
 	struct sockaddr *saddr =3D addr;
 	int i;
=20
diff --git a/drivers/net/atp.c b/drivers/net/atp.c
index 82d78ff..96a9855 100644
--- a/drivers/net/atp.c
+++ b/drivers/net/atp.c
@@ -932,7 +932,7 @@ static void __exit atp_cleanup_module(vo
 	struct net_device *next_dev;
=20
 	while (root_atp_dev) {
-		next_dev =3D ((struct net_local *)root_atp_dev->priv)->next_module;
+		next_dev =3D ((struct net_local *)netdev_priv(root_atp_dev))->next_modul=
e;
 		unregister_netdev(root_atp_dev);
 		/* No need to release_region(), since we never snarf it. */
 		free_netdev(root_atp_dev);
diff --git a/drivers/net/au1000_eth.c b/drivers/net/au1000_eth.c
index e86b369..21713fe 100644
--- a/drivers/net/au1000_eth.c
+++ b/drivers/net/au1000_eth.c
@@ -196,7 +196,7 @@ #endif
  */
 static int mdio_read(struct net_device *dev, int phy_addr, int reg)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	volatile u32 *const mii_control_reg =3D &aup->mac->mii_control;
 	volatile u32 *const mii_data_reg =3D &aup->mac->mii_data;
 	u32 timedout =3D 20;
@@ -230,7 +230,7 @@ static int mdio_read(struct net_device *
=20
 static void mdio_write(struct net_device *dev, int phy_addr, int reg, u16 =
value)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	volatile u32 *const mii_control_reg =3D &aup->mac->mii_control;
 	volatile u32 *const mii_data_reg =3D &aup->mac->mii_data;
 	u32 timedout =3D 20;
@@ -285,7 +285,7 @@ static int mdiobus_reset(struct mii_bus=20
=20
 static int mii_probe (struct net_device *dev)
 {
-	struct au1000_private *const aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup =3D netdev_priv(dev);
 	struct phy_device *phydev =3D NULL;
=20
 #if defined(AU1XXX_PHY_STATIC_CONFIG)
@@ -417,7 +417,7 @@ void ReleaseDB(struct au1000_private *au
=20
 static void enable_rx_tx(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (au1000_debug > 4)
 		printk(KERN_INFO "%s: enable_rx_tx\n", dev->name);
@@ -428,7 +428,7 @@ static void enable_rx_tx(struct net_devi
=20
 static void hard_stop(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (au1000_debug > 4)
 		printk(KERN_INFO "%s: hard stop\n", dev->name);
@@ -440,7 +440,7 @@ static void hard_stop(struct net_device=20
 static void enable_mac(struct net_device *dev, int force_reset)
 {
 	unsigned long flags;
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	spin_lock_irqsave(&aup->lock, flags);
=20
@@ -459,7 +459,7 @@ static void enable_mac(struct net_device
=20
 static void reset_mac_unlocked(struct net_device *dev)
 {
-	struct au1000_private *const aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup =3D netdev_priv(dev);
 	int i;
=20
 	hard_stop(dev);
@@ -485,7 +485,7 @@ static void reset_mac_unlocked(struct ne
=20
 static void reset_mac(struct net_device *dev)
 {
-	struct au1000_private *const aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	if (au1000_debug > 4)
@@ -574,7 +574,7 @@ static int __init au1000_init_module(voi
=20
 static int au1000_get_settings(struct net_device *dev, struct ethtool_cmd =
*cmd)
 {
-	struct au1000_private *aup =3D (struct au1000_private *)dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (aup->phy_dev)
 		return phy_ethtool_gset(aup->phy_dev, cmd);
@@ -584,7 +584,7 @@ static int au1000_get_settings(struct ne
=20
 static int au1000_set_settings(struct net_device *dev, struct ethtool_cmd =
*cmd)
 {
-	struct au1000_private *aup =3D (struct au1000_private *)dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (!capable(CAP_NET_ADMIN))
 		return -EPERM;
@@ -598,7 +598,7 @@ static int au1000_set_settings(struct ne
 static void
 au1000_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	struct au1000_private *aup =3D (struct au1000_private *)dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	strcpy(info->driver, DRV_NAME);
 	strcpy(info->version, DRV_VERSION);
@@ -655,7 +655,7 @@ static struct net_device * au1000_probe(
 	printk("%s: Au1xx0 Ethernet found at 0x%x, irq %d\n",
 		dev->name, base, irq);
=20
-	aup =3D dev->priv;
+	aup =3D netdev_priv(dev);
=20
 	/* Allocate the data buffers */
 	/* Snooping works fine with eth on all au1xxx */
@@ -820,7 +820,7 @@ err_out:
  */
 static int au1000_init(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	u32 flags;
 	int i;
 	u32 control;
@@ -871,7 +871,7 @@ #endif
 static void
 au1000_adjust_link(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	struct phy_device *phydev =3D aup->phy_dev;
 	unsigned long flags;
=20
@@ -951,7 +951,7 @@ au1000_adjust_link(struct net_device *de
 static int au1000_open(struct net_device *dev)
 {
 	int retval;
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (au1000_debug > 4)
 		printk("%s: open: dev=3D%p\n", dev->name, dev);
@@ -986,7 +986,7 @@ static int au1000_open(struct net_device
 static int au1000_close(struct net_device *dev)
 {
 	unsigned long flags;
-	struct au1000_private *const aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup =3D netdev_priv(dev);
=20
 	if (au1000_debug > 4)
 		printk("%s: close: dev=3D%p\n", dev->name, dev);
@@ -1017,7 +1017,7 @@ static void __exit au1000_cleanup_module
 	for (i =3D 0; i < num_ifs; i++) {
 		dev =3D iflist[i].dev;
 		if (dev) {
-			aup =3D (struct au1000_private *) dev->priv;
+			aup =3D netdev_priv(dev);
 			unregister_netdev(dev);
 			for (j =3D 0; j < NUM_RX_DMA; j++)
 				if (aup->rx_db_inuse[j])
@@ -1037,7 +1037,7 @@ static void __exit au1000_cleanup_module
=20
 static void update_tx_stats(struct net_device *dev, u32 status)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	struct net_device_stats *ps =3D &aup->stats;
=20
 	if (status & TX_FRAME_ABORTED) {
@@ -1066,7 +1066,7 @@ static void update_tx_stats(struct net_d
  */
 static void au1000_tx_ack(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	volatile tx_dma_t *ptxd;
=20
 	ptxd =3D aup->tx_dma_ring[aup->tx_tail];
@@ -1093,7 +1093,7 @@ static void au1000_tx_ack(struct net_dev
  */
 static int au1000_tx(struct sk_buff *skb, struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	struct net_device_stats *ps =3D &aup->stats;
 	volatile tx_dma_t *ptxd;
 	u32 buff_stat;
@@ -1147,7 +1147,7 @@ static int au1000_tx(struct sk_buff *skb
=20
 static inline void update_rx_stats(struct net_device *dev, u32 status)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	struct net_device_stats *ps =3D &aup->stats;
=20
 	ps->rx_packets++;
@@ -1175,7 +1175,7 @@ static inline void update_rx_stats(struc
  */
 static int au1000_rx(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
 	struct sk_buff *skb;
 	volatile rx_dma_t *prxd;
 	u32 buff_stat, status;
@@ -1283,7 +1283,7 @@ static void au1000_tx_timeout(struct net
=20
 static void set_rx_mode(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (au1000_debug > 4)
 		printk("%s: set_rx_mode: flags=3D%x\n", dev->name, dev->flags);
@@ -1315,7 +1315,7 @@ static void set_rx_mode(struct net_devic
=20
 static int au1000_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	struct au1000_private *aup =3D (struct au1000_private *)dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (!netif_running(dev)) return -EINVAL;
=20
@@ -1326,7 +1326,7 @@ static int au1000_ioctl(struct net_devic
=20
 static struct net_device_stats *au1000_get_stats(struct net_device *dev)
 {
-	struct au1000_private *aup =3D (struct au1000_private *) dev->priv;
+	struct au1000_private *aup =3D netdev_priv(dev);
=20
 	if (au1000_debug > 4)
 		printk("%s: au1000_get_stats: dev=3D%p\n", dev->name, dev);
diff --git a/drivers/net/de600.c b/drivers/net/de600.c
index dae97b8..27cf8c7 100644
--- a/drivers/net/de600.c
+++ b/drivers/net/de600.c
@@ -156,7 +156,7 @@ static int de600_close(struct net_device
=20
 static struct net_device_stats *get_stats(struct net_device *dev)
 {
-	return (struct net_device_stats *)(dev->priv);
+	return (struct net_device_stats *)(netdev_priv(dev));
 }
=20
 static inline void trigger_interrupt(struct net_device *dev)
@@ -308,7 +308,7 @@ static int de600_tx_intr(struct net_devi
 	if (!(irq_status & TX_FAILED16)) {
 		tx_fifo_out =3D (tx_fifo_out + 1) % TX_PAGES;
 		++free_tx_pages;
-		((struct net_device_stats *)(dev->priv))->tx_packets++;
+		((struct net_device_stats *)(netdev_priv(dev)))->tx_packets++;
 		netif_wake_queue(dev);
 	}
=20
@@ -375,8 +375,8 @@ static void de600_rx_intr(struct net_dev
=20
 	/* update stats */
 	dev->last_rx =3D jiffies;
-	((struct net_device_stats *)(dev->priv))->rx_packets++; /* count all rece=
ives */
-	((struct net_device_stats *)(dev->priv))->rx_bytes +=3D size; /* count al=
l received bytes */
+	((struct net_device_stats *)(netdev_priv(dev)))->rx_packets++; /* count a=
ll receives */
+	((struct net_device_stats *)(netdev_priv(dev)))->rx_bytes +=3D size; /* c=
ount all received bytes */
=20
 	/*
 	 * If any worth-while packets have been received, netif_rx()
diff --git a/drivers/net/de620.c b/drivers/net/de620.c
index dc48924..e57b0f9 100644
--- a/drivers/net/de620.c
+++ b/drivers/net/de620.c
@@ -485,7 +485,7 @@ static int de620_close(struct net_device
  */
 static struct net_device_stats *get_stats(struct net_device *dev)
 {
-	return (struct net_device_stats *)(dev->priv);
+	return (struct net_device_stats *)(netdev_priv(dev));
 }
=20
 /*********************************************
@@ -579,7 +579,7 @@ static int de620_start_xmit(struct sk_bu
 	if(!(using_txbuf =3D (TXBF0 | TXBF1)))
 		netif_wake_queue(dev);
=20
-	((struct net_device_stats *)(dev->priv))->tx_packets++;
+	((struct net_device_stats *)(netdev_priv(dev)))->tx_packets++;
 	spin_unlock_irqrestore(&de620_lock, flags);
 	dev_kfree_skb (skb);
 	return 0;
@@ -660,7 +660,7 @@ static int de620_rx_intr(struct net_devi
 		/* You win some, you lose some. And sometimes plenty... */
 		adapter_init(dev);
 		netif_wake_queue(dev);
-		((struct net_device_stats *)(dev->priv))->rx_over_errors++;
+		((struct net_device_stats *)(netdev_priv(dev)))->rx_over_errors++;
 		return 0;
 	}
=20
@@ -680,7 +680,7 @@ static int de620_rx_intr(struct net_devi
 		next_rx_page =3D header_buf.Rx_NextPage; /* at least a try... */
 		de620_send_command(dev, W_DUMMY);
 		de620_set_register(dev, W_NPRF, next_rx_page);
-		((struct net_device_stats *)(dev->priv))->rx_over_errors++;
+		((struct net_device_stats *)(netdev_priv(dev)))->rx_over_errors++;
 		return 0;
 	}
 	next_rx_page =3D pagelink;
@@ -693,7 +693,7 @@ static int de620_rx_intr(struct net_devi
 		skb =3D dev_alloc_skb(size+2);
 		if (skb =3D NULL) { /* Yeah, but no place to put it... */
 			printk(KERN_WARNING "%s: Couldn't allocate a sk_buff of size %d.\n", de=
v->name, size);
-			((struct net_device_stats *)(dev->priv))->rx_dropped++;
+			((struct net_device_stats *)(netdev_priv(dev)))->rx_dropped++;
 		}
 		else { /* Yep! Go get it! */
 			skb_reserve(skb,2);	/* Align */
@@ -706,8 +706,8 @@ static int de620_rx_intr(struct net_devi
 			netif_rx(skb); /* deliver it "upstairs" */
 			dev->last_rx =3D jiffies;
 			/* count all receives */
-			((struct net_device_stats *)(dev->priv))->rx_packets++;
-			((struct net_device_stats *)(dev->priv))->rx_bytes +=3D size;
+			((struct net_device_stats *)(netdev_priv(dev)))->rx_packets++;
+			((struct net_device_stats *)(netdev_priv(dev)))->rx_bytes +=3D size;
 		}
 	}
=20
diff --git a/drivers/net/declance.c b/drivers/net/declance.c
index b2577f4..d8cb974 100644
--- a/drivers/net/declance.c
+++ b/drivers/net/declance.c
@@ -1047,7 +1047,7 @@ static int __init dec_lance_probe(struct
 		dev =3D root_lance_dev;
 		while (dev) {
 			i++;
-			lp =3D (struct lance_private *)dev->priv;
+			lp =3D netdev_priv(dev);
 			dev =3D lp->next;
 		}
 		snprintf(name, sizeof(name), fmt, i);
diff --git a/drivers/net/depca.c b/drivers/net/depca.c
index 1834970..ba32f83 100644
--- a/drivers/net/depca.c
+++ b/drivers/net/depca.c
@@ -602,7 +602,7 @@ static int __init depca_hw_init (struct=20
 		return -ENXIO;
 	}
=20
-	lp =3D (struct depca_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	mem_start =3D lp->mem_start;
=20
 	if (!mem_start || lp->adapter < DEPCA || lp->adapter >=3Dunknown)
@@ -826,7 +826,7 @@ out_priv:
=20
 static int depca_open(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	u_long ioaddr =3D dev->base_addr;
 	s16 nicsr;
 	int status =3D 0;
@@ -871,7 +871,7 @@ static int depca_open(struct net_device=20
 /* Initialize the lance Rx and Tx descriptor rings. */
 static void depca_init_ring(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	u_int i;
 	u_long offset;
=20
@@ -929,7 +929,7 @@ static void depca_tx_timeout(struct net_
 */
 static int depca_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	u_long ioaddr =3D dev->base_addr;
 	int status =3D 0;
=20
@@ -977,7 +977,7 @@ static irqreturn_t depca_interrupt(int i
 		return IRQ_NONE;
 	}
=20
-	lp =3D (struct depca_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	ioaddr =3D dev->base_addr;
=20
 	spin_lock(&lp->lock);
@@ -1015,7 +1015,7 @@ static irqreturn_t depca_interrupt(int i
 /* Called with lp->lock held */
 static int depca_rx(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	int i, entry;
 	s32 status;
=20
@@ -1113,7 +1113,7 @@ static int depca_rx(struct net_device *d
 */
 static int depca_tx(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	int entry;
 	s32 status;
 	u_long ioaddr =3D dev->base_addr;
@@ -1154,7 +1154,7 @@ static int depca_tx(struct net_device *d
=20
 static int depca_close(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	s16 nicsr;
 	u_long ioaddr =3D dev->base_addr;
=20
@@ -1190,7 +1190,7 @@ static int depca_close(struct net_device
=20
 static void LoadCSRs(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	u_long ioaddr =3D dev->base_addr;
=20
 	outw(CSR1, DEPCA_ADDR);	/* initialisation block address LSW */
@@ -1207,7 +1207,7 @@ static void LoadCSRs(struct net_device *
=20
 static int InitRestartDepca(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	u_long ioaddr =3D dev->base_addr;
 	int i, status =3D 0;
=20
@@ -1236,7 +1236,7 @@ static int InitRestartDepca(struct net_d
=20
 static struct net_device_stats *depca_get_stats(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
=20
 	/* Null body since there is no framing error counter */
=20
@@ -1248,7 +1248,7 @@ static struct net_device_stats *depca_ge
 */
 static void set_multicast_list(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	u_long ioaddr =3D dev->base_addr;
=20
 	netif_stop_queue(dev);
@@ -1277,7 +1277,7 @@ static void set_multicast_list(struct ne
 */
 static void SetMulticastFilter(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	struct dev_mc_list *dmi =3D dev->mc_list;
 	char *addrs;
 	int i, j, bit, byte;
@@ -1445,7 +1445,7 @@ static int __init depca_mca_probe(struct
=20
 	dev->irq =3D irq;
 	dev->base_addr =3D iobase;
-	lp =3D dev->priv;
+	lp =3D netdev_priv(dev);
 	lp->depca_bus =3D DEPCA_BUS_MCA;
 	lp->adapter =3D depca_mca_adapter_type[mdev->index];
 	lp->mem_start =3D mem_start;
@@ -1548,7 +1548,7 @@ static int __init depca_isa_probe (struc
 	dev->base_addr =3D ioaddr;
 	dev->irq =3D irq;		/* Use whatever value the user gave
 				 * us, and 0 if he didn't. */
-	lp =3D dev->priv;
+	lp =3D netdev_priv(dev);
 	lp->depca_bus =3D DEPCA_BUS_ISA;
 	lp->adapter =3D adapter;
 	lp->mem_start =3D mem_start;
@@ -1594,7 +1594,7 @@ static int __init depca_eisa_probe (stru
=20
 	dev->base_addr =3D ioaddr;
 	dev->irq =3D irq;
-	lp =3D dev->priv;
+	lp =3D netdev_priv(dev);
 	lp->depca_bus =3D DEPCA_BUS_EISA;
 	lp->adapter =3D edev->id.driver_data;
 	lp->mem_start =3D mem_start;
@@ -1619,7 +1619,7 @@ static int __devexit depca_device_remove
 	int bus;
=20
 	dev  =3D device->driver_data;
-	lp   =3D dev->priv;
+	lp   =3D netdev_priv(dev);
=20
 	unregister_netdev (dev);
 	iounmap (lp->sh_mem);
@@ -1761,7 +1761,7 @@ static int __init DevicePresent(u_long i
 static int __init get_hw_addr(struct net_device *dev)
 {
 	u_long ioaddr =3D dev->base_addr;
-	struct depca_private *lp =3D dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	int i, k, tmp, status =3D 0;
 	u_short j, x, chksum;
=20
@@ -1796,7 +1796,7 @@ static int __init get_hw_addr(struct net
 */
 static int load_packet(struct net_device *dev, struct sk_buff *skb)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	int i, entry, end, len, status =3D 0;
=20
 	entry =3D lp->tx_new;	/* Ring around buffer number. */
@@ -1851,7 +1851,7 @@ static int load_packet(struct net_device
=20
 static void depca_dbg_open(struct net_device *dev)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	u_long ioaddr =3D dev->base_addr;
 	struct depca_init *p =3D &lp->init_block;
 	int i;
@@ -1926,7 +1926,7 @@ static void depca_dbg_open(struct net_de
 */
 static int depca_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	struct depca_private *lp =3D (struct depca_private *) dev->priv;
+	struct depca_private *lp =3D netdev_priv(dev);
 	struct depca_ioctl *ioc =3D (struct depca_ioctl *) &rq->ifr_ifru;
 	int i, status =3D 0;
 	u_long ioaddr =3D dev->base_addr;
diff --git a/drivers/net/dgrs.c b/drivers/net/dgrs.c
index df62c02..4a2651c 100644
--- a/drivers/net/dgrs.c
+++ b/drivers/net/dgrs.c
@@ -251,7 +251,7 @@ typedef struct
 static void
 proc_reset(struct net_device *dev0, int reset)
 {
-	DGRS_PRIV	*priv0 =3D (DGRS_PRIV *) dev0->priv;
+	DGRS_PRIV	*priv0 =3D netdev_priv(dev0);
=20
 	if (priv0->plxreg)
 	{
@@ -275,7 +275,7 @@ proc_reset(struct net_device *dev0, int=20
 static int
 check_board_dma(struct net_device *dev0)
 {
-	DGRS_PRIV	*priv0 =3D (DGRS_PRIV *) dev0->priv;
+	DGRS_PRIV	*priv0 =3D netdev_priv(dev0);
 	ulong	x;
=20
 	/*
@@ -358,7 +358,7 @@ do_plx_dma(
 {
         int     	i;
         ulong   	csr =3D 0;
-	DGRS_PRIV	*priv =3D (DGRS_PRIV *) dev->priv;
+	DGRS_PRIV	*priv =3D netdev_priv(dev);
=20
 	if (pciaddr)
 	{
@@ -482,7 +482,7 @@ dgrs_rcv_frame(
 		 */
 		if (devN =3D NULL)
 			goto out;
-		privN =3D (DGRS_PRIV *) devN->priv;
+		privN =3D netdev_priv(devN);
 	}
 	else
 	{	/* Switch mode */
@@ -694,7 +694,7 @@ out:
=20
 static int dgrs_start_xmit(struct sk_buff *skb, struct net_device *devN)
 {
-	DGRS_PRIV	*privN =3D (DGRS_PRIV *) devN->priv;
+	DGRS_PRIV	*privN =3D netdev_priv(devN);
 	struct net_device	*dev0;
 	DGRS_PRIV	*priv0;
 	I596_RBD	*rbdp;
@@ -707,7 +707,7 @@ static int dgrs_start_xmit(struct sk_buf
 	if (dgrs_nicmode)
 	{
 		dev0 =3D privN->devtbl[0];
-		priv0 =3D (DGRS_PRIV *) dev0->priv;
+		priv0 =3D netdev_priv(dev0);
 	}
 	else
 	{
@@ -810,7 +810,7 @@ static int dgrs_close( struct net_device
  */
 static struct net_device_stats *dgrs_get_stats( struct net_device *dev )
 {
-	DGRS_PRIV	*priv =3D (DGRS_PRIV *) dev->priv;
+	DGRS_PRIV	*priv =3D netdev_priv(dev);
=20
 	return (&priv->stats);
 }
@@ -821,7 +821,7 @@ static struct net_device_stats *dgrs_get
=20
 static void dgrs_set_multicast_list( struct net_device *dev)
 {
-	DGRS_PRIV	*priv =3D (DGRS_PRIV *) dev->priv;
+	DGRS_PRIV	*priv =3D netdev_priv(dev);
=20
 	priv->port->is_promisc =3D (dev->flags & IFF_PROMISC) ? 1 : 0;
 }
@@ -831,7 +831,7 @@ static void dgrs_set_multicast_list( str
  */
 static int dgrs_ioctl(struct net_device *devN, struct ifreq *ifr, int cmd)
 {
-	DGRS_PRIV	*privN =3D (DGRS_PRIV *) devN->priv;
+	DGRS_PRIV	*privN =3D netdev_priv(devN);
 	DGRS_IOCTL	ioc;
 	int		i;
=20
@@ -897,7 +897,7 @@ static int dgrs_ioctl(struct net_device=20
 static irqreturn_t dgrs_intr(int irq, void *dev_id)
 {
 	struct net_device	*dev0 =3D dev_id;
-	DGRS_PRIV	*priv0 =3D dev0->priv;
+	DGRS_PRIV	*priv0 =3D netdev_priv(dev0);
 	I596_CB		*cbp;
 	int		cmd;
 	int		i;
@@ -987,7 +987,7 @@ ack_intr:
 static int __init
 dgrs_download(struct net_device *dev0)
 {
-	DGRS_PRIV	*priv0 =3D (DGRS_PRIV *) dev0->priv;
+	DGRS_PRIV	*priv0 =3D netdev_priv(dev0);
 	int		is;
 	unsigned long	i;
=20
@@ -1151,7 +1151,7 @@ dgrs_download(struct net_device *dev0)
 static int __init
 dgrs_probe1(struct net_device *dev)
 {
-	DGRS_PRIV	*priv =3D (DGRS_PRIV *) dev->priv;
+	DGRS_PRIV	*priv =3D netdev_priv(dev);
 	unsigned long	i;
 	int		rc;
=20
@@ -1229,7 +1229,7 @@ err_out:
 static int __init
 dgrs_initclone(struct net_device *dev)
 {
-	DGRS_PRIV	*priv =3D (DGRS_PRIV *) dev->priv;
+	DGRS_PRIV	*priv =3D netdev_priv(dev);
 	int		i;
=20
 	printk("%s: Digi RightSwitch port %d ",
@@ -1259,7 +1259,7 @@ dgrs_found_device(
 	if (!dev)
 		goto err0;
=20
-	priv =3D (DGRS_PRIV *)dev->priv;
+	priv =3D netdev_priv(dev);
=20
 	dev->base_addr =3D io;
 	dev->mem_start =3D mem;
@@ -1305,7 +1305,7 @@ dgrs_found_device(
 		/* Don't copy the network device structure! */
=20
 		/* copy the priv structure of dev[0] */
-		privN =3D (DGRS_PRIV *)devN->priv;
+		privN =3D netdev_priv(devN);
 		*privN =3D *priv;
=20
 			/* ... and zero out VM areas */
@@ -1350,7 +1350,7 @@ dgrs_found_device(
=20
 static void __devexit dgrs_remove(struct net_device *dev)
 {
-	DGRS_PRIV *priv =3D dev->priv;
+	DGRS_PRIV *priv =3D netdev_priv(dev);
 	int i;
=20
 	unregister_netdev(dev);
diff --git a/drivers/net/dm9000.c b/drivers/net/dm9000.c
index c3de81b..38064df 100644
--- a/drivers/net/dm9000.c
+++ b/drivers/net/dm9000.c
@@ -328,7 +328,7 @@ static void dm9000_set_io(struct board_i
 /* Our watchdog timed out. Called by the networking layer */
 static void dm9000_timeout(struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
 	u8 reg_save;
 	unsigned long flags;
=20
@@ -422,7 +422,7 @@ dm9000_probe(struct platform_device *pde
 	PRINTK2("dm9000_probe()");
=20
 	/* setup board info structure */
-	db =3D (struct board_info *) ndev->priv;
+	db =3D netdev_priv(ndev);
 	memset(db, 0, sizeof (*db));
=20
 	spin_lock_init(&db->lock);
@@ -625,7 +625,7 @@ #endif
 static int
 dm9000_open(struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
=20
 	PRINTK2("entering dm9000_open\n");
=20
@@ -658,7 +658,7 @@ dm9000_open(struct net_device *dev)
 static void
 dm9000_init_dm9000(struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
=20
 	PRINTK1("entering %s\n",__FUNCTION__);
=20
@@ -700,7 +700,7 @@ dm9000_init_dm9000(struct net_device *de
 static int
 dm9000_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
=20
 	PRINTK3("dm9000_start_xmit\n");
=20
@@ -755,7 +755,7 @@ dm9000_start_xmit(struct sk_buff *skb, s
 static void
 dm9000_shutdown(struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
=20
 	/* RESET device */
 	dm9000_phy_write(dev, 0, MII_BMCR, BMCR_RESET);	/* PHY RESET */
@@ -771,7 +771,7 @@ dm9000_shutdown(struct net_device *dev)
 static int
 dm9000_stop(struct net_device *ndev)
 {
-	board_info_t *db =3D (board_info_t *) ndev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(ndev);
=20
 	PRINTK1("entering %s\n",__FUNCTION__);
=20
@@ -831,7 +831,7 @@ dm9000_interrupt(int irq, void *dev_id)
 	}
=20
 	/* A real interrupt coming */
-	db =3D (board_info_t *) dev->priv;
+	db =3D (board_info_t *) netdev_priv(dev);
 	spin_lock(&db->lock);
=20
 	/* Save previous register address */
@@ -869,7 +869,7 @@ dm9000_interrupt(int irq, void *dev_id)
 static struct net_device_stats *
 dm9000_get_stats(struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
 	return &db->stats;
 }
=20
@@ -882,7 +882,7 @@ static void
 dm9000_timer(unsigned long data)
 {
 	struct net_device *dev =3D (struct net_device *) data;
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
=20
 	PRINTK3("dm9000_timer()\n");
=20
@@ -904,7 +904,7 @@ struct dm9000_rxhdr {
 static void
 dm9000_rx(struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
 	struct dm9000_rxhdr rxhdr;
 	struct sk_buff *skb;
 	u8 rxbyte, *rdptr;
@@ -1061,7 +1061,7 @@ cal_CRC(unsigned char *Data, unsigned in
 static void
 dm9000_hash_table(struct net_device *dev)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
 	struct dev_mc_list *mcptr =3D dev->mc_list;
 	int mc_cnt =3D dev->mc_count;
 	u32 hash_val;
@@ -1104,7 +1104,7 @@ dm9000_hash_table(struct net_device *dev
 static int
 dm9000_phy_read(struct net_device *dev, int phy_reg_unused, int reg)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
 	unsigned long flags;
 	unsigned int reg_save;
 	int ret;
@@ -1138,7 +1138,7 @@ dm9000_phy_read(struct net_device *dev,=20
 static void
 dm9000_phy_write(struct net_device *dev, int phyaddr_unused, int reg, int =
value)
 {
-	board_info_t *db =3D (board_info_t *) dev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(dev);
 	unsigned long flags;
 	unsigned long reg_save;
=20
@@ -1182,7 +1182,7 @@ static int
 dm9000_drv_resume(struct platform_device *dev)
 {
 	struct net_device *ndev =3D platform_get_drvdata(dev);
-	board_info_t *db =3D (board_info_t *) ndev->priv;
+	board_info_t *db =3D (board_info_t *) netdev_priv(ndev);
=20
 	if (ndev) {
=20
@@ -1204,7 +1204,7 @@ dm9000_drv_remove(struct platform_device
 	platform_set_drvdata(pdev, NULL);
=20
 	unregister_netdev(ndev);
-	dm9000_release_board(pdev, (board_info_t *) ndev->priv);
+	dm9000_release_board(pdev, (board_info_t *) netdev_priv(ndev));
 	free_netdev(ndev);		/* free device structure */
=20
 	PRINTK1("clean_module() exit\n");
diff --git a/drivers/net/eepro.c b/drivers/net/eepro.c
index 4768023..52b29b7 100644
--- a/drivers/net/eepro.c
+++ b/drivers/net/eepro.c
@@ -611,7 +611,7 @@ #endif
=20
 static void __init printEEPROMInfo(struct net_device *dev)
 {
-	struct eepro_local *lp =3D (struct eepro_local *)dev->priv;
+	struct eepro_local *lp =3D netdev_priv(dev);
 	int ioaddr =3D dev->base_addr;
 	unsigned short Word;
 	int i,j;
@@ -1700,7 +1700,7 @@ eepro_transmit_interrupt(struct net_devi
 static int eepro_ethtool_get_settings(struct net_device *dev,
 					struct ethtool_cmd *cmd)
 {
-	struct eepro_local	*lp =3D (struct eepro_local *)dev->priv;
+	struct eepro_local	*lp =3D netdev_priv(dev);
=20
 	cmd->supported =3D 	SUPPORTED_10baseT_Half |
 				SUPPORTED_10baseT_Full |
diff --git a/drivers/net/epic100.c b/drivers/net/epic100.c
index 1197784..3413a88 100644
--- a/drivers/net/epic100.c
+++ b/drivers/net/epic100.c
@@ -366,7 +366,7 @@ #else
 #endif
=20
 	pci_set_drvdata(pdev, dev);
-	ep =3D dev->priv;
+	ep =3D netdev_priv(dev);
 	ep->mii.dev =3D dev;
 	ep->mii.mdio_read =3D mdio_read;
 	ep->mii.mdio_write =3D mdio_write;
@@ -652,7 +652,7 @@ static void mdio_write(struct net_device
=20
 static int epic_open(struct net_device *dev)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	long ioaddr =3D dev->base_addr;
 	int i;
 	int retval;
@@ -760,7 +760,7 @@ #endif
 static void epic_pause(struct net_device *dev)
 {
 	long ioaddr =3D dev->base_addr;
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
=20
 	netif_stop_queue (dev);
=20
@@ -783,7 +783,7 @@ static void epic_pause(struct net_device
 static void epic_restart(struct net_device *dev)
 {
 	long ioaddr =3D dev->base_addr;
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	int i;
=20
 	/* Soft reset the chip. */
@@ -835,7 +835,7 @@ #endif
=20
 static void check_media(struct net_device *dev)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	long ioaddr =3D dev->base_addr;
 	int mii_lpa =3D ep->mii_phy_cnt ? mdio_read(dev, ep->phys[0], MII_LPA) : =
0;
 	int negotiated =3D mii_lpa & ep->mii.advertising;
@@ -857,7 +857,7 @@ static void check_media(struct net_devic
 static void epic_timer(unsigned long data)
 {
 	struct net_device *dev =3D (struct net_device *)data;
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	long ioaddr =3D dev->base_addr;
 	int next_tick =3D 5*HZ;
=20
@@ -878,7 +878,7 @@ static void epic_timer(unsigned long dat
=20
 static void epic_tx_timeout(struct net_device *dev)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	long ioaddr =3D dev->base_addr;
=20
 	if (debug > 0) {
@@ -907,7 +907,7 @@ static void epic_tx_timeout(struct net_d
 /* Initialize the Rx and Tx rings, along with various 'dev' bits. */
 static void epic_init_ring(struct net_device *dev)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	int i;
=20
 	ep->tx_full =3D 0;
@@ -953,7 +953,7 @@ static void epic_init_ring(struct net_de
=20
 static int epic_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	int entry, free_count;
 	u32 ctrl_word;
 	unsigned long flags;
@@ -1081,7 +1081,7 @@ #endif
 static irqreturn_t epic_interrupt(int irq, void *dev_instance)
 {
 	struct net_device *dev =3D dev_instance;
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	long ioaddr =3D dev->base_addr;
 	unsigned int handled =3D 0;
 	int status;
@@ -1149,7 +1149,7 @@ out:
=20
 static int epic_rx(struct net_device *dev, int budget)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	int entry =3D ep->cur_rx % RX_RING_SIZE;
 	int rx_work_limit =3D ep->dirty_rx + RX_RING_SIZE - ep->cur_rx;
 	int work_done =3D 0;
@@ -1259,7 +1259,7 @@ static void epic_rx_err(struct net_devic
=20
 static int epic_poll(struct net_device *dev, int *budget)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	int work_done =3D 0, orig_budget;
 	long ioaddr =3D dev->base_addr;
=20
@@ -1304,7 +1304,7 @@ rx_action:
 static int epic_close(struct net_device *dev)
 {
 	long ioaddr =3D dev->base_addr;
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	struct sk_buff *skb;
 	int i;
=20
@@ -1353,7 +1353,7 @@ static int epic_close(struct net_device=20
=20
 static struct net_device_stats *epic_get_stats(struct net_device *dev)
 {
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	long ioaddr =3D dev->base_addr;
=20
 	if (netif_running(dev)) {
@@ -1374,7 +1374,7 @@ static struct net_device_stats *epic_get
 static void set_rx_mode(struct net_device *dev)
 {
 	long ioaddr =3D dev->base_addr;
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
 	unsigned char mc_filter[8];		 /* Multicast hash filter */
 	int i;
=20
@@ -1413,7 +1413,7 @@ static void set_rx_mode(struct net_devic
=20
 static void netdev_get_drvinfo (struct net_device *dev, struct ethtool_drv=
info *info)
 {
-	struct epic_private *np =3D dev->priv;
+	struct epic_private *np =3D netdev_priv(dev);
=20
 	strcpy (info->driver, DRV_NAME);
 	strcpy (info->version, DRV_VERSION);
@@ -1422,7 +1422,7 @@ static void netdev_get_drvinfo (struct n
=20
 static int netdev_get_settings(struct net_device *dev, struct ethtool_cmd =
*cmd)
 {
-	struct epic_private *np =3D dev->priv;
+	struct epic_private *np =3D netdev_priv(dev);
 	int rc;
=20
 	spin_lock_irq(&np->lock);
@@ -1434,7 +1434,7 @@ static int netdev_get_settings(struct ne
=20
 static int netdev_set_settings(struct net_device *dev, struct ethtool_cmd =
*cmd)
 {
-	struct epic_private *np =3D dev->priv;
+	struct epic_private *np =3D netdev_priv(dev);
 	int rc;
=20
 	spin_lock_irq(&np->lock);
@@ -1446,13 +1446,13 @@ static int netdev_set_settings(struct ne
=20
 static int netdev_nway_reset(struct net_device *dev)
 {
-	struct epic_private *np =3D dev->priv;
+	struct epic_private *np =3D netdev_priv(dev);
 	return mii_nway_restart(&np->mii);
 }
=20
 static u32 netdev_get_link(struct net_device *dev)
 {
-	struct epic_private *np =3D dev->priv;
+	struct epic_private *np =3D netdev_priv(dev);
 	return mii_link_ok(&np->mii);
 }
=20
@@ -1503,7 +1503,7 @@ static const struct ethtool_ops netdev_e
=20
 static int netdev_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	struct epic_private *np =3D dev->priv;
+	struct epic_private *np =3D netdev_priv(dev);
 	long ioaddr =3D dev->base_addr;
 	struct mii_ioctl_data *data =3D if_mii(rq);
 	int rc;
@@ -1531,7 +1531,7 @@ static int netdev_ioctl(struct net_devic
 static void __devexit epic_remove_one (struct pci_dev *pdev)
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev);
-	struct epic_private *ep =3D dev->priv;
+	struct epic_private *ep =3D netdev_priv(dev);
=20
 	pci_free_consistent(pdev, TX_TOTAL_SIZE, ep->tx_ring, ep->tx_ring_dma);
 	pci_free_consistent(pdev, RX_TOTAL_SIZE, ep->rx_ring, ep->rx_ring_dma);
diff --git a/drivers/net/eth16i.c b/drivers/net/eth16i.c
index 04abf59..3fe913c 100644
--- a/drivers/net/eth16i.c
+++ b/drivers/net/eth16i.c
@@ -1481,7 +1481,7 @@ void __exit cleanup_module(void)
 	for(this_dev =3D 0; this_dev < MAX_ETH16I_CARDS; this_dev++) {
 		struct net_device *dev =3D dev_eth16i[this_dev];
=20
-		if(dev->priv) {
+		if(netdev_priv(dev)) {
 			unregister_netdev(dev);
 			free_irq(dev->irq, dev);
 			release_region(dev->base_addr, ETH16I_IO_EXTENT);
diff --git a/drivers/net/fec.c b/drivers/net/fec.c
index 4e8df91..fdad6f8 100644
--- a/drivers/net/fec.c
+++ b/drivers/net/fec.c
@@ -1165,7 +1165,7 @@ #define MII_DP8384X_PHYSTST    16  /* PH
=20
 static void mii_parse_dp8384x_sr2(uint mii_reg, struct net_device *dev)
 {
-	struct fec_enet_private *fep =3D dev->priv;
+	struct fec_enet_private *fep =3D netdev_priv(dev);
 	volatile uint *s =3D &(fep->phy_status);
=20
 	*s &=3D ~(PHY_STAT_SPMASK | PHY_STAT_LINK | PHY_STAT_ANC);
diff --git a/drivers/net/ibmveth.c b/drivers/net/ibmveth.c
index d96eb72..65fe9c5 100644
--- a/drivers/net/ibmveth.c
+++ b/drivers/net/ibmveth.c
@@ -470,7 +470,7 @@ retry:
=20
 static int ibmveth_open(struct net_device *netdev)
 {
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	u64 mac_address =3D 0;
 	int rxq_entries =3D 1;
 	unsigned long lpar_rc;
@@ -582,7 +582,7 @@ static int ibmveth_open(struct net_devic
=20
 static int ibmveth_close(struct net_device *netdev)
 {
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	long lpar_rc;
=20
 	ibmveth_debug_printk("close starting\n");
@@ -651,7 +651,7 @@ #define page_offset(v) ((unsigned long)(
=20
 static int ibmveth_start_xmit(struct sk_buff *skb, struct net_device *netd=
ev)
 {
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	union ibmveth_buf_desc desc[IbmVethMaxSendFrags];
 	unsigned long lpar_rc;
 	int nfrags =3D 0, curfrag;
@@ -769,7 +769,7 @@ out:	spin_lock_irqsave(&adapter->stats_l
=20
 static int ibmveth_poll(struct net_device *netdev, int *budget)
 {
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	int max_frames_to_process =3D netdev->quota;
 	int frames_processed =3D 0;
 	int more_work =3D 1;
@@ -846,7 +846,7 @@ static int ibmveth_poll(struct net_devic
 static irqreturn_t ibmveth_interrupt(int irq, void *dev_instance)
 {
 	struct net_device *netdev =3D dev_instance;
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	unsigned long lpar_rc;
=20
 	if(netif_rx_schedule_prep(netdev)) {
@@ -859,13 +859,13 @@ static irqreturn_t ibmveth_interrupt(int
=20
 static struct net_device_stats *ibmveth_get_stats(struct net_device *dev)
 {
-	struct ibmveth_adapter *adapter =3D dev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(dev);
 	return &adapter->stats;
 }
=20
 static void ibmveth_set_multicast_list(struct net_device *netdev)
 {
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	unsigned long lpar_rc;
=20
 	if((netdev->flags & IFF_PROMISC) || (netdev->mc_count > adapter->mcastFil=
terSize)) {
@@ -913,7 +913,7 @@ static void ibmveth_set_multicast_list(s
=20
 static int ibmveth_change_mtu(struct net_device *dev, int new_mtu)
 {
-	struct ibmveth_adapter *adapter =3D dev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(dev);
 	int new_mtu_oh =3D new_mtu + IBMVETH_BUFF_OH;
 	int reinit =3D 0;
 	int i, rc;
@@ -954,7 +954,7 @@ static int ibmveth_change_mtu(struct net
 #ifdef CONFIG_NET_POLL_CONTROLLER
 static void ibmveth_poll_controller(struct net_device *dev)
 {
-	ibmveth_replenish_task(dev->priv);
+	ibmveth_replenish_task(netdev_priv(dev));
 	ibmveth_interrupt(dev->irq, dev);
 }
 #endif
@@ -996,7 +996,7 @@ static int __devinit ibmveth_probe(struc
=20
 	SET_MODULE_OWNER(netdev);
=20
-	adapter =3D netdev->priv;
+	adapter =3D netdev_priv(netdev);
 	memset(adapter, 0, sizeof(adapter));
 	dev->dev.driver_data =3D netdev;
=20
@@ -1076,7 +1076,7 @@ #endif
 static int __devexit ibmveth_remove(struct vio_dev *dev)
 {
 	struct net_device *netdev =3D dev->dev.driver_data;
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	int i;
=20
 	for(i =3D 0; i<IbmVethNumBufferPools; i++)
@@ -1256,7 +1256,7 @@ const char * buf, size_t count)
 						      kobj);
 	struct net_device *netdev  	    container_of(kobj->parent, struct device,=
 kobj)->driver_data;
-	struct ibmveth_adapter *adapter =3D netdev->priv;
+	struct ibmveth_adapter *adapter =3D netdev_priv(netdev);
 	long value =3D simple_strtol(buf, NULL, 10);
 	long rc;
=20
diff --git a/drivers/net/iseries_veth.c b/drivers/net/iseries_veth.c
index 0433c41..ed0ffe3 100644
--- a/drivers/net/iseries_veth.c
+++ b/drivers/net/iseries_veth.c
@@ -936,7 +936,7 @@ static void veth_release_connection(stru
=20
 static int veth_open(struct net_device *dev)
 {
-	struct veth_port *port =3D (struct veth_port *) dev->priv;
+	struct veth_port *port =3D netdev_priv(dev);
=20
 	memset(&port->stats, 0, sizeof (port->stats));
 	netif_start_queue(dev);
@@ -951,7 +951,7 @@ static int veth_close(struct net_device=20
=20
 static struct net_device_stats *veth_get_stats(struct net_device *dev)
 {
-	struct veth_port *port =3D (struct veth_port *) dev->priv;
+	struct veth_port *port =3D netdev_priv(dev);
=20
 	return &port->stats;
 }
@@ -966,7 +966,7 @@ static int veth_change_mtu(struct net_de
=20
 static void veth_set_multicast_list(struct net_device *dev)
 {
-	struct veth_port *port =3D (struct veth_port *) dev->priv;
+	struct veth_port *port =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	write_lock_irqsave(&port->mcast_gate, flags);
@@ -1058,7 +1058,7 @@ static struct net_device * __init veth_p
 		return NULL;
 	}
=20
-	port =3D (struct veth_port *) dev->priv;
+	port =3D netdev_priv(dev);
=20
 	spin_lock_init(&port->queue_lock);
 	rwlock_init(&port->mcast_gate);
@@ -1120,7 +1120,7 @@ static int veth_transmit_to_one(struct s
 				struct net_device *dev)
 {
 	struct veth_lpar_connection *cnx =3D veth_cnx[rlp];
-	struct veth_port *port =3D (struct veth_port *) dev->priv;
+	struct veth_port *port =3D netdev_priv(dev);
 	HvLpEvent_Rc rc;
 	struct veth_msg *msg =3D NULL;
 	unsigned long flags;
@@ -1183,7 +1183,7 @@ static void veth_transmit_to_many(struct
 					  HvLpIndexMap lpmask,
 					  struct net_device *dev)
 {
-	struct veth_port *port =3D (struct veth_port *) dev->priv;
+	struct veth_port *port =3D netdev_priv(dev);
 	int i, success, error;
=20
 	success =3D error =3D 0;
@@ -1210,7 +1210,7 @@ static void veth_transmit_to_many(struct
 static int veth_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	unsigned char *frame =3D skb->data;
-	struct veth_port *port =3D (struct veth_port *) dev->priv;
+	struct veth_port *port =3D netdev_priv(dev);
 	HvLpIndexMap lpmask;
=20
 	if (! (frame[0] & 0x01)) {
@@ -1274,7 +1274,7 @@ static void veth_wake_queues(struct veth
 		if (! dev)
 			continue;
=20
-		port =3D (struct veth_port *)dev->priv;
+		port =3D netdev_priv(dev);
=20
 		if (! (port->lpar_map & (1<<cnx->remote_lp)))
 			continue;
@@ -1303,7 +1303,7 @@ static void veth_stop_queues(struct veth
 		if (! dev)
 			continue;
=20
-		port =3D (struct veth_port *)dev->priv;
+		port =3D netdev_priv(dev);
=20
 		/* If this cnx is not on the vlan for this port, continue */
 		if (! (port->lpar_map & (1 << cnx->remote_lp)))
@@ -1525,7 +1525,7 @@ static void veth_receive(struct veth_lpa
 			continue;
 		}
=20
-		port =3D (struct veth_port *)dev->priv;
+		port =3D netdev_priv(dev);
 		dest =3D *((u64 *) skb->data) & 0xFFFFFFFFFFFF0000;
=20
 		if ((vlan > HVMAXARCHITECTEDVIRTUALLANS) || !port) {
diff --git a/drivers/net/lp486e.c b/drivers/net/lp486e.c
index 5fc18da..673a780 100644
--- a/drivers/net/lp486e.c
+++ b/drivers/net/lp486e.c
@@ -392,7 +392,7 @@ i596_timeout(struct net_device *dev, cha
 	struct i596_private *lp;
 	int boguscnt =3D ct;
=20
-	lp =3D (struct i596_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	while (lp->scb.command) {
 		if (--boguscnt =3D 0) {
 			printk("%s: %s timed out - stat %4.4x, cmd %4.4x\n",
@@ -413,7 +413,7 @@ init_rx_bufs(struct net_device *dev, int
 	int i;
 	// struct i596_rbd *rbd;
=20
-	lp =3D (struct i596_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	lp->scb.pa_rfd =3D I596_NULL;
=20
 	for (i =3D 0; i < num; i++) {
@@ -470,7 +470,7 @@ remove_rx_bufs(struct net_device *dev) {
 	struct i596_private *lp;
 	struct i596_rfd *rfd;
=20
-	lp =3D (struct i596_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	lp->rx_tail->pa_next =3D I596_NULL;
=20
 	do {
@@ -545,7 +545,7 @@ #endif
=20
 static int
 i596_scp_setup(struct net_device *dev) {
-	struct i596_private *lp =3D dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
 	int boguscnt;
=20
 	/* Setup SCP, ISCP, SCB */
@@ -626,7 +626,7 @@ init_i596(struct net_device *dev) {
 	if (i596_scp_setup(dev))
 		return 1;
=20
-	lp =3D (struct i596_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	lp->scb.command =3D 0;
=20
 	memcpy ((void *)lp->i596_config, init_setup, 14);
@@ -709,7 +709,7 @@ #endif
=20
 static int
 i596_rx(struct net_device *dev) {
-	struct i596_private *lp =3D (struct i596_private *) dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
 	struct i596_rfd *rfd;
 	int frames =3D 0;
=20
@@ -742,7 +742,7 @@ i596_cleanup_cmd(struct net_device *dev)
 	struct i596_private *lp;
 	struct i596_cmd *cmd;
=20
-	lp =3D (struct i596_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	while (lp->cmd_head) {
 		cmd =3D (struct i596_cmd *)lp->cmd_head;
=20
@@ -810,7 +810,7 @@ static void i596_reset(struct net_device
 }
=20
 static void i596_add_cmd(struct net_device *dev, struct i596_cmd *cmd) {
-	struct i596_private *lp =3D dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
 	int ioaddr =3D dev->base_addr;
 	unsigned long flags;
=20
@@ -869,7 +869,7 @@ static int i596_open(struct net_device *
 }
=20
 static int i596_start_xmit (struct sk_buff *skb, struct net_device *dev) {
-	struct i596_private *lp =3D dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
 	struct tx_cmd *tx_cmd;
 	short length;
=20
@@ -917,7 +917,7 @@ static int i596_start_xmit (struct sk_bu
=20
 static void
 i596_tx_timeout (struct net_device *dev) {
-	struct i596_private *lp =3D dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
 	int ioaddr =3D dev->base_addr;
=20
 	/* Transmitter timeout, serious problems. */
@@ -975,7 +975,7 @@ static int __init lp486e_probe(struct ne
 		return -EBUSY;
 	}
=20
-	lp =3D (struct i596_private *) dev->priv;
+	lp =3D netdev_priv(dev);
 	spin_lock_init(&lp->cmd_lock);
=20
 	/*
@@ -1156,7 +1156,7 @@ i596_interrupt (int irq, void *dev_insta
 	unsigned short status, ack_cmd =3D 0;
 	int frames_in =3D 0;
=20
-	lp =3D (struct i596_private *) dev->priv;
+	lp =3D netdev_priv(dev);
=20
 	/*
 	 * The 82596 examines the command, performs the required action,
@@ -1222,7 +1222,7 @@ #endif
 }
=20
 static int i596_close(struct net_device *dev) {
-	struct i596_private *lp =3D dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
=20
 	netif_stop_queue(dev);
=20
@@ -1245,7 +1245,7 @@ static int i596_close(struct net_device=20
 }
=20
 static struct net_device_stats * i596_get_stats(struct net_device *dev) {
-	struct i596_private *lp =3D dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
=20
 	return &lp->stats;
 }
@@ -1255,7 +1255,7 @@ static struct net_device_stats * i596_ge
 */
=20
 static void set_multicast_list(struct net_device *dev) {
-	struct i596_private *lp =3D dev->priv;
+	struct i596_private *lp =3D netdev_priv(dev);
 	struct i596_cmd *cmd;
=20
 	if (i596_debug > 1)
diff --git a/drivers/net/mv643xx_eth.c b/drivers/net/mv643xx_eth.c
index 1799eee..85fca52 100644
--- a/drivers/net/mv643xx_eth.c
+++ b/drivers/net/mv643xx_eth.c
@@ -2709,7 +2709,7 @@ static int mv643xx_get_stats_count(struc
 static void mv643xx_get_ethtool_stats(struct net_device *netdev,
 				struct ethtool_stats *stats, uint64_t *data)
 {
-	struct mv643xx_private *mp =3D netdev->priv;
+	struct mv643xx_private *mp =3D netdev_priv(netdev);
 	int i;
=20
 	eth_update_mib_counters(mp);
diff --git a/drivers/net/mvme147.c b/drivers/net/mvme147.c
index e246d00..052ce2d 100644
--- a/drivers/net/mvme147.c
+++ b/drivers/net/mvme147.c
@@ -110,7 +110,7 @@ struct net_device * __init mvme147lance_
 		dev->dev_addr[3], dev->dev_addr[4],
 		dev->dev_addr[5]);
=20
-	lp =3D (struct m147lance_private *)dev->priv;
+	lp =3D netdev_priv(dev);
 	lp->ram =3D __get_dma_pages(GFP_ATOMIC, 3);	/* 16K */
 	if (!lp->ram)
 	{
@@ -194,7 +194,7 @@ int __init init_module(void)
=20
 void __exit cleanup_module(void)
 {
-	struct m147lance_private *lp =3D dev_mvme147_lance->priv;
+	struct m147lance_private *lp =3D netdev_priv(dev_mvme147_lance);
 	unregister_netdev(dev_mvme147_lance);
 	free_pages(lp->ram, 3);
 	free_netdev(dev_mvme147_lance);
diff --git a/drivers/net/myri_sbus.c b/drivers/net/myri_sbus.c
index 13444da..4f7919d 100644
--- a/drivers/net/myri_sbus.c
+++ b/drivers/net/myri_sbus.c
@@ -538,7 +538,7 @@ static void myri_rx(struct myri_eth *mp,
 static irqreturn_t myri_interrupt(int irq, void *dev_id)
 {
 	struct net_device *dev		=3D (struct net_device *) dev_id;
-	struct myri_eth *mp		=3D (struct myri_eth *) dev->priv;
+	struct myri_eth *mp		=3D netdev_priv(dev);
 	void __iomem *lregs		=3D mp->lregs;
 	struct myri_channel __iomem *chan =3D &mp->shmem->channel;
 	unsigned long flags;
@@ -577,14 +577,14 @@ static irqreturn_t myri_interrupt(int ir
=20
 static int myri_open(struct net_device *dev)
 {
-	struct myri_eth *mp =3D (struct myri_eth *) dev->priv;
+	struct myri_eth *mp =3D netdev_priv(dev);
=20
 	return myri_init(mp, in_interrupt());
 }
=20
 static int myri_close(struct net_device *dev)
 {
-	struct myri_eth *mp =3D (struct myri_eth *) dev->priv;
+	struct myri_eth *mp =3D netdev_priv(dev);
=20
 	myri_clean_rings(mp);
 	return 0;
@@ -592,7 +592,7 @@ static int myri_close(struct net_device=20
=20
 static void myri_tx_timeout(struct net_device *dev)
 {
-	struct myri_eth *mp =3D (struct myri_eth *) dev->priv;
+	struct myri_eth *mp =3D netdev_priv(dev);
=20
 	printk(KERN_ERR "%s: transmit timed out, resetting\n", dev->name);
=20
@@ -603,7 +603,7 @@ static void myri_tx_timeout(struct net_d
=20
 static int myri_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct myri_eth *mp =3D (struct myri_eth *) dev->priv;
+	struct myri_eth *mp =3D netdev_priv(dev);
 	struct sendq __iomem *sq =3D mp->sq;
 	struct myri_txd __iomem *txd;
 	unsigned long flags;
@@ -807,7 +807,7 @@ static int myri_change_mtu(struct net_de
 }
=20
 static struct net_device_stats *myri_get_stats(struct net_device *dev)
-{ return &(((struct myri_eth *)dev->priv)->enet_stats); }
+{ return &(((struct myri_eth *)netdev_priv(dev))->enet_stats); }
=20
 static void myri_set_multicast(struct net_device *dev)
 {
@@ -911,7 +911,7 @@ static int __devinit myri_ether_init(str
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &sdev->ofdev.dev);
=20
-	mp =3D (struct myri_eth *) dev->priv;
+	mp =3D netdev_priv(dev);
 	spin_lock_init(&mp->irq_lock);
 	mp->myri_sdev =3D sdev;
=20
diff --git a/drivers/net/ne2k-pci.c b/drivers/net/ne2k-pci.c
index f81d939..40039d4 100644
--- a/drivers/net/ne2k-pci.c
+++ b/drivers/net/ne2k-pci.c
@@ -626,7 +626,7 @@ #endif
 static void ne2k_pci_get_drvinfo(struct net_device *dev,
 				 struct ethtool_drvinfo *info)
 {
-	struct ei_device *ei =3D dev->priv;
+	struct ei_device *ei =3D netdev_priv(dev);
 	struct pci_dev *pci_dev =3D (struct pci_dev *) ei->priv;
=20
 	strcpy(info->driver, DRV_NAME);
diff --git a/drivers/net/ni5010.c b/drivers/net/ni5010.c
index 22a3b3d..a11e1a1 100644
--- a/drivers/net/ni5010.c
+++ b/drivers/net/ni5010.c
@@ -331,7 +331,7 @@ #endif	/* JUMPERED_INTERRUPTS */
         	outb(0, IE_RBUF);	/* set buffer byte 0 to 0 again */
 	}
         printk("-> bufsize rcv/xmt=3D%d/%d\n", bufsize_rcv, NI5010_BUFSIZE=
);
-	memset(dev->priv, 0, sizeof(struct ni5010_local));
+	memset(netdev_priv(dev), 0, sizeof(struct ni5010_local));
=20
 	dev->open		=3D ni5010_open;
 	dev->stop		=3D ni5010_close;
diff --git a/drivers/net/ni52.c b/drivers/net/ni52.c
index 5e7999d..242ea31 100644
--- a/drivers/net/ni52.c
+++ b/drivers/net/ni52.c
@@ -324,7 +324,7 @@ static int check586(struct net_device *d
  */
 static void alloc586(struct net_device *dev)
 {
-	struct priv *p =3D	(struct priv *) dev->priv;
+	struct priv *p =3D	netdev_priv(dev);
=20
 	ni_reset586();
 	DELAY(1);
@@ -495,17 +495,17 @@ #else
 	dev->mem_end =3D dev->mem_start + size; /* set mem_end showed by 'ifconfi=
g' */
 #endif
=20
-	memset((char *) dev->priv,0,sizeof(struct priv));
+	memset((char *) netdev_priv(dev),0,sizeof(struct priv));
=20
-	((struct priv *) (dev->priv))->memtop =3D isa_bus_to_virt(dev->mem_start)=
 + size;
-	((struct priv *) (dev->priv))->base =3D	(unsigned long) isa_bus_to_virt(d=
ev->mem_start) + size - 0x01000000;
+	((struct priv *) (netdev_priv(dev)))->memtop =3D isa_bus_to_virt(dev->mem=
_start) + size;
+	((struct priv *) (netdev_priv(dev)))->base =3D	(unsigned long) isa_bus_to=
_virt(dev->mem_start) + size - 0x01000000;
 	alloc586(dev);
=20
 	/* set number of receive-buffs according to memsize */
 	if(size =3D 0x2000)
-		((struct priv *) dev->priv)->num_recv_buffs =3D NUM_RECV_BUFFS_8;
+		((struct priv *)netdev_priv(dev))->num_recv_buffs =3D NUM_RECV_BUFFS_8;
 	else
-		((struct priv *) dev->priv)->num_recv_buffs =3D NUM_RECV_BUFFS_16;
+		((struct priv *)netdev_priv(dev))->num_recv_buffs =3D NUM_RECV_BUFFS_16;
=20
 	printk("Memaddr: 0x%lx, Memsize: %d, ",dev->mem_start,size);
=20
@@ -558,7 +558,7 @@ static int init586(struct net_device *de
 {
 	void *ptr;
 	int i,result=3D0;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	volatile struct configure_cmd_struct	*cfg_cmd;
 	volatile struct iasetup_cmd_struct *ias_cmd;
 	volatile struct tdr_cmd_struct *tdr_cmd;
@@ -794,7 +794,7 @@ static void *alloc_rfa(struct net_device
 	volatile struct rfd_struct *rfd =3D (struct rfd_struct *)ptr;
 	volatile struct rbd_struct *rbd;
 	int i;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	memset((char *) rfd,0,sizeof(struct rfd_struct)*(p->num_recv_buffs+rfdadd=
));
 	p->rfd_first =3D rfd;
@@ -846,7 +846,7 @@ static irqreturn_t ni52_interrupt(int ir
 		printk ("ni5210-interrupt: irq %d for unknown device.\n",irq);
 		return IRQ_NONE;
 	}
-	p =3D (struct priv *) dev->priv;
+	p =3D netdev_priv(dev);
=20
 	if(debuglevel > 1)
 		printk("I");
@@ -916,7 +916,7 @@ static void ni52_rcv_int(struct net_devi
 	unsigned short totlen;
 	struct sk_buff *skb;
 	struct rbd_struct *rbd;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	if(debuglevel > 0)
 		printk("R");
@@ -1036,7 +1036,7 @@ #endif
=20
 static void ni52_rnr_int(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	p->stats.rx_errors++;
=20
@@ -1060,7 +1060,7 @@ static void ni52_rnr_int(struct net_devi
 static void ni52_xmt_int(struct net_device *dev)
 {
 	int status;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	if(debuglevel > 0)
 		printk("X");
@@ -1110,7 +1110,7 @@ #endif
=20
 static void startrecv586(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	WAIT_4_SCB_CMD();
 	WAIT_4_SCB_CMD_RUC();
@@ -1122,7 +1122,7 @@ static void startrecv586(struct net_devi
=20
 static void ni52_timeout(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 #ifndef NO_NOPCOMMANDS
 	if(p->scb->cus & CU_ACTIVE) /* COMMAND-UNIT active? */
 	{
@@ -1164,7 +1164,7 @@ static int ni52_send_packet(struct sk_bu
 #ifndef NO_NOPCOMMANDS
 	int next_nop;
 #endif
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	if(skb->len > XMIT_BUFF_SIZE)
 	{
@@ -1273,7 +1273,7 @@ #endif
=20
 static struct net_device_stats *ni52_get_stats(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	unsigned short crc,aln,rsc,ovrn;
=20
 	crc =3D p->scb->crc_errs; /* get error-statistic from the ni82586 */
diff --git a/drivers/net/pci-skeleton.c b/drivers/net/pci-skeleton.c
index 3cdbe11..ef1902f 100644
--- a/drivers/net/pci-skeleton.c
+++ b/drivers/net/pci-skeleton.c
@@ -606,7 +606,7 @@ static int __devinit netdrv_init_board (
 	}
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
-	tp =3D dev->priv;
+	tp =3D netdev_priv(dev);
=20
 	/* enable device (incl. PCI PM wakeup), and bus-mastering */
 	rc =3D pci_enable_device (pdev);
@@ -761,7 +761,7 @@ #endif
 		return i;
 	}
=20
-	tp =3D dev->priv;
+	tp =3D netdev_priv(dev);
=20
 	assert (ioaddr !=3D NULL);
 	assert (dev !=3D NULL);
@@ -786,7 +786,7 @@ #endif
 	dev->base_addr =3D (unsigned long) ioaddr;
=20
 	/* dev->priv/tp zeroed and aligned in alloc_etherdev */
-	tp =3D dev->priv;
+	tp =3D netdev_priv(dev);
=20
 	/* note: tp->chipset set in netdrv_init_board */
 	tp->drv_flags =3D PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
@@ -848,7 +848,7 @@ static void __devexit netdrv_remove_one=20
=20
 	assert (dev !=3D NULL);
=20
-	np =3D dev->priv;
+	np =3D netdev_priv(dev);
 	assert (np !=3D NULL);
=20
 	unregister_netdev (dev);
@@ -981,7 +981,7 @@ static void mdio_sync (void *mdio_addr)
=20
 static int mdio_read (struct net_device *dev, int phy_id, int location)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *mdio_addr =3D tp->mmio_addr + Config4;
 	int mii_cmd =3D (0xf6 << 10) | (phy_id << 5) | location;
 	int retval =3D 0;
@@ -1024,7 +1024,7 @@ static int mdio_read (struct net_device=20
 static void mdio_write (struct net_device *dev, int phy_id, int location,
 			int value)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *mdio_addr =3D tp->mmio_addr + Config4;
 	int mii_cmd  	    (0x5002 << 16) | (phy_id << 23) | (location << 18) | va=
lue;
@@ -1067,7 +1067,7 @@ static void mdio_write (struct net_devic
=20
 static int netdrv_open (struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	int retval;
 #ifdef NETDRV_DEBUG
 	void *ioaddr =3D tp->mmio_addr;
@@ -1128,7 +1128,7 @@ #endif
 /* Start the hardware at open or resume. */
 static void netdrv_hw_start (struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
 	u32 i;
=20
@@ -1198,7 +1198,7 @@ static void netdrv_hw_start (struct net_
 /* Initialize the Rx and Tx rings, along with various 'dev' bits. */
 static void netdrv_init_ring (struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	int i;
=20
 	DPRINTK ("ENTER\n");
@@ -1220,7 +1220,7 @@ static void netdrv_init_ring (struct net
 static void netdrv_timer (unsigned long data)
 {
 	struct net_device *dev =3D (struct net_device *) data;
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
 	int next_tick =3D 60 * HZ;
 	int mii_lpa;
@@ -1285,7 +1285,7 @@ static void netdrv_tx_clear (struct netd
=20
 static void netdrv_tx_timeout (struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
 	int i;
 	u8 tmp8;
@@ -1332,7 +1332,7 @@ static void netdrv_tx_timeout (struct ne
=20
 static int netdrv_start_xmit (struct sk_buff *skb, struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
 	int entry;
=20
@@ -1655,7 +1655,7 @@ static void netdrv_weird_interrupt (stru
 static irqreturn_t netdrv_interrupt (int irq, void *dev_instance)
 {
 	struct net_device *dev =3D (struct net_device *) dev_instance;
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	int boguscnt =3D max_interrupt_work;
 	void *ioaddr =3D tp->mmio_addr;
 	int status =3D 0, link_changed =3D 0; /* avoid bogus "uninit" warning */
@@ -1718,7 +1718,7 @@ static irqreturn_t netdrv_interrupt (int
=20
 static int netdrv_close (struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
 	unsigned long flags;
=20
@@ -1769,7 +1769,7 @@ static int netdrv_close (struct net_devi
=20
 static int netdrv_ioctl (struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	struct mii_ioctl_data *data =3D if_mii(rq);
 	unsigned long flags;
 	int rc =3D 0;
@@ -1810,7 +1810,7 @@ static int netdrv_ioctl (struct net_devi
=20
 static struct net_device_stats *netdrv_get_stats (struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
=20
 	DPRINTK ("ENTER\n");
@@ -1837,7 +1837,7 @@ static struct net_device_stats *netdrv_g
=20
 static void netdrv_set_rx_mode (struct net_device *dev)
 {
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
 	u32 mc_filter[2];	/* Multicast hash filter */
 	int i, rx_mode;
@@ -1894,7 +1894,7 @@ #ifdef CONFIG_PM
 static int netdrv_suspend (struct pci_dev *pdev, pm_message_t state)
 {
 	struct net_device *dev =3D pci_get_drvdata (pdev);
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
 	void *ioaddr =3D tp->mmio_addr;
 	unsigned long flags;
=20
@@ -1924,7 +1924,7 @@ static int netdrv_suspend (struct pci_de
 static int netdrv_resume (struct pci_dev *pdev)
 {
 	struct net_device *dev =3D pci_get_drvdata (pdev);
-	struct netdrv_private *tp =3D dev->priv;
+	struct netdrv_private *tp =3D netdev_priv(dev);
=20
 	if (!netif_running(dev))
 		return 0;
diff --git a/drivers/net/plip.c b/drivers/net/plip.c
index 8754cf3..6a8968c 100644
--- a/drivers/net/plip.c
+++ b/drivers/net/plip.c
@@ -236,7 +236,7 @@ static inline void enable_parport_interr
 	if (dev->irq !=3D -1)
 	{
 		struct parport *port -		   ((struct net_local *)dev->priv)->pardev->port;
+		   ((struct net_local *)netdev_priv(dev))->pardev->port;
 		port->ops->enable_irq (port);
 	}
 }
@@ -246,7 +246,7 @@ static inline void disable_parport_inter
 	if (dev->irq !=3D -1)
 	{
 		struct parport *port -		   ((struct net_local *)dev->priv)->pardev->port;
+		   ((struct net_local *)netdev_priv(dev))->pardev->port;
 		port->ops->disable_irq (port);
 	}
 }
@@ -254,7 +254,7 @@ static inline void disable_parport_inter
 static inline void write_data (struct net_device *dev, unsigned char data)
 {
 	struct parport *port -	   ((struct net_local *)dev->priv)->pardev->port;
+	   ((struct net_local *)netdev_priv(dev))->pardev->port;
=20
 	port->ops->write_data (port, data);
 }
@@ -262,7 +262,7 @@ static inline void write_data (struct ne
 static inline unsigned char read_status (struct net_device *dev)
 {
 	struct parport *port -	   ((struct net_local *)dev->priv)->pardev->port;
+	   ((struct net_local *)netdev_priv(dev))->pardev->port;
=20
 	return port->ops->read_status (port);
 }
diff --git a/drivers/net/qla3xxx.c b/drivers/net/qla3xxx.c
index 69da95b..b152f23 100755
--- a/drivers/net/qla3xxx.c
+++ b/drivers/net/qla3xxx.c
@@ -3753,7 +3753,7 @@ static int ql3xxx_open(struct net_device
=20
 static struct net_device_stats *ql3xxx_get_stats(struct net_device *dev)
 {
-	struct ql3_adapter *qdev =3D (struct ql3_adapter *)dev->priv;
+	struct ql3_adapter *qdev =3D netdev_priv(dev);
 	return &qdev->stats;
 }
=20
diff --git a/drivers/net/rionet.c b/drivers/net/rionet.c
index df6b738..1a4a37c 100644
--- a/drivers/net/rionet.c
+++ b/drivers/net/rionet.c
@@ -93,7 +93,7 @@ #define RIONET_GET_DESTID(x)	(*(u16 *)(x
=20
 static struct net_device_stats *rionet_stats(struct net_device *ndev)
 {
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
 	return &rnet->stats;
 }
=20
@@ -101,7 +101,7 @@ static int rionet_rx_clean(struct net_de
 {
 	int i;
 	int error =3D 0;
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
 	void *data;
=20
 	i =3D rnet->rx_slot;
@@ -139,7 +139,7 @@ static int rionet_rx_clean(struct net_de
 static void rionet_rx_fill(struct net_device *ndev, int end)
 {
 	int i;
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	i =3D rnet->rx_slot;
 	do {
@@ -158,7 +158,7 @@ static void rionet_rx_fill(struct net_de
 static int rionet_queue_tx_msg(struct sk_buff *skb, struct net_device *nde=
v,
 			       struct rio_dev *rdev)
 {
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	rio_add_outb_message(rnet->mport, rdev, 0, skb->data, skb->len);
 	rnet->tx_skb[rnet->tx_slot] =3D skb;
@@ -182,7 +182,7 @@ static int rionet_queue_tx_msg(struct sk
 static int rionet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	int i;
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
 	struct ethhdr *eth =3D (struct ethhdr *)skb->data;
 	u16 destid;
 	unsigned long flags;
@@ -221,7 +221,7 @@ static void rionet_dbell_event(struct ri
 			       u16 info)
 {
 	struct net_device *ndev =3D dev_id;
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
 	struct rionet_peer *peer;
=20
 	if (netif_msg_intr(rnet))
@@ -249,7 +249,7 @@ static void rionet_inb_msg_event(struct=20
 {
 	int n;
 	struct net_device *ndev =3D dev_id;
-	struct rionet_private *rnet =3D (struct rionet_private *)ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	if (netif_msg_intr(rnet))
 		printk(KERN_INFO "%s: inbound message event, mbox %d slot %d\n",
@@ -264,7 +264,7 @@ static void rionet_inb_msg_event(struct=20
 static void rionet_outb_msg_event(struct rio_mport *mport, void *dev_id, i=
nt mbox, int slot)
 {
 	struct net_device *ndev =3D dev_id;
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	spin_lock(&rnet->lock);
=20
@@ -293,7 +293,7 @@ static int rionet_open(struct net_device
 	int i, rc =3D 0;
 	struct rionet_peer *peer, *tmp;
 	u32 pwdcsr;
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	if (netif_msg_ifup(rnet))
 		printk(KERN_INFO "%s: open\n", DRV_NAME);
@@ -357,7 +357,7 @@ static int rionet_open(struct net_device
=20
 static int rionet_close(struct net_device *ndev)
 {
-	struct rionet_private *rnet =3D (struct rionet_private *)ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
 	struct rionet_peer *peer, *tmp;
 	int i;
=20
@@ -404,7 +404,7 @@ static void rionet_remove(struct rio_dev
 static void rionet_get_drvinfo(struct net_device *ndev,
 			       struct ethtool_drvinfo *info)
 {
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	strcpy(info->driver, DRV_NAME);
 	strcpy(info->version, DRV_VERSION);
@@ -414,14 +414,14 @@ static void rionet_get_drvinfo(struct ne
=20
 static u32 rionet_get_msglevel(struct net_device *ndev)
 {
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	return rnet->msg_enable;
 }
=20
 static void rionet_set_msglevel(struct net_device *ndev, u32 value)
 {
-	struct rionet_private *rnet =3D ndev->priv;
+	struct rionet_private *rnet =3D netdev_priv(ndev);
=20
 	rnet->msg_enable =3D value;
 }
@@ -450,7 +450,7 @@ static int rionet_setup_netdev(struct ri
 	}
=20
 	/* Set up private area */
-	rnet =3D (struct rionet_private *)ndev->priv;
+	rnet =3D netdev_priv(ndev);
 	rnet->mport =3D mport;
=20
 	/* Set the default MAC address */
diff --git a/drivers/net/s2io.c b/drivers/net/s2io.c
index 2be0a0f..7743bd2 100644
--- a/drivers/net/s2io.c
+++ b/drivers/net/s2io.c
@@ -330,7 +330,7 @@ #define S2IO_TIMER_CONF(timer, handle, a
 static void s2io_vlan_rx_register(struct net_device *dev,
 					struct vlan_group *grp)
 {
-	struct s2io_nic *nic =3D dev->priv;
+	struct s2io_nic *nic =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	spin_lock_irqsave(&nic->tx_lock, flags);
@@ -2581,7 +2581,7 @@ static void free_rx_buffers(struct s2io_
=20
 static int s2io_poll(struct net_device *dev, int *budget)
 {
-	struct s2io_nic *nic =3D dev->priv;
+	struct s2io_nic *nic =3D netdev_priv(dev);
 	int pkt_cnt =3D 0, org_pkts_to_process;
 	struct mac_info *mac_control;
 	struct config_param *config;
@@ -2655,7 +2655,7 @@ #ifdef CONFIG_NET_POLL_CONTROLLER
  */
 static void s2io_netpoll(struct net_device *dev)
 {
-	struct s2io_nic *nic =3D dev->priv;
+	struct s2io_nic *nic =3D netdev_priv(dev);
 	struct mac_info *mac_control;
 	struct config_param *config;
 	struct XENA_dev_config __iomem *bar0 =3D nic->bar0;
@@ -2926,7 +2926,7 @@ static void tx_intr_handler(struct fifo_
 static void s2io_mdio_write(u32 mmd_type, u64 addr, u16 value, struct net_=
device *dev)
 {
 	u64 val64 =3D 0x0;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
=20
 	//address transaction
@@ -2975,7 +2975,7 @@ static u64 s2io_mdio_read(u32 mmd_type,=20
 {
 	u64 val64 =3D 0x0;
 	u64 rval64 =3D 0x0;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
=20
 	/* address transaction */
@@ -3079,7 +3079,7 @@ static void s2io_updt_xpak_counter(struc
 	u64 val64 =3D 0x0;
 	u64 addr  =3D 0x0;
=20
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct stat_block *stat_info =3D sp->mac_control.stats_info;
=20
 	/* Check the communication with the MDIO slave */
@@ -3799,7 +3799,7 @@ static int s2io_enable_msi_x(struct s2io
=20
 static int s2io_open(struct net_device *dev)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	int err =3D 0;
=20
 	/*
@@ -3858,7 +3858,7 @@ hw_init_failed:
=20
 static int s2io_close(struct net_device *dev)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	netif_stop_queue(dev);
 	/* Reset card, kill tasklet and free Tx and Rx buffers. */
@@ -3882,7 +3882,7 @@ static int s2io_close(struct net_device=20
=20
 static int s2io_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	u16 frg_cnt, frg_len, i, queue, queue_len, put_off, get_off;
 	register u64 val64;
 	struct TxD *txdp;
@@ -4194,7 +4194,7 @@ static void s2io_txpic_intr_handle(struc
 static irqreturn_t s2io_isr(int irq, void *dev_id)
 {
 	struct net_device *dev =3D (struct net_device *) dev_id;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
 	int i;
 	u64 reason =3D 0;
@@ -4323,7 +4323,7 @@ static void s2io_updt_stats(struct s2io_
=20
 static struct net_device_stats *s2io_get_stats(struct net_device *dev)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct mac_info *mac_control;
 	struct config_param *config;
=20
@@ -4365,7 +4365,7 @@ static void s2io_set_multicast(struct ne
 {
 	int i, j, prev_cnt;
 	struct dev_mc_list *mclist;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
 	u64 val64 =3D 0, multi_mac =3D 0x010203040506ULL, mask  	    0xfeffffffff=
ffULL;
@@ -4537,7 +4537,7 @@ static void s2io_set_multicast(struct ne
=20
 static int s2io_set_mac_addr(struct net_device *dev, u8 * addr)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
 	register u64 val64, mac_addr =3D 0;
 	int i;
@@ -4601,7 +4601,7 @@ static int s2io_set_mac_addr(struct net_
 static int s2io_ethtool_sset(struct net_device *dev,
 			     struct ethtool_cmd *info)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	if ((info->autoneg =3D AUTONEG_ENABLE) ||
 	    (info->speed !=3D SPEED_10000) || (info->duplex !=3D DUPLEX_FULL))
 		return -EINVAL;
@@ -4627,7 +4627,7 @@ static int s2io_ethtool_sset(struct net_
=20
 static int s2io_ethtool_gset(struct net_device *dev, struct ethtool_cmd *i=
nfo)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	info->supported =3D (SUPPORTED_10000baseT_Full | SUPPORTED_FIBRE);
 	info->advertising =3D (SUPPORTED_10000baseT_Full | SUPPORTED_FIBRE);
 	info->port =3D PORT_FIBRE;
@@ -4660,7 +4660,7 @@ static int s2io_ethtool_gset(struct net_
 static void s2io_ethtool_gdrvinfo(struct net_device *dev,
 				  struct ethtool_drvinfo *info)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	strncpy(info->driver, s2io_driver_name, sizeof(info->driver));
 	strncpy(info->version, s2io_driver_version, sizeof(info->version));
@@ -4696,7 +4696,7 @@ static void s2io_ethtool_gregs(struct ne
 	int i;
 	u64 reg;
 	u8 *reg_space =3D (u8 *) space;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	regs->len =3D XENA_REG_SPACE;
 	regs->version =3D sp->pdev->subsystem_device;
@@ -4756,7 +4756,7 @@ static void s2io_phy_id(unsigned long da
 static int s2io_ethtool_idnic(struct net_device *dev, u32 data)
 {
 	u64 val64 =3D 0, last_gpio_ctrl_val;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
 	u16 subid;
=20
@@ -4794,7 +4794,7 @@ static int s2io_ethtool_idnic(struct net
 static void s2io_ethtool_gringparam(struct net_device *dev,
                                     struct ethtool_ringparam *ering)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	int i,tx_desc_count=3D0,rx_desc_count=3D0;
=20
 	if (sp->rxd_mode =3D RXD_MODE_1)
@@ -4837,7 +4837,7 @@ static void s2io_ethtool_getpause_data(s
 				       struct ethtool_pauseparam *ep)
 {
 	u64 val64;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
=20
 	val64 =3D readq(&bar0->rmac_pause_cfg);
@@ -4864,7 +4864,7 @@ static int s2io_ethtool_setpause_data(st
 			       struct ethtool_pauseparam *ep)
 {
 	u64 val64;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct XENA_dev_config __iomem *bar0 =3D sp->bar0;
=20
 	val64 =3D readq(&bar0->rmac_pause_cfg);
@@ -5094,7 +5094,7 @@ static int s2io_ethtool_geeprom(struct n
 {
 	u32 i, valid;
 	u64 data;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	eeprom->magic =3D sp->pdev->vendor | (sp->pdev->device << 16);
=20
@@ -5132,7 +5132,7 @@ static int s2io_ethtool_seeprom(struct n
 {
 	int len =3D eeprom->len, cnt =3D 0;
 	u64 valid =3D 0, data;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	if (eeprom->magic !=3D (sp->pdev->vendor | (sp->pdev->device << 16))) {
 		DBG_PRINT(ERR_DBG,
@@ -5512,7 +5512,7 @@ static void s2io_ethtool_test(struct net
 			      struct ethtool_test *ethtest,
 			      uint64_t * data)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	int orig_state =3D netif_running(sp->dev);
=20
 	if (ethtest->flags =3D ETH_TEST_FL_OFFLINE) {
@@ -5568,7 +5568,7 @@ static void s2io_get_ethtool_stats(struc
 				   u64 * tmp_stats)
 {
 	int i =3D 0;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	struct stat_block *stat_info =3D sp->mac_control.stats_info;
=20
 	s2io_updt_stats(sp);
@@ -5829,14 +5829,14 @@ static int s2io_ethtool_get_regs_len(str
=20
 static u32 s2io_ethtool_get_rx_csum(struct net_device * dev)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	return (sp->rx_csum);
 }
=20
 static int s2io_ethtool_set_rx_csum(struct net_device *dev, u32 data)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	if (data)
 		sp->rx_csum =3D 1;
@@ -5860,7 +5860,7 @@ static void s2io_ethtool_get_strings(str
 				     u32 stringset, u8 * data)
 {
 	int stat_size =3D 0;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	switch (stringset) {
 	case ETH_SS_TEST:
@@ -5882,7 +5882,7 @@ static void s2io_ethtool_get_strings(str
 }
 static int s2io_ethtool_get_stats_count(struct net_device *dev)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	int stat_count =3D 0;
 	switch(sp->device_type) {
 	case XFRAME_I_DEVICE:
@@ -5982,7 +5982,7 @@ static int s2io_ioctl(struct net_device=20
=20
 static int s2io_change_mtu(struct net_device *dev, int new_mtu)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	if ((new_mtu < MIN_MTU) || (new_mtu > S2IO_JUMBO_SIZE)) {
 		DBG_PRINT(ERR_DBG, "%s: MTU size is invalid.\n",
@@ -6026,7 +6026,7 @@ static int s2io_change_mtu(struct net_de
 static void s2io_tasklet(unsigned long dev_addr)
 {
 	struct net_device *dev =3D (struct net_device *) dev_addr;
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
 	int i, ret;
 	struct mac_info *mac_control;
 	struct config_param *config;
@@ -6621,7 +6621,7 @@ out_unlock:
=20
 static void s2io_tx_watchdog(struct net_device *dev)
 {
-	struct s2io_nic *sp =3D dev->priv;
+	struct s2io_nic *sp =3D netdev_priv(dev);
=20
 	if (netif_carrier_ok(dev)) {
 		sp->mac_control.stats_info->sw_stat.watchdog_timer_cnt++;
@@ -7077,7 +7077,7 @@ s2io_init_nic(struct pci_dev *pdev, cons
 	SET_NETDEV_DEV(dev, &pdev->dev);
=20
 	/*  Private member variable initialized to s2io NIC structure */
-	sp =3D dev->priv;
+	sp =3D netdev_priv(dev);
 	memset(sp, 0, sizeof(struct s2io_nic));
 	sp->dev =3D dev;
 	sp->pdev =3D pdev;
@@ -7438,7 +7438,7 @@ static void __devexit s2io_rem_nic(struc
=20
 	flush_scheduled_work();
=20
-	sp =3D dev->priv;
+	sp =3D netdev_priv(dev);
 	unregister_netdev(dev);
=20
 	free_shared_mem(sp);
@@ -7806,7 +7806,7 @@ static pci_ers_result_t s2io_io_error_de
                                                pci_channel_state_t state)
 {
 	struct net_device *netdev =3D pci_get_drvdata(pdev);
-	struct s2io_nic *sp =3D netdev->priv;
+	struct s2io_nic *sp =3D netdev_priv(netdev);
=20
 	netif_device_detach(netdev);
=20
@@ -7831,7 +7831,7 @@ static pci_ers_result_t s2io_io_error_de
 static pci_ers_result_t s2io_io_slot_reset(struct pci_dev *pdev)
 {
 	struct net_device *netdev =3D pci_get_drvdata(pdev);
-	struct s2io_nic *sp =3D netdev->priv;
+	struct s2io_nic *sp =3D netdev_priv(netdev);
=20
 	if (pci_enable_device(pdev)) {
 		printk(KERN_ERR "s2io: "
@@ -7855,7 +7855,7 @@ static pci_ers_result_t s2io_io_slot_res
 static void s2io_io_resume(struct pci_dev *pdev)
 {
 	struct net_device *netdev =3D pci_get_drvdata(pdev);
-	struct s2io_nic *sp =3D netdev->priv;
+	struct s2io_nic *sp =3D netdev_priv(netdev);
=20
 	if (netif_running(netdev)) {
 		if (s2io_card_up(sp)) {
diff --git a/drivers/net/sgiseeq.c b/drivers/net/sgiseeq.c
index 384b468..d69b2d7 100644
--- a/drivers/net/sgiseeq.c
+++ b/drivers/net/sgiseeq.c
@@ -577,7 +577,7 @@ static struct net_device_stats *sgiseeq_
=20
 static void sgiseeq_set_multicast(struct net_device *dev)
 {
-	struct sgiseeq_private *sp =3D (struct sgiseeq_private *) dev->priv;
+	struct sgiseeq_private *sp =3D netdev_priv(dev);
 	unsigned char oldmode =3D sp->mode;
=20
 	if(dev->flags & IFF_PROMISC)
diff --git a/drivers/net/shaper.c b/drivers/net/shaper.c
index 4c3d98f..14bdba0 100644
--- a/drivers/net/shaper.c
+++ b/drivers/net/shaper.c
@@ -133,7 +133,7 @@ static void shaper_setspeed(struct shape
=20
 static int shaper_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct shaper *shaper =3D dev->priv;
+	struct shaper *shaper =3D netdev_priv(dev);
  	struct sk_buff *ptr;
=20
 	spin_lock(&shaper->lock);
@@ -288,7 +288,7 @@ static void shaper_kick(struct shaper *s
=20
 static int shaper_open(struct net_device *dev)
 {
-	struct shaper *shaper=DEv->priv;
+	struct shaper *shaper=3Dnetdev_priv(dev);
=20
 	/*
 	 *	Can't open until attached.
@@ -309,7 +309,7 @@ static int shaper_open(struct net_device
=20
 static int shaper_close(struct net_device *dev)
 {
-	struct shaper *shaper=DEv->priv;
+	struct shaper *shaper=3Dnetdev_priv(dev);
 	struct sk_buff *skb;
=20
 	while ((skb =3D skb_dequeue(&shaper->sendq)) !=3D NULL)
@@ -331,14 +331,14 @@ static int shaper_close(struct net_devic
=20
 static struct net_device_stats *shaper_get_stats(struct net_device *dev)
 {
-     	struct shaper *sh=DEv->priv;
+     	struct shaper *sh=3Dnetdev_priv(dev);
 	return &sh->stats;
 }
=20
 static int shaper_header(struct sk_buff *skb, struct net_device *dev,
 	unsigned short type, void *daddr, void *saddr, unsigned len)
 {
-	struct shaper *sh=DEv->priv;
+	struct shaper *sh=3Dnetdev_priv(dev);
 	int v;
 	if(sh_debug)
 		printk("Shaper header\n");
@@ -476,7 +476,7 @@ #endif
 static int shaper_ioctl(struct net_device *dev,  struct ifreq *ifr, int cm=
d)
 {
 	struct shaperconf *ss=3D (struct shaperconf *)&ifr->ifr_ifru;
-	struct shaper *sh=DEv->priv;
+	struct shaper *sh=3Dnetdev_priv(dev);
=20
 	if(ss->ss_cmd =3D SHAPER_SET_DEV || ss->ss_cmd =3D SHAPER_SET_SPEED)
 	{
@@ -493,7 +493,7 @@ static int shaper_ioctl(struct net_devic
 				return -ENODEV;
 			if(sh->dev)
 				return -EBUSY;
-			return shaper_attach(dev,dev->priv, them);
+			return shaper_attach(dev,netdev_priv(dev), them);
 		}
 		case SHAPER_GET_DEV:
 			if(sh->dev=3DNULL)
@@ -513,7 +513,7 @@ static int shaper_ioctl(struct net_devic
=20
 static void shaper_init_priv(struct net_device *dev)
 {
-	struct shaper *sh =3D dev->priv;
+	struct shaper *sh =3D netdev_priv(dev);
=20
 	skb_queue_head_init(&sh->sendq);
 	init_timer(&sh->timer);
diff --git a/drivers/net/sis900.c b/drivers/net/sis900.c
index 7c6e480..36162d5 100644
--- a/drivers/net/sis900.c
+++ b/drivers/net/sis900.c
@@ -439,7 +439,7 @@ #endif
 	if (ret)
 		goto err_out;
=20
-	sis_priv =3D net_dev->priv;
+	sis_priv =3D netdev_priv(net_dev);
 	net_dev->base_addr =3D ioaddr;
 	net_dev->irq =3D pci_dev->irq;
 	sis_priv->pci_dev =3D pci_dev;
@@ -575,7 +575,7 @@ #endif
=20
 static int __devinit sis900_mii_probe(struct net_device * net_dev)
 {
-	struct sis900_private * sis_priv =3D net_dev->priv;
+	struct sis900_private * sis_priv =3D netdev_priv(net_dev);
 	const char *dev_name =3D pci_name(sis_priv->pci_dev);
 	u16 poll_bit =3D MII_STAT_LINK, status =3D 0;
 	unsigned long timeout =3D jiffies + 5 * HZ;
@@ -703,7 +703,7 @@ static int __devinit sis900_mii_probe(st
=20
 static u16 sis900_default_phy(struct net_device * net_dev)
 {
-	struct sis900_private * sis_priv =3D net_dev->priv;
+	struct sis900_private * sis_priv =3D netdev_priv(net_dev);
  	struct mii_phy *phy =3D NULL, *phy_home =3D NULL,
 		*default_phy =3D NULL, *phy_lan =3D NULL;
 	u16 status;
@@ -1004,7 +1004,7 @@ #endif
 static int
 sis900_open(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	int ret;
=20
@@ -1060,7 +1060,7 @@ sis900_open(struct net_device *net_dev)
 static void
 sis900_init_rxfilter (struct net_device * net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	u32 rfcrSave;
 	u32 i;
@@ -1098,7 +1098,7 @@ sis900_init_rxfilter (struct net_device=20
 static void
 sis900_init_tx_ring(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	int i;
=20
@@ -1132,7 +1132,7 @@ sis900_init_tx_ring(struct net_device *n
 static void
 sis900_init_rx_ring(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	int i;
=20
@@ -1203,7 +1203,7 @@ sis900_init_rx_ring(struct net_device *n
=20
 static void sis630_set_eq(struct net_device *net_dev, u8 revision)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	u16 reg14h, eq_value=3D0, max_value=3D0, min_value=3D0;
 	int i, maxcount=10;
=20
@@ -1276,7 +1276,7 @@ static void sis630_set_eq(struct net_dev
 static void sis900_timer(unsigned long data)
 {
 	struct net_device *net_dev =3D (struct net_device *)data;
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	struct mii_phy *mii_phy =3D sis_priv->mii;
 	static const int next_tick =3D 5*HZ;
 	u16 status;
@@ -1346,7 +1346,7 @@ static void sis900_timer(unsigned long d
=20
 static void sis900_check_mode(struct net_device *net_dev, struct mii_phy *=
mii_phy)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	int speed, duplex;
=20
@@ -1425,7 +1425,7 @@ #endif
=20
 static void sis900_auto_negotiate(struct net_device *net_dev, int phy_addr)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	int i =3D 0;
 	u32 status;
=20
@@ -1460,7 +1460,7 @@ static void sis900_auto_negotiate(struct
=20
 static void sis900_read_mode(struct net_device *net_dev, int *speed, int *=
duplex)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	struct mii_phy *phy =3D sis_priv->mii;
 	int phy_addr =3D sis_priv->cur_phy;
 	u32 status;
@@ -1515,7 +1515,7 @@ static void sis900_read_mode(struct net_
=20
 static void sis900_tx_timeout(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	unsigned long flags;
 	int i;
@@ -1574,7 +1574,7 @@ static void sis900_tx_timeout(struct net
 static int
 sis900_start_xmit(struct sk_buff *skb, struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	unsigned int  entry;
 	unsigned long flags;
@@ -1644,7 +1644,7 @@ sis900_start_xmit(struct sk_buff *skb, s
 static irqreturn_t sis900_interrupt(int irq, void *dev_instance)
 {
 	struct net_device *net_dev =3D dev_instance;
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	int boguscnt =3D max_interrupt_work;
 	long ioaddr =3D net_dev->base_addr;
 	u32 status;
@@ -1706,7 +1706,7 @@ static irqreturn_t sis900_interrupt(int=20
=20
 static int sis900_rx(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	unsigned int entry =3D sis_priv->cur_rx % NUM_RX_DESC;
 	u32 rx_status =3D sis_priv->rx_ring[entry].cmdsts;
@@ -1856,7 +1856,7 @@ refill_rx_ring:
=20
 static void sis900_finish_xmit (struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
=20
 	for (; sis_priv->dirty_tx !=3D sis_priv->cur_tx; sis_priv->dirty_tx++) {
 		struct sk_buff *skb;
@@ -1925,7 +1925,7 @@ static void sis900_finish_xmit (struct n
 static int sis900_close(struct net_device *net_dev)
 {
 	long ioaddr =3D net_dev->base_addr;
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	struct sk_buff *skb;
 	int i;
=20
@@ -1980,7 +1980,7 @@ static int sis900_close(struct net_devic
 static void sis900_get_drvinfo(struct net_device *net_dev,
 			       struct ethtool_drvinfo *info)
 {
- 	struct sis900_private *sis_priv =3D net_dev->priv;
+ 	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
=20
 	strcpy (info->driver, SIS900_MODULE_NAME);
 	strcpy (info->version, SIS900_DRV_VERSION);
@@ -1989,26 +1989,26 @@ static void sis900_get_drvinfo(struct ne
=20
 static u32 sis900_get_msglevel(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	return sis_priv->msg_enable;
 }
=20
 static void sis900_set_msglevel(struct net_device *net_dev, u32 value)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	sis_priv->msg_enable =3D value;
 }
=20
 static u32 sis900_get_link(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	return mii_link_ok(&sis_priv->mii_info);
 }
=20
 static int sis900_get_settings(struct net_device *net_dev,
 				struct ethtool_cmd *cmd)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	spin_lock_irq(&sis_priv->lock);
 	mii_ethtool_gset(&sis_priv->mii_info, cmd);
 	spin_unlock_irq(&sis_priv->lock);
@@ -2018,7 +2018,7 @@ static int sis900_get_settings(struct ne
 static int sis900_set_settings(struct net_device *net_dev,
 				struct ethtool_cmd *cmd)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	int rt;
 	spin_lock_irq(&sis_priv->lock);
 	rt =3D mii_ethtool_sset(&sis_priv->mii_info, cmd);
@@ -2028,7 +2028,7 @@ static int sis900_set_settings(struct ne
=20
 static int sis900_nway_reset(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	return mii_nway_restart(&sis_priv->mii_info);
 }
=20
@@ -2045,7 +2045,7 @@ static int sis900_nway_reset(struct net_
=20
 static int sis900_set_wol(struct net_device *net_dev, struct ethtool_wolin=
fo *wol)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long pmctrl_addr =3D net_dev->base_addr + pmctrl;
 	u32 cfgpmcsr =3D 0, pmctrl_bits =3D 0;
=20
@@ -2116,7 +2116,7 @@ static const struct ethtool_ops sis900_e
=20
 static int mii_ioctl(struct net_device *net_dev, struct ifreq *rq, int cmd)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	struct mii_ioctl_data *data =3D if_mii(rq);
=20
 	switch(cmd) {
@@ -2148,7 +2148,7 @@ static int mii_ioctl(struct net_device *
 static struct net_device_stats *
 sis900_get_stats(struct net_device *net_dev)
 {
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
=20
 	return &sis_priv->stats;
 }
@@ -2165,7 +2165,7 @@ sis900_get_stats(struct net_device *net_
=20
 static int sis900_set_config(struct net_device *dev, struct ifmap *map)
 {
-	struct sis900_private *sis_priv =3D dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(dev);
 	struct mii_phy *mii_phy =3D sis_priv->mii;
=20
 	u16 status;
@@ -2288,7 +2288,7 @@ static inline u16 sis900_mcast_bitnr(u8=20
 static void set_rx_mode(struct net_device *net_dev)
 {
 	long ioaddr =3D net_dev->base_addr;
-	struct sis900_private * sis_priv =3D net_dev->priv;
+	struct sis900_private * sis_priv =3D netdev_priv(net_dev);
 	u16 mc_filter[16] =3D {0};	/* 256/128 bits multicast hash table */
 	int i, table_entries;
 	u32 rx_mode;
@@ -2363,7 +2363,7 @@ static void set_rx_mode(struct net_devic
=20
 static void sis900_reset(struct net_device *net_dev)
 {
-	struct sis900_private * sis_priv =3D net_dev->priv;
+	struct sis900_private * sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
 	int i =3D 0;
 	u32 status =3D TxRCMP | RxRCMP;
@@ -2396,7 +2396,7 @@ static void sis900_reset(struct net_devi
 static void __devexit sis900_remove(struct pci_dev *pci_dev)
 {
 	struct net_device *net_dev =3D pci_get_drvdata(pci_dev);
-	struct sis900_private * sis_priv =3D net_dev->priv;
+	struct sis900_private * sis_priv =3D netdev_priv(net_dev);
 	struct mii_phy *phy =3D NULL;
=20
 	while (sis_priv->first_mii) {
@@ -2440,7 +2440,7 @@ static int sis900_suspend(struct pci_dev
 static int sis900_resume(struct pci_dev *pci_dev)
 {
 	struct net_device *net_dev =3D pci_get_drvdata(pci_dev);
-	struct sis900_private *sis_priv =3D net_dev->priv;
+	struct sis900_private *sis_priv =3D netdev_priv(net_dev);
 	long ioaddr =3D net_dev->base_addr;
=20
 	if(!netif_running(net_dev))
diff --git a/drivers/net/smc9194.c b/drivers/net/smc9194.c
index 36c1eba..af14f24 100644
--- a/drivers/net/smc9194.c
+++ b/drivers/net/smc9194.c
@@ -1052,7 +1052,7 @@ #endif
 	printk("%2.2x \n", dev->dev_addr[5] );
=20
 	/* set the private data to zero by default */
-	memset(dev->priv, 0, sizeof(struct smc_local));
+	memset(netdev_priv(dev), 0, sizeof(struct smc_local));
=20
 	/* Grab the IRQ */
       	retval =3D request_irq(dev->irq, &smc_interrupt, 0, DRV_NAME, dev);
@@ -1127,7 +1127,7 @@ static int smc_open(struct net_device *d
 	int	i;	/* used to set hw ethernet address */
=20
 	/* clear out all the junk that was put here before... */
-	memset(dev->priv, 0, sizeof(struct smc_local));
+	memset(netdev_priv(dev), 0, sizeof(struct smc_local));
=20
 	/* reset the hardware */
=20
@@ -1183,7 +1183,7 @@ static void smc_timeout(struct net_devic
 	smc_enable( dev->base_addr );
 	dev->trans_start =3D jiffies;
 	/* clear anything saved */
-	((struct smc_local *)dev->priv)->saved_skb =3D NULL;
+	((struct smc_local *)netdev_priv(dev))->saved_skb =3D NULL;
 	netif_wake_queue(dev);
 }
=20
diff --git a/drivers/net/sonic.h b/drivers/net/sonic.h
index 7db13e4..bbc0ddc 100644
--- a/drivers/net/sonic.h
+++ b/drivers/net/sonic.h
@@ -371,7 +371,7 @@ #endif
 static inline void sonic_cda_put(struct net_device* dev, int entry,
 				 int offset, __u16 val)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	sonic_buf_put(lp->cda, lp->dma_bitmode,
 		      (entry * SIZEOF_SONIC_CD) + offset, val);
 }
@@ -379,27 +379,27 @@ static inline void sonic_cda_put(struct=20
 static inline __u16 sonic_cda_get(struct net_device* dev, int entry,
 				  int offset)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	return sonic_buf_get(lp->cda, lp->dma_bitmode,
 			     (entry * SIZEOF_SONIC_CD) + offset);
 }
=20
 static inline void sonic_set_cam_enable(struct net_device* dev, __u16 val)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	sonic_buf_put(lp->cda, lp->dma_bitmode, SONIC_CDA_CAM_ENABLE, val);
 }
=20
 static inline __u16 sonic_get_cam_enable(struct net_device* dev)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	return sonic_buf_get(lp->cda, lp->dma_bitmode, SONIC_CDA_CAM_ENABLE);
 }
=20
 static inline void sonic_tda_put(struct net_device* dev, int entry,
 				 int offset, __u16 val)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	sonic_buf_put(lp->tda, lp->dma_bitmode,
 		      (entry * SIZEOF_SONIC_TD) + offset, val);
 }
@@ -407,7 +407,7 @@ static inline void sonic_tda_put(struct=20
 static inline __u16 sonic_tda_get(struct net_device* dev, int entry,
 				  int offset)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	return sonic_buf_get(lp->tda, lp->dma_bitmode,
 			     (entry * SIZEOF_SONIC_TD) + offset);
 }
@@ -415,7 +415,7 @@ static inline __u16 sonic_tda_get(struct
 static inline void sonic_rda_put(struct net_device* dev, int entry,
 				 int offset, __u16 val)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	sonic_buf_put(lp->rda, lp->dma_bitmode,
 		      (entry * SIZEOF_SONIC_RD) + offset, val);
 }
@@ -423,7 +423,7 @@ static inline void sonic_rda_put(struct=20
 static inline __u16 sonic_rda_get(struct net_device* dev, int entry,
 				  int offset)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	return sonic_buf_get(lp->rda, lp->dma_bitmode,
 			     (entry * SIZEOF_SONIC_RD) + offset);
 }
@@ -431,7 +431,7 @@ static inline __u16 sonic_rda_get(struct
 static inline void sonic_rra_put(struct net_device* dev, int entry,
 				 int offset, __u16 val)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	sonic_buf_put(lp->rra, lp->dma_bitmode,
 		      (entry * SIZEOF_SONIC_RR) + offset, val);
 }
@@ -439,7 +439,7 @@ static inline void sonic_rra_put(struct=20
 static inline __u16 sonic_rra_get(struct net_device* dev, int entry,
 				  int offset)
 {
-	struct sonic_local* lp =3D (struct sonic_local *) dev->priv;
+	struct sonic_local* lp =3D netdev_priv(dev);
 	return sonic_buf_get(lp->rra, lp->dma_bitmode,
 			     (entry * SIZEOF_SONIC_RR) + offset);
 }
diff --git a/drivers/net/sun3_82586.c b/drivers/net/sun3_82586.c
index b77ab6e..a94f98c 100644
--- a/drivers/net/sun3_82586.c
+++ b/drivers/net/sun3_82586.c
@@ -247,7 +247,7 @@ static int check586(struct net_device *d
  */
 static void alloc586(struct net_device *dev)
 {
-	struct priv *p =3D	(struct priv *) dev->priv;
+	struct priv *p =3D	netdev_priv(dev);
=20
 	sun3_reset586();
 	DELAY(1);
@@ -364,17 +364,17 @@ static int __init sun3_82586_probe1(stru
 		goto out;
 	}
=20
-	((struct priv *) (dev->priv))->memtop =3D (char *)dvma_btov(dev->mem_star=
t);
-	((struct priv *) (dev->priv))->base =3D (unsigned long) dvma_btov(0);
+	((struct priv *) (netdev_priv(dev)))->memtop =3D (char *)dvma_btov(dev->m=
em_start);
+	((struct priv *) (netdev_priv(dev)))->base =3D (unsigned long) dvma_btov(=
0);
 	alloc586(dev);
=20
 	/* set number of receive-buffs according to memsize */
 	if(size =3D 0x2000)
-		((struct priv *) dev->priv)->num_recv_buffs =3D NUM_RECV_BUFFS_8;
+		((struct priv *)netdev_priv(dev))->num_recv_buffs =3D NUM_RECV_BUFFS_8;
 	else if(size =3D 0x4000)
-		((struct priv *) dev->priv)->num_recv_buffs =3D NUM_RECV_BUFFS_16;
+		((struct priv *)netdev_priv(dev))->num_recv_buffs =3D NUM_RECV_BUFFS_16;
 	else
-		((struct priv *) dev->priv)->num_recv_buffs =3D NUM_RECV_BUFFS_32;
+		((struct priv *)netdev_priv(dev))->num_recv_buffs =3D NUM_RECV_BUFFS_32;
=20
 	printk("Memaddr: 0x%lx, Memsize: %d, IRQ %d\n",dev->mem_start,size, dev->=
irq);
=20
@@ -398,7 +398,7 @@ static int init586(struct net_device *de
 {
 	void *ptr;
 	int i,result=3D0;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	volatile struct configure_cmd_struct	*cfg_cmd;
 	volatile struct iasetup_cmd_struct *ias_cmd;
 	volatile struct tdr_cmd_struct *tdr_cmd;
@@ -635,7 +635,7 @@ static void *alloc_rfa(struct net_device
 	volatile struct rfd_struct *rfd =3D (struct rfd_struct *)ptr;
 	volatile struct rbd_struct *rbd;
 	int i;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	memset((char *) rfd,0,sizeof(struct rfd_struct)*(p->num_recv_buffs+rfdadd=
));
 	p->rfd_first =3D rfd;
@@ -687,7 +687,7 @@ static irqreturn_t sun3_82586_interrupt(
 		printk ("sun3_82586-interrupt: irq %d for unknown device.\n",irq);
 		return IRQ_NONE;
 	}
-	p =3D (struct priv *) dev->priv;
+	p =3D netdev_priv(dev);
=20
 	if(debuglevel > 1)
 		printk("I");
@@ -757,7 +757,7 @@ static void sun3_82586_rcv_int(struct ne
 	unsigned short totlen;
 	struct sk_buff *skb;
 	struct rbd_struct *rbd;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	if(debuglevel > 0)
 		printk("R");
@@ -875,7 +875,7 @@ #endif
=20
 static void sun3_82586_rnr_int(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	p->stats.rx_errors++;
=20
@@ -899,7 +899,7 @@ static void sun3_82586_rnr_int(struct ne
 static void sun3_82586_xmt_int(struct net_device *dev)
 {
 	int status;
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	if(debuglevel > 0)
 		printk("X");
@@ -949,7 +949,7 @@ #endif
=20
 static void startrecv586(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	WAIT_4_SCB_CMD();
 	WAIT_4_SCB_CMD_RUC();
@@ -961,7 +961,7 @@ static void startrecv586(struct net_devi
=20
 static void sun3_82586_timeout(struct net_device *dev)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 #ifndef NO_NOPCOMMANDS
 	if(p->scb->cus & CU_ACTIVE) /* COMMAND-UNIT active? */
 	{
@@ -1003,7 +1003,7 @@ static int sun3_82586_send_packet(struct
 #ifndef NO_NOPCOMMANDS
 	int next_nop;
 #endif
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
=20
 	if(skb->len > XMIT_BUFF_SIZE)
 	{
@@ -1112,7 +1112,7 @@ #endif
=20
 static struct net_device_stats *sun3_82586_get_stats(struct net_device *de=
v)
 {
-	struct priv *p =3D (struct priv *) dev->priv;
+	struct priv *p =3D netdev_priv(dev);
 	unsigned short crc,aln,rsc,ovrn;
=20
 	crc =3D swab16(p->scb->crc_errs); /* get error-statistic from the ni82586=
 */
diff --git a/drivers/net/sunbmac.c b/drivers/net/sunbmac.c
index b3e0158..376ec86 100644
--- a/drivers/net/sunbmac.c
+++ b/drivers/net/sunbmac.c
@@ -914,7 +914,7 @@ static irqreturn_t bigmac_interrupt(int=20
=20
 static int bigmac_open(struct net_device *dev)
 {
-	struct bigmac *bp =3D (struct bigmac *) dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
 	int ret;
=20
 	ret =3D request_irq(dev->irq, &bigmac_interrupt, IRQF_SHARED, dev->name, =
bp);
@@ -931,7 +931,7 @@ static int bigmac_open(struct net_device
=20
 static int bigmac_close(struct net_device *dev)
 {
-	struct bigmac *bp =3D (struct bigmac *) dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
=20
 	del_timer(&bp->bigmac_timer);
 	bp->timer_state =3D asleep;
@@ -945,7 +945,7 @@ static int bigmac_close(struct net_devic
=20
 static void bigmac_tx_timeout(struct net_device *dev)
 {
-	struct bigmac *bp =3D (struct bigmac *) dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
=20
 	bigmac_init_hw(bp, 0);
 	netif_wake_queue(dev);
@@ -954,7 +954,7 @@ static void bigmac_tx_timeout(struct net
 /* Put a packet on the wire. */
 static int bigmac_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct bigmac *bp =3D (struct bigmac *) dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
 	int len, entry;
 	u32 mapping;
=20
@@ -986,7 +986,7 @@ static int bigmac_start_xmit(struct sk_b
=20
 static struct net_device_stats *bigmac_get_stats(struct net_device *dev)
 {
-	struct bigmac *bp =3D (struct bigmac *) dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
=20
 	bigmac_get_counters(bp, bp->bregs);
 	return &bp->enet_stats;
@@ -994,7 +994,7 @@ static struct net_device_stats *bigmac_g
=20
 static void bigmac_set_multicast(struct net_device *dev)
 {
-	struct bigmac *bp =3D (struct bigmac *) dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
 	void __iomem *bregs =3D bp->bregs;
 	struct dev_mc_list *dmi =3D dev->mc_list;
 	char *addrs;
@@ -1051,7 +1051,7 @@ static void bigmac_set_multicast(struct=20
 /* Ethtool support... */
 static void bigmac_get_drvinfo(struct net_device *dev, struct ethtool_drvi=
nfo *info)
 {
-	struct bigmac *bp =3D dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
=20
 	strcpy(info->driver, "sunbmac");
 	strcpy(info->version, "2.0");
@@ -1061,7 +1061,7 @@ static void bigmac_get_drvinfo(struct ne
=20
 static u32 bigmac_get_link(struct net_device *dev)
 {
-	struct bigmac *bp =3D dev->priv;
+	struct bigmac *bp =3D netdev_priv(dev);
=20
 	spin_lock_irq(&bp->lock);
 	bp->sw_bmsr =3D bigmac_tcvr_read(bp, bp->tregs, BIGMAC_BMSR);
@@ -1097,7 +1097,7 @@ static int __init bigmac_ether_init(stru
 		dev->dev_addr[i] =3D idprom->id_ethaddr[i];
=20
 	/* Setup softc, with backpointers to QEC and BigMAC SBUS device structs. =
*/
-	bp =3D dev->priv;
+	bp =3D netdev_priv(dev);
 	bp->qec_sdev =3D qec_sdev;
 	bp->bigmac_sdev =3D qec_sdev->child;
=20
diff --git a/drivers/net/sungem.c b/drivers/net/sungem.c
index 4328038..1896e62 100644
--- a/drivers/net/sungem.c
+++ b/drivers/net/sungem.c
@@ -164,7 +164,7 @@ static u16 __phy_read(struct gem *gp, in
=20
 static inline int _phy_read(struct net_device *dev, int mii_id, int reg)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	return __phy_read(gp, mii_id, reg);
 }
=20
@@ -197,7 +197,7 @@ static void __phy_write(struct gem *gp,=20
=20
 static inline void _phy_write(struct net_device *dev, int mii_id, int reg,=
 int val)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	__phy_write(gp, mii_id, reg, val & 0xffff);
 }
=20
@@ -880,7 +880,7 @@ static int gem_rx(struct gem *gp, int wo
=20
 static int gem_poll(struct net_device *dev, int *budget)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	/*
@@ -934,7 +934,7 @@ static int gem_poll(struct net_device *d
 static irqreturn_t gem_interrupt(int irq, void *dev_id)
 {
 	struct net_device *dev =3D dev_id;
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	/* Swallow interrupts when shutting the chip down, though
@@ -980,7 +980,7 @@ #endif
=20
 static void gem_tx_timeout(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	printk(KERN_ERR "%s: transmit timed out, resetting\n", dev->name);
 	if (!gp->running) {
@@ -1019,7 +1019,7 @@ static __inline__ int gem_intme(int entr
=20
 static int gem_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	int entry;
 	u64 ctrl;
 	unsigned long flags;
@@ -2192,7 +2192,7 @@ static void gem_stop_phy(struct gem *gp,
=20
 static int gem_do_start(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	spin_lock_irqsave(&gp->lock, flags);
@@ -2239,7 +2239,7 @@ static int gem_do_start(struct net_devic
=20
 static void gem_do_stop(struct net_device *dev, int wol)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	spin_lock_irqsave(&gp->lock, flags);
@@ -2315,7 +2315,7 @@ static void gem_reset_task(struct work_s
=20
 static int gem_open(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	int rc =3D 0;
=20
 	mutex_lock(&gp->pm_mutex);
@@ -2332,7 +2332,7 @@ static int gem_open(struct net_device *d
=20
 static int gem_close(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	/* Note: we don't need to call netif_poll_disable() here because
 	 * our caller (dev_close) already did it for us
@@ -2353,7 +2353,7 @@ #ifdef CONFIG_PM
 static int gem_suspend(struct pci_dev *pdev, pm_message_t state)
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev);
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	mutex_lock(&gp->pm_mutex);
@@ -2417,7 +2417,7 @@ static int gem_suspend(struct pci_dev *p
 static int gem_resume(struct pci_dev *pdev)
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev);
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	printk(KERN_INFO "%s: resuming\n", dev->name);
@@ -2492,7 +2492,7 @@ #endif /* CONFIG_PM */
=20
 static struct net_device_stats *gem_get_stats(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	struct net_device_stats *stats =3D &gp->net_stats;
=20
 	spin_lock_irq(&gp->lock);
@@ -2528,7 +2528,7 @@ static struct net_device_stats *gem_get_
 static int gem_set_mac_address(struct net_device *dev, void *addr)
 {
 	struct sockaddr *macaddr =3D (struct sockaddr *) addr;
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	unsigned char *e =3D &dev->dev_addr[0];
=20
 	if (!is_valid_ether_addr(macaddr->sa_data))
@@ -2556,7 +2556,7 @@ static int gem_set_mac_address(struct ne
=20
 static void gem_set_multicast(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	u32 rxcfg, rxcfg_new;
 	int limit =3D 10000;
=20
@@ -2605,7 +2605,7 @@ #endif
=20
 static int gem_change_mtu(struct net_device *dev, int new_mtu)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	if (new_mtu < GEM_MIN_MTU || new_mtu > GEM_MAX_MTU)
 		return -EINVAL;
@@ -2636,7 +2636,7 @@ static int gem_change_mtu(struct net_dev
=20
 static void gem_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo=
 *info)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	strcpy(info->driver, DRV_NAME);
 	strcpy(info->version, DRV_VERSION);
@@ -2645,7 +2645,7 @@ static void gem_get_drvinfo(struct net_d
=20
 static int gem_get_settings(struct net_device *dev, struct ethtool_cmd *cm=
d)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	if (gp->phy_type =3D phy_mii_mdio0 ||
 	    gp->phy_type =3D phy_mii_mdio1) {
@@ -2691,7 +2691,7 @@ static int gem_get_settings(struct net_d
=20
 static int gem_set_settings(struct net_device *dev, struct ethtool_cmd *cm=
d)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	/* Verify the settings we care about. */
 	if (cmd->autoneg !=3D AUTONEG_ENABLE &&
@@ -2722,7 +2722,7 @@ static int gem_set_settings(struct net_d
=20
 static int gem_nway_reset(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	if (!gp->want_autoneg)
 		return -EINVAL;
@@ -2739,13 +2739,13 @@ static int gem_nway_reset(struct net_dev
=20
 static u32 gem_get_msglevel(struct net_device *dev)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	return gp->msg_enable;
 }
=20
 static void gem_set_msglevel(struct net_device *dev, u32 value)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	gp->msg_enable =3D value;
 }
=20
@@ -2757,7 +2757,7 @@ #define WOL_SUPPORTED_MASK	(WAKE_MAGIC)
=20
 static void gem_get_wol(struct net_device *dev, struct ethtool_wolinfo *wo=
l)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	/* Add more when I understand how to program the chip */
 	if (gp->has_wol) {
@@ -2771,7 +2771,7 @@ static void gem_get_wol(struct net_devic
=20
 static int gem_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
=20
 	if (!gp->has_wol)
 		return -EOPNOTSUPP;
@@ -2793,7 +2793,7 @@ static const struct ethtool_ops gem_etht
=20
 static int gem_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 {
-	struct gem *gp =3D dev->priv;
+	struct gem *gp =3D netdev_priv(dev);
 	struct mii_ioctl_data *data =3D if_mii(ifr);
 	int rc =3D -EOPNOTSUPP;
 	unsigned long flags;
@@ -2925,7 +2925,7 @@ static void gem_remove_one(struct pci_de
 	struct net_device *dev =3D pci_get_drvdata(pdev);
=20
 	if (dev) {
-		struct gem *gp =3D dev->priv;
+		struct gem *gp =3D netdev_priv(dev);
=20
 		unregister_netdev(dev);
=20
@@ -3029,7 +3029,7 @@ static int __devinit gem_init_one(struct
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
=20
-	gp =3D dev->priv;
+	gp =3D netdev_priv(dev);
=20
 	err =3D pci_request_regions(pdev, DRV_NAME);
 	if (err) {
diff --git a/drivers/net/sunhme.c b/drivers/net/sunhme.c
index 8b35f13..1049740 100644
--- a/drivers/net/sunhme.c
+++ b/drivers/net/sunhme.c
@@ -2136,7 +2136,7 @@ static irqreturn_t quattro_sbus_interrup
=20
 	for (i =3D 0; i < 4; i++) {
 		struct net_device *dev =3D qp->happy_meals[i];
-		struct happy_meal *hp  =3D dev->priv;
+		struct happy_meal *hp  =3D netdev_priv(dev);
 		u32 happy_status       =3D hme_read32(hp, hp->gregs + GREG_STAT);
=20
 		HMD(("quattro_interrupt: status=3D%08x ", happy_status));
@@ -2181,7 +2181,7 @@ #endif
=20
 static int happy_meal_open(struct net_device *dev)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
 	int res;
=20
 	HMD(("happy_meal_open: "));
@@ -2213,7 +2213,7 @@ static int happy_meal_open(struct net_de
=20
 static int happy_meal_close(struct net_device *dev)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
=20
 	spin_lock_irq(&hp->happy_lock);
 	happy_meal_stop(hp, hp->gregs);
@@ -2242,7 +2242,7 @@ #endif
=20
 static void happy_meal_tx_timeout(struct net_device *dev)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
=20
 	printk (KERN_ERR "%s: transmit timed out, resetting\n", dev->name);
 	tx_dump_log();
@@ -2260,7 +2260,7 @@ static void happy_meal_tx_timeout(struct
=20
 static int happy_meal_start_xmit(struct sk_buff *skb, struct net_device *d=
ev)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
  	int entry;
  	u32 tx_flags;
=20
@@ -2349,7 +2349,7 @@ static int happy_meal_start_xmit(struct=20
=20
 static struct net_device_stats *happy_meal_get_stats(struct net_device *de=
v)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
=20
 	spin_lock_irq(&hp->happy_lock);
 	happy_meal_get_counters(hp, hp->bigmacregs);
@@ -2360,7 +2360,7 @@ static struct net_device_stats *happy_me
=20
 static void happy_meal_set_multicast(struct net_device *dev)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
 	void __iomem *bregs =3D hp->bigmacregs;
 	struct dev_mc_list *dmi =3D dev->mc_list;
 	char *addrs;
@@ -2410,7 +2410,7 @@ static void happy_meal_set_multicast(str
 /* Ethtool support... */
 static int hme_get_settings(struct net_device *dev, struct ethtool_cmd *cm=
d)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
=20
 	cmd->supported  		(SUPPORTED_10baseT_Half | SUPPORTED_10baseT_Full |
@@ -2455,7 +2455,7 @@ static int hme_get_settings(struct net_d
=20
 static int hme_set_settings(struct net_device *dev, struct ethtool_cmd *cm=
d)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
=20
 	/* Verify the settings we care about. */
 	if (cmd->autoneg !=3D AUTONEG_ENABLE &&
@@ -2479,7 +2479,7 @@ static int hme_set_settings(struct net_d
=20
 static void hme_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo=
 *info)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
=20
 	strcpy(info->driver, "sunhme");
 	strcpy(info->version, "2.02");
@@ -2498,7 +2498,7 @@ #endif
=20
 static u32 hme_get_link(struct net_device *dev)
 {
-	struct happy_meal *hp =3D dev->priv;
+	struct happy_meal *hp =3D netdev_priv(dev);
=20
 	spin_lock_irq(&hp->happy_lock);
 	hp->sw_bmcr =3D happy_meal_tcvr_read(hp, hp->tcvregs, MII_BMCR);
@@ -2709,7 +2709,7 @@ static int __devinit happy_meal_sbus_pro
 			memcpy(dev->dev_addr, idprom->id_ethaddr, 6);
 	}
=20
-	hp =3D dev->priv;
+	hp =3D netdev_priv(dev);
=20
 	hp->happy_dev =3D sdev;
=20
@@ -3030,7 +3030,7 @@ #endif
=20
 	dev->base_addr =3D (long) pdev;
=20
-	hp =3D (struct happy_meal *)dev->priv;
+	hp =3D netdev_priv(dev);
 	memset(hp, 0, sizeof(*hp));
=20
 	hp->happy_dev =3D pdev;
diff --git a/drivers/net/sunqe.c b/drivers/net/sunqe.c
index 1b65ae8..49498fd 100644
--- a/drivers/net/sunqe.c
+++ b/drivers/net/sunqe.c
@@ -510,7 +510,7 @@ static irqreturn_t qec_interrupt(int irq
=20
 static int qe_open(struct net_device *dev)
 {
-	struct sunqe *qep =3D (struct sunqe *) dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
=20
 	qep->mconfig =3D (MREGS_MCONFIG_TXENAB |
 			MREGS_MCONFIG_RXENAB |
@@ -520,7 +520,7 @@ static int qe_open(struct net_device *de
=20
 static int qe_close(struct net_device *dev)
 {
-	struct sunqe *qep =3D (struct sunqe *) dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
=20
 	qe_stop(qep);
 	return 0;
@@ -546,7 +546,7 @@ static void qe_tx_reclaim(struct sunqe *
=20
 static void qe_tx_timeout(struct net_device *dev)
 {
-	struct sunqe *qep =3D (struct sunqe *) dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
 	int tx_full;
=20
 	spin_lock_irq(&qep->lock);
@@ -572,7 +572,7 @@ out:
 /* Get a packet queued to go onto the wire. */
 static int qe_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct sunqe *qep =3D (struct sunqe *) dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
 	struct sunqe_buffers *qbufs =3D qep->buffers;
 	__u32 txbuf_dvma, qbufs_dvma =3D qep->buffers_dvma;
 	unsigned char *txbuf;
@@ -624,14 +624,14 @@ static int qe_start_xmit(struct sk_buff=20
=20
 static struct net_device_stats *qe_get_stats(struct net_device *dev)
 {
-	struct sunqe *qep =3D (struct sunqe *) dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
=20
 	return &qep->net_stats;
 }
=20
 static void qe_set_multicast(struct net_device *dev)
 {
-	struct sunqe *qep =3D (struct sunqe *) dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
 	struct dev_mc_list *dmi =3D dev->mc_list;
 	u8 new_mconfig =3D qep->mconfig;
 	char *addrs;
@@ -696,7 +696,7 @@ static void qe_set_multicast(struct net_
 /* Ethtool support... */
 static void qe_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo =
*info)
 {
-	struct sunqe *qep =3D dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
=20
 	strcpy(info->driver, "sunqe");
 	strcpy(info->version, "3.0");
@@ -706,7 +706,7 @@ static void qe_get_drvinfo(struct net_de
=20
 static u32 qe_get_link(struct net_device *dev)
 {
-	struct sunqe *qep =3D dev->priv;
+	struct sunqe *qep =3D netdev_priv(dev);
 	void __iomem *mregs =3D qep->mregs;
 	u8 phyconfig;
=20
diff --git a/drivers/net/tc35815.c b/drivers/net/tc35815.c
index ec41469..e91cf34 100644
--- a/drivers/net/tc35815.c
+++ b/drivers/net/tc35815.c
@@ -614,7 +614,7 @@ static int __devinit tc35815_mac_match(s
=20
 static int __devinit tc35815_read_plat_dev_addr(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct device *pd =3D bus_find_device(&platform_bus_type, NULL,
 					    lp->pci_dev, tc35815_mac_match);
 	if (pd) {
@@ -684,7 +684,7 @@ static int __devinit tc35815_init_one (s
 	}
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
-	lp =3D dev->priv;
+	lp =3D netdev_priv(dev);
=20
 	/* enable device (incl. PCI PM wakeup), and bus-mastering */
 	rc =3D pci_enable_device (pdev);
@@ -749,7 +749,7 @@ #endif
 	dev->base_addr =3D (unsigned long) ioaddr;
=20
 	/* dev->priv/lp zeroed and aligned in alloc_etherdev */
-	lp =3D dev->priv;
+	lp =3D netdev_priv(dev);
 	spin_lock_init(&lp->lock);
 	lp->pci_dev =3D pdev;
 	lp->boardtype =3D ent->driver_data;
@@ -827,7 +827,7 @@ static void __devexit tc35815_remove_one
 static int
 tc35815_init_queues(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int i;
 	unsigned long fd_addr;
=20
@@ -964,7 +964,7 @@ #endif
 static void
 tc35815_clear_queues(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int i;
=20
 	for (i =3D 0; i < TX_FD_NUM; i++) {
@@ -995,7 +995,7 @@ #endif
 static void
 tc35815_free_queues(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int i;
=20
 	if (lp->tfd_base) {
@@ -1109,7 +1109,7 @@ #ifdef DEBUG
 static void
 panic_queues(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int i;
=20
 	printk("TxFD base %p, start %u, end %u\n",
@@ -1143,13 +1143,13 @@ static void print_eth(char *add)
=20
 static int tc35815_tx_full(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	return ((lp->tfd_start + 1) % TX_FD_NUM =3D lp->tfd_end);
 }
=20
 static void tc35815_restart(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	int do_phy_reset =3D 1;
 	del_timer(&lp->timer);		/* Kill if running	*/
@@ -1180,7 +1180,7 @@ static void tc35815_restart(struct net_d
=20
 static void tc35815_tx_timeout(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct tc35815_regs __iomem *tr  		(struct tc35815_regs __iomem *)dev->ba=
se_addr;
=20
@@ -1219,7 +1219,7 @@ static void tc35815_tx_timeout(struct ne
 static int
 tc35815_open(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
=20
 	/*
 	 * This is used if the interrupt line can turned off (shared).
@@ -1257,7 +1257,7 @@ tc35815_open(struct net_device *dev)
  */
 static int tc35815_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct TxFD *txfd;
 	unsigned long flags;
=20
@@ -1371,7 +1371,7 @@ #else
 static int tc35815_do_interrupt(struct net_device *dev, u32 status)
 #endif
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct tc35815_regs __iomem *tr  		(struct tc35815_regs __iomem *)dev->ba=
se_addr;
 	int ret =3D -1;
@@ -1456,7 +1456,7 @@ #ifdef TC35815_NAPI
 	}
 	return IRQ_NONE;
 #else
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int handled;
 	u32 status;
=20
@@ -1488,7 +1488,7 @@ static void
 tc35815_rx(struct net_device *dev)
 #endif
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	unsigned int fdctl;
 	int i;
 	int buf_free_count =3D 0;
@@ -1729,7 +1729,7 @@ #ifdef TC35815_NAPI
 static int
 tc35815_poll(struct net_device *dev, int *budget)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct tc35815_regs __iomem *tr  		(struct tc35815_regs __iomem *)dev->ba=
se_addr;
 	int limit =3D min(*budget, dev->quota);
@@ -1773,7 +1773,7 @@ #endif
 static void
 tc35815_check_tx_stat(struct net_device *dev, int status)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	const char *msg =3D NULL;
=20
 	/* count collisions */
@@ -1850,7 +1850,7 @@ #endif
 static void
 tc35815_txdone(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct TxFD *txfd;
 	unsigned int fdctl;
=20
@@ -1948,7 +1948,7 @@ #endif
 static int
 tc35815_close(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	netif_stop_queue(dev);
=20
 	/* Flush the Tx and disable Rx here. */
@@ -1969,7 +1969,7 @@ tc35815_close(struct net_device *dev)
  */
 static struct net_device_stats *tc35815_get_stats(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct tc35815_regs __iomem *tr  		(struct tc35815_regs __iomem *)dev->ba=
se_addr;
 	if (netif_running(dev)) {
@@ -1982,7 +1982,7 @@ static struct net_device_stats *tc35815_
=20
 static void tc35815_set_cam_entry(struct net_device *dev, int index, unsig=
ned char *addr)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct tc35815_regs __iomem *tr  		(struct tc35815_regs __iomem *)dev->ba=
se_addr;
 	int cam_index =3D index * 6;
@@ -2041,7 +2041,7 @@ tc35815_set_multicast_list(struct net_de
 #ifdef WORKAROUND_100HALF_PROMISC
 		/* With some (all?) 100MHalf HUB, controller will hang
 		 * if we enabled promiscuous mode before linkup... */
-		struct tc35815_local *lp =3D dev->priv;
+		struct tc35815_local *lp =3D netdev_priv(dev);
 		int pid =3D lp->phy_addr;
 		if (!(tc_mdio_read(dev, pid, MII_BMSR) & BMSR_LSTATUS))
 			return;
@@ -2081,7 +2081,7 @@ #endif
=20
 static void tc35815_get_drvinfo(struct net_device *dev, struct ethtool_drv=
info *info)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	strcpy(info->driver, MODNAME);
 	strcpy(info->version, DRV_VERSION);
 	strcpy(info->bus_info, pci_name(lp->pci_dev));
@@ -2089,7 +2089,7 @@ static void tc35815_get_drvinfo(struct n
=20
 static int tc35815_get_settings(struct net_device *dev, struct ethtool_cmd=
 *cmd)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	spin_lock_irq(&lp->lock);
 	mii_ethtool_gset(&lp->mii, cmd);
 	spin_unlock_irq(&lp->lock);
@@ -2098,7 +2098,7 @@ static int tc35815_get_settings(struct n
=20
 static int tc35815_set_settings(struct net_device *dev, struct ethtool_cmd=
 *cmd)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int rc;
 #if 1	/* use our negotiation method... */
 	/* Verify the settings we care about. */
@@ -2128,7 +2128,7 @@ #endif
=20
 static int tc35815_nway_reset(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int rc;
 	spin_lock_irq(&lp->lock);
 	rc =3D mii_nway_restart(&lp->mii);
@@ -2138,7 +2138,7 @@ static int tc35815_nway_reset(struct net
=20
 static u32 tc35815_get_link(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int rc;
 	spin_lock_irq(&lp->lock);
 	rc =3D mii_link_ok(&lp->mii);
@@ -2148,25 +2148,25 @@ static u32 tc35815_get_link(struct net_d
=20
 static u32 tc35815_get_msglevel(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	return lp->msg_enable;
 }
=20
 static void tc35815_set_msglevel(struct net_device *dev, u32 datum)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	lp->msg_enable =3D datum;
 }
=20
 static int tc35815_get_stats_count(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	return sizeof(lp->lstats) / sizeof(int);
 }
=20
 static void tc35815_get_ethtool_stats(struct net_device *dev, struct ethto=
ol_stats *stats, u64 *data)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	data[0] =3D lp->lstats.max_tx_qlen;
 	data[1] =3D lp->lstats.tx_ints;
 	data[2] =3D lp->lstats.rx_ints;
@@ -2202,7 +2202,7 @@ static const struct ethtool_ops tc35815_
=20
 static int tc35815_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int rc;
=20
 	if (!netif_running(dev))
@@ -2274,7 +2274,7 @@ static void tc_mdio_write(struct net_dev
=20
 static int tc35815_try_next_permutation(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	unsigned short bmcr;
=20
@@ -2303,7 +2303,7 @@ static int tc35815_try_next_permutation(
 static void
 tc35815_display_link_mode(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	unsigned short lpa, bmcr;
 	char *speed =3D "", *duplex =3D "";
@@ -2329,7 +2329,7 @@ tc35815_display_link_mode(struct net_dev
=20
 static void tc35815_display_forced_link_mode(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	unsigned short bmcr;
 	char *speed =3D "", *duplex =3D "";
@@ -2351,7 +2351,7 @@ static void tc35815_display_forced_link_
=20
 static void tc35815_set_link_modes(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct tc35815_regs __iomem *tr  		(struct tc35815_regs __iomem *)dev->ba=
se_addr;
 	int pid =3D lp->phy_addr;
@@ -2418,7 +2418,7 @@ #endif
 static void tc35815_timer(unsigned long data)
 {
 	struct net_device *dev =3D (struct net_device *)data;
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	unsigned short bmsr, bmcr, lpa;
 	int restart_timer =3D 0;
@@ -2626,7 +2626,7 @@ out:
 static void tc35815_start_auto_negotiation(struct net_device *dev,
 					   struct ethtool_cmd *ep)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	unsigned short bmsr, bmcr, advertize;
 	int timeout;
@@ -2750,7 +2750,7 @@ force_link:
=20
 static void tc35815_find_phy(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	unsigned short id0;
=20
@@ -2779,7 +2779,7 @@ static void tc35815_find_phy(struct net_
=20
 static void tc35815_phy_chip_init(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	int pid =3D lp->phy_addr;
 	unsigned short bmcr;
 	struct ethtool_cmd ecmd, *ep;
@@ -2853,7 +2853,7 @@ static void tc35815_chip_reset(struct ne
=20
 static void tc35815_chip_init(struct net_device *dev)
 {
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	struct tc35815_regs __iomem *tr  		(struct tc35815_regs __iomem *)dev->ba=
se_addr;
 	unsigned long txctl =3D TX_CTL_CMD;
@@ -2915,7 +2915,7 @@ #ifdef CONFIG_PM
 static int tc35815_suspend(struct pci_dev *pdev, pm_message_t state)
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev);
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	pci_save_state(pdev);
@@ -2933,7 +2933,7 @@ static int tc35815_suspend(struct pci_de
 static int tc35815_resume(struct pci_dev *pdev)
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev);
-	struct tc35815_local *lp =3D dev->priv;
+	struct tc35815_local *lp =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	pci_restore_state(pdev);
diff --git a/drivers/net/typhoon.c b/drivers/net/typhoon.c
index 0358720..76ad294 100644
--- a/drivers/net/typhoon.c
+++ b/drivers/net/typhoon.c
@@ -1818,7 +1818,7 @@ static irqreturn_t
 typhoon_interrupt(int irq, void *dev_instance)
 {
 	struct net_device *dev =3D (struct net_device *) dev_instance;
-	struct typhoon *tp =3D dev->priv;
+	struct typhoon *tp =3D netdev_priv(dev);
 	void __iomem *ioaddr =3D tp->ioaddr;
 	u32 intr_status;
=20
diff --git a/drivers/net/znet.c b/drivers/net/znet.c
index 4032e9f..27e060e 100644
--- a/drivers/net/znet.c
+++ b/drivers/net/znet.c
@@ -169,7 +169,7 @@ static void znet_tx_timeout (struct net_
 /* Request needed resources */
 static int znet_request_resources (struct net_device *dev)
 {
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	if (request_irq (dev->irq, &znet_interrupt, 0, "ZNet", dev))
@@ -203,7 +203,7 @@ static int znet_request_resources (struc
=20
 static void znet_release_resources (struct net_device *dev)
 {
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	unsigned long flags;
=20
 	release_region (znet->sia_base, znet->sia_size);
@@ -218,7 +218,7 @@ static void znet_release_resources (stru
 /* Keep the magical SIA stuff in a single function... */
 static void znet_transceiver_power (struct net_device *dev, int on)
 {
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	unsigned char v;
=20
 	/* Turn on/off the 82501 SIA, using zenith-specific magic. */
@@ -237,7 +237,7 @@ static void znet_transceiver_power (stru
    Also used from hardware_init. */
 static void znet_set_multicast_list (struct net_device *dev)
 {
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	short ioaddr =3D dev->base_addr;
 	struct i82593_conf_block *cfblk =3D &znet->i593_init;
=20
@@ -390,7 +390,7 @@ static int __init znet_probe (void)
=20
 	SET_MODULE_OWNER (dev);
=20
-	znet =3D dev->priv;
+	znet =3D netdev_priv(dev);
=20
 	netinfo =3D (struct netidblk *)p;
 	dev->base_addr =3D netinfo->iobase1;
@@ -535,7 +535,7 @@ static void znet_tx_timeout (struct net_
 static int znet_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
 	int ioaddr =3D dev->base_addr;
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	unsigned long flags;
 	short length =3D skb->len;
=20
@@ -605,7 +605,7 @@ static int znet_send_packet(struct sk_bu
 static irqreturn_t znet_interrupt(int irq, void *dev_id)
 {
 	struct net_device *dev =3D dev_id;
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	int ioaddr;
 	int boguscnt =3D 20;
 	int handled =3D 0;
@@ -683,7 +683,7 @@ static irqreturn_t znet_interrupt(int ir
=20
 static void znet_rx(struct net_device *dev)
 {
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	int ioaddr =3D dev->base_addr;
 	int boguscount =3D 1;
 	short next_frame_end_offset =3D 0; 		/* Offset of next frame start. */
@@ -833,7 +833,7 @@ static int znet_close(struct net_device=20
    closed. */
 static struct net_device_stats *net_get_stats(struct net_device *dev)
 {
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
=20
 	return &znet->stats;
 }
@@ -842,7 +842,7 @@ static void show_dma(struct net_device *
 {
 	short ioaddr =3D dev->base_addr;
 	unsigned char stat =3D inb (ioaddr);
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
 	unsigned long flags;
 	short dma_port =3D ((znet->tx_dma&3)<<2) + IO_DMA2_BASE;
 	unsigned addr =3D inb(dma_port);
@@ -865,7 +865,7 @@ static void hardware_init(struct net_dev
 {
 	unsigned long flags;
 	short ioaddr =3D dev->base_addr;
-	struct znet_private *znet =3D dev->priv;
+	struct znet_private *znet =3D netdev_priv(dev);
=20
 	znet->rx_cur =3D znet->rx_start;
 	znet->tx_cur =3D znet->tx_start;
@@ -927,7 +927,7 @@ static void update_stop_hit(short ioaddr
 static __exit void znet_cleanup (void)
 {
 	if (znet_dev) {
-		struct znet_private *znet =3D znet_dev->priv;
+		struct znet_private *znet =3D netdev_priv(znet_dev);
=20
 		unregister_netdev (znet_dev);
 		kfree (znet->rx_start);

