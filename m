From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 03 Aug 2007 17:36:27 +0000
Subject: [PATCH 09/13] dev->priv to netdev_priv(dev), for drivers/net/tokenring
Message-Id: <200708031736.TAA00854@ifs.emn.fr>
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

 drivers/net/tokenring/3c359.c       |   58 ++++++++++++++++++-------------=
-----
 drivers/net/tokenring/ibmtr.c       |   38 +++++++++++------------
 drivers/net/tokenring/lanstreamer.c |   32 +++++++++----------
 drivers/net/tokenring/madgemc.c     |    4 +-
 drivers/net/tokenring/olympic.c     |   36 +++++++++++-----------
 drivers/net/tokenring/tmspci.c      |    4 +-
 6 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/drivers/net/tokenring/3c359.c b/drivers/net/tokenring/3c359.c
index 9f1b6ab..a8573da 100644
--- a/drivers/net/tokenring/3c359.c
+++ b/drivers/net/tokenring/3c359.c
@@ -156,7 +156,7 @@ static void print_rx_state(struct net_de
 static void print_tx_state(struct net_device *dev)
 {
=20
-	struct xl_private *xl_priv =3D (struct xl_private *)dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	struct xl_tx_desc *txd ;=20
 	u8 __iomem *xl_mmio =3D xl_priv->xl_mmio ;=20
 	int i ;=20
@@ -179,7 +179,7 @@ static void print_tx_state(struct net_de
 static void print_rx_state(struct net_device *dev)
 {
=20
-	struct xl_private *xl_priv =3D (struct xl_private *)dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	struct xl_rx_desc *rxd ;=20
 	u8 __iomem *xl_mmio =3D xl_priv->xl_mmio ;=20
 	int i ;=20
@@ -213,7 +213,7 @@ #endif
=20
 static u16 xl_ee_read(struct net_device *dev, int ee_addr)
 {=20
-    	struct xl_private *xl_priv =3D (struct xl_private *)dev->priv ;
+    	struct xl_private *xl_priv =3D netdev_priv(dev) ;
 	u8 __iomem *xl_mmio =3D xl_priv->xl_mmio ;=20
=20
 	/* Wait for EEProm to not be busy */
@@ -245,7 +245,7 @@ static u16 xl_ee_read(struct net_device=20
=20
 static void  xl_ee_write(struct net_device *dev, int ee_addr, u16 ee_value=
)=20
 {
-    	struct xl_private *xl_priv =3D (struct xl_private *)dev->priv ;
+    	struct xl_private *xl_priv =3D netdev_priv(dev) ;
 	u8 __iomem *xl_mmio =3D xl_priv->xl_mmio ;=20
=20
 	/* Wait for EEProm to not be busy */
@@ -305,11 +305,11 @@ static int __devinit xl_probe(struct pci
 		pci_release_regions(pdev) ;=20
 		return -ENOMEM ;=20
 	}=20
-	xl_priv =3D dev->priv ;=20
+	xl_priv =3D netdev_priv(dev) ;=20
=20
 #if XL_DEBUG =20
 	printk("pci_device: %p, dev:%p, dev->priv: %p, ba[0]: %10x, ba[1]:%10x\n"=
,=20
-		pdev, dev, dev->priv, (unsigned int)pdev->resource[0].start, (unsigned i=
nt)pdev->resource[1].start) ; =20
+		pdev, dev, netdev_priv(dev), (unsigned int)pdev->resource[0].start, (uns=
igned int)pdev->resource[1].start) ; =20
 #endif=20
=20
 	dev->irq=3Dpdev->irq;
@@ -365,7 +365,7 @@ #endif=20
=20
 static int __devinit xl_init(struct net_device *dev)=20
 {
-    	struct xl_private *xl_priv =3D (struct xl_private *)dev->priv ;
+    	struct xl_private *xl_priv =3D netdev_priv(dev) ;
=20
 	printk(KERN_INFO "%s \n", version);
 	printk(KERN_INFO "%s: I/O at %hx, MMIO at %p, using irq %d\n",
@@ -385,7 +385,7 @@ static int __devinit xl_init(struct net_
=20
 static int xl_hw_reset(struct net_device *dev)=20
 {=20
-    	struct xl_private *xl_priv =3D (struct xl_private *)dev->priv ;
+    	struct xl_private *xl_priv =3D netdev_priv(dev) ;
 	u8 __iomem *xl_mmio =3D xl_priv->xl_mmio ;=20
 	unsigned long t ;=20
 	u16 i ;=20
@@ -568,7 +568,7 @@ #endif
=20
 static int xl_open(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 	u8 __iomem *xl_mmio =3D xl_priv->xl_mmio ;=20
 	u8 i ;=20
 	u16 hwaddr[3] ; /* Should be u8[6] but we get word return values */
@@ -726,7 +726,7 @@ static int xl_open(struct net_device *de
=20
 static int xl_open_hw(struct net_device *dev)=20
 {=20
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 	u8 __iomem *xl_mmio =3D xl_priv->xl_mmio ;=20
 	u16 vsoff ;
 	char ver_str[33]; =20
@@ -875,7 +875,7 @@ static int xl_open_hw(struct net_device=20
=20
 static void adv_rx_ring(struct net_device *dev) /* Advance rx_ring, cut do=
wn on bloat in xl_rx */=20
 {
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 	int prev_ring_loc ;=20
=20
 	prev_ring_loc =3D (xl_priv->rx_ring_tail + XL_RX_RING_SIZE - 1) & (XL_RX_=
RING_SIZE - 1);
@@ -890,7 +890,7 @@ static void adv_rx_ring(struct net_devic
=20
 static void xl_rx(struct net_device *dev)
 {
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	struct sk_buff *skb, *skb2 ;=20
 	int frame_length =3D 0, copy_len =3D 0  ; =09
@@ -997,7 +997,7 @@ static void xl_rx(struct net_device *dev
=20
 static void xl_reset(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	unsigned long t;=20
=20
@@ -1020,7 +1020,7 @@ static void xl_reset(struct net_device *
=20
 static void xl_freemem(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv ;=20
+	struct xl_private *xl_priv=3Dnetdev_priv(dev) ;=20
 	int i ;=20
=20
 	for (i=3D0;i<XL_RX_RING_SIZE;i++) {
@@ -1044,7 +1044,7 @@ static void xl_freemem(struct net_device
 static irqreturn_t xl_interrupt(int irq, void *dev_id)=20
 {
 	struct net_device *dev =3D (struct net_device *)dev_id;
- 	struct xl_private *xl_priv =3D(struct xl_private *)dev->priv;
+ 	struct xl_private *xl_priv =3Dnetdev_priv(dev);
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	u16 intstatus, macstatus  ;
=20
@@ -1171,7 +1171,7 @@ static irqreturn_t xl_interrupt(int irq,
 =09
 static int xl_xmit(struct sk_buff *skb, struct net_device *dev)=20
 {
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 	struct xl_tx_desc *txd ;=20
 	int tx_head, tx_tail, tx_prev ;=20
 	unsigned long flags ; =09
@@ -1232,7 +1232,7 @@ static int xl_xmit(struct sk_buff *skb,=20
=20
 static void xl_dn_comp(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	struct xl_tx_desc *txd ;=20
=20
@@ -1268,7 +1268,7 @@ static void xl_dn_comp(struct net_device
=20
 static int xl_close(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	unsigned long t ;=20
=20
@@ -1366,7 +1366,7 @@ static int xl_close(struct net_device *d
=20
 static void xl_set_rx_mode(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	struct dev_mc_list *dmi ;=20
 	unsigned char dev_mc_address[4] ;=20
 	u16 options ;=20
@@ -1407,7 +1407,7 @@ static void xl_set_rx_mode(struct net_de
=20
 static void xl_srb_bh(struct net_device *dev)=20
 {=20
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	u8 srb_cmd, ret_code ;=20
 	int i ;=20
@@ -1476,14 +1476,14 @@ static void xl_srb_bh(struct net_device=20
=20
 static struct net_device_stats * xl_get_stats(struct net_device *dev)
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;
 	return (struct net_device_stats *) &xl_priv->xl_stats;=20
 }
=20
 static int xl_set_mac_address (struct net_device *dev, void *addr)=20
 {
 	struct sockaddr *saddr =3D addr ;=20
-	struct xl_private *xl_priv =3D (struct xl_private *)dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
=20
 	if (netif_running(dev)) {=20
 		printk(KERN_WARNING "%s: Cannot set mac/laa address while card is open\n=
", dev->name) ;=20
@@ -1504,7 +1504,7 @@ static int xl_set_mac_address (struct ne
=20
 static void xl_arb_cmd(struct net_device *dev)
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv;
+	struct xl_private *xl_priv =3D netdev_priv(dev);
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	u8 arb_cmd ;=20
 	u16 lan_status, lan_status_diff ;=20
@@ -1632,7 +1632,7 @@ #endif 	=09
=20
 static void xl_asb_cmd(struct net_device *dev)
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
=20
 	if (xl_priv->asb_queued =3D 1)=20
@@ -1663,7 +1663,7 @@ static void xl_asb_cmd(struct net_device
  */
 static void xl_asb_bh(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 	u8 ret_code ;=20
=20
@@ -1691,7 +1691,7 @@ static void xl_asb_bh(struct net_device=20
=20
 static void xl_srb_cmd(struct net_device *dev, int srb_cmd)=20
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
=20
 	switch (srb_cmd) {=20
@@ -1748,7 +1748,7 @@ static void xl_srb_cmd(struct net_device
=20
 static void xl_wait_misr_flags(struct net_device *dev)=20
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv ;=20
+	struct xl_private *xl_priv =3D netdev_priv(dev) ;=20
 	u8 __iomem * xl_mmio =3D xl_priv->xl_mmio ;=20
 =09
 	int i  ;=20
@@ -1773,7 +1773,7 @@ static void xl_wait_misr_flags(struct ne
=20
 static int xl_change_mtu(struct net_device *dev, int mtu)=20
 {
-	struct xl_private *xl_priv =3D (struct xl_private *) dev->priv;
+	struct xl_private *xl_priv =3D netdev_priv(dev);
 	u16 max_mtu ;=20
=20
 	if (xl_priv->xl_ring_speed =3D 4)
@@ -1795,7 +1795,7 @@ static int xl_change_mtu(struct net_devi
 static void __devexit xl_remove_one (struct pci_dev *pdev)
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev);
-	struct xl_private *xl_priv=3D(struct xl_private *)dev->priv;
+	struct xl_private *xl_priv=3Dnetdev_priv(dev);
 =09
 	unregister_netdev(dev);
 	iounmap(xl_priv->xl_mmio) ;=20
diff --git a/drivers/net/tokenring/ibmtr.c b/drivers/net/tokenring/ibmtr.c
index 1e8958e..5140969 100644
--- a/drivers/net/tokenring/ibmtr.c
+++ b/drivers/net/tokenring/ibmtr.c
@@ -327,7 +327,7 @@ #ifndef PCMCIA
 	release_region(dev->base_addr, IBMTR_IO_EXTENT);
=20
 	{=20
-		struct tok_info *ti =3D (struct tok_info *) dev->priv;
+		struct tok_info *ti =3D netdev_priv(dev);
 		iounmap(ti->mmio);
 		iounmap(ti->sram_virt);
 	}
@@ -384,7 +384,7 @@ static int __devinit ibmtr_probe1(struct
=20
 	unsigned char segment, intr=3D0, irq=3D0, i, j, cardpresent=3DNOTOK, temp=
=3D0;
 	void __iomem * t_mmio =3D NULL;
-	struct tok_info *ti =3D dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
 	void __iomem *cd_chanid;
 	unsigned char *tchanid, ctemp;
 #ifndef PCMCIA
@@ -823,7 +823,7 @@ static unsigned char __devinit get_sram_
=20
 static int __devinit trdev_init(struct net_device *dev)
 {
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
=20
 	SET_PAGE(ti->srb_page);
         ti->open_failure =3D NO    ;
@@ -846,7 +846,7 @@ static int tok_init_card(struct net_devi
 	unsigned long i;
=20
 	PIOaddr =3D dev->base_addr;
-	ti =3D (struct tok_info *) dev->priv;
+	ti =3D netdev_priv(dev);
 	/* Special processing for first interrupt after reset */
 	ti->do_tok_int =3D FIRST_INT;
 	/* Reset adapter */
@@ -868,7 +868,7 @@ #endif
 /*************************************************************************=
****/
 static int tok_open(struct net_device *dev)
 {
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
 	int i;
=20
 	/*the case we were left in a failure state during a previous open */
@@ -927,7 +927,7 @@ static void tok_open_adapter(unsigned lo
 	struct tok_info *ti;
 	int i;
=20
-	ti =3D (struct tok_info *) dev->priv;
+	ti =3D netdev_priv(dev);
 	SET_PAGE(ti->init_srb_page);=20
 	writeb(~SRB_RESP_INT, ti->mmio + ACA_OFFSET + ACA_RESET + ISRP_ODD);
 	for (i =3D 0; i < sizeof(struct dir_open_adapter); i++)
@@ -962,7 +962,7 @@ static void tok_open_adapter(unsigned lo
 static void open_sap(unsigned char type, struct net_device *dev)
 {
 	int i;
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
=20
 	SET_PAGE(ti->srb_page);
 	for (i =3D 0; i < sizeof(struct dlc_open_sap); i++)
@@ -986,7 +986,7 @@ #define STATION_COUNT_OFST      18
=20
 static void tok_set_multicast_list(struct net_device *dev)
 {
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
 	struct dev_mc_list *mclist;
 	unsigned char address[4];
=20
@@ -1029,7 +1029,7 @@ static int tok_send_packet(struct sk_buf
 {
 	struct tok_info *ti;
 	unsigned long flags;
-	ti =3D (struct tok_info *) dev->priv;
+	ti =3D netdev_priv(dev);
=20
         netif_stop_queue(dev);
=20
@@ -1051,7 +1051,7 @@ static int tok_send_packet(struct sk_buf
=20
 static int tok_close(struct net_device *dev)
 {
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
=20
 	/* Important for PCMCIA hot unplug, otherwise, we'll pull the card, */
 	/* unloading the module from memory, and then if a timer pops, ouch */
@@ -1094,7 +1094,7 @@ static void __iomem *map_address(struct=20
=20
 static void dir_open_adapter (struct net_device *dev)
 {
-        struct tok_info *ti =3D (struct tok_info *) dev->priv;
+        struct tok_info *ti =3D netdev_priv(dev);
         unsigned char ret_code;
         __u16 err;
=20
@@ -1179,7 +1179,7 @@ #endif
 #if TR_VERBOSE
 	DPRINTK("Int from tok_driver, dev : %p irq%d\n", dev,irq);
 #endif
-	ti =3D (struct tok_info *) dev->priv;
+	ti =3D netdev_priv(dev);
 	if (ti->sram_phys & 1)
 		return IRQ_NONE;         /* PCMCIA card extraction flag */
 	spin_lock(&(ti->lock));
@@ -1498,7 +1498,7 @@ static void initial_tok_int(struct net_d
 	struct tok_info *ti;
         unsigned char init_status; /*BMS 12/2000*/
=20
-	ti =3D (struct tok_info *) dev->priv;
+	ti =3D netdev_priv(dev);
=20
 	ti->do_tok_int =3D NOT_FIRST;
=20
@@ -1560,7 +1560,7 @@ #define RSAP_VALUE_OFST         9
=20
 static void tr_tx(struct net_device *dev)
 {
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
 	struct trh_hdr *trhdr =3D (struct trh_hdr *) ti->current_skb->data;
 	unsigned int hdr_len;
 	__u32 dhb=3D0,dhb_base;
@@ -1674,7 +1674,7 @@ #define ETHERTYPE_OFST          6
=20
 static void tr_rx(struct net_device *dev)
 {
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
 	__u32 rbuffer;
 	void __iomem *rbuf, *rbufdata, *llc;
 	__u8 rbuffer_page =3D 0;
@@ -1846,7 +1846,7 @@ static void ibmtr_reset_timer(struct tim
 void tok_rerun(unsigned long dev_addr){
=20
 	struct net_device *dev =3D (struct net_device *)dev_addr;
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
=20
 	if ( ti->open_action =3D RESTART){
 		ti->do_tok_int =3D FIRST_INT;
@@ -1868,7 +1868,7 @@ static void ibmtr_readlog(struct net_dev
 {
 	struct tok_info *ti;
=20
-	ti =3D (struct tok_info *) dev->priv;
+	ti =3D netdev_priv(dev);
=20
 	ti->readlog_pending =3D 0;
 	SET_PAGE(ti->srb_page);
@@ -1891,7 +1891,7 @@ static struct net_device_stats *tok_get_
 {
=20
 	struct tok_info *toki;
-	toki =3D (struct tok_info *) dev->priv;
+	toki =3D netdev_priv(dev);
 	return (struct net_device_stats *) &toki->tr_stats;
 }
=20
@@ -1899,7 +1899,7 @@ static struct net_device_stats *tok_get_
=20
 static int ibmtr_change_mtu(struct net_device *dev, int mtu)
 {
-	struct tok_info *ti =3D (struct tok_info *) dev->priv;
+	struct tok_info *ti =3D netdev_priv(dev);
=20
 	if (ti->ring_speed =3D 16 && mtu > ti->maxmtu16)
 		return -EINVAL;
diff --git a/drivers/net/tokenring/lanstreamer.c b/drivers/net/tokenring/la=
nstreamer.c
index 5d849c0..3448634 100644
--- a/drivers/net/tokenring/lanstreamer.c
+++ b/drivers/net/tokenring/lanstreamer.c
@@ -245,7 +245,7 @@ #endif
 	}
=20
 	SET_MODULE_OWNER(dev);
-	streamer_priv =3D dev->priv;
+	streamer_priv =3D netdev_priv(dev);
=20
 #if STREAMER_NETWORK_MONITOR
 #ifdef CONFIG_PROC_FS
@@ -404,7 +404,7 @@ #endif
 		return;
 	}
=20
-	streamer_priv=DEv->priv;
+	streamer_priv=3Dnetdev_priv(dev);
 	if (streamer_priv =3D NULL) {
 		printk(KERN_ERR "lanstreamer::streamer_remove_one, ERROR dev->priv is NU=
LL\n");
 		return;
@@ -448,7 +448,7 @@ static int streamer_reset(struct net_dev
 	struct sk_buff *skb =3D NULL;
 	__u16 misr;
=20
-	streamer_priv =3D (struct streamer_private *) dev->priv;
+	streamer_priv =3D netdev_priv(dev);
 	streamer_mmio =3D streamer_priv->streamer_mmio;
=20
 	writew(readw(streamer_mmio + BCTL) | BCTL_SOFTRESET, streamer_mmio + BCTL=
);
@@ -587,7 +587,7 @@ #endif
=20
 static int streamer_open(struct net_device *dev)
 {
-	struct streamer_private *streamer_priv =3D (struct streamer_private *) de=
v->priv;
+	struct streamer_private *streamer_priv =3D netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	unsigned long flags;
 	char open_error[255];
@@ -904,7 +904,7 @@ #endif
 static void streamer_rx(struct net_device *dev)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	struct streamer_rx_desc *rx_desc;
 	int rx_ring_last_received, length, frame_length, buffer_cnt =3D 0;
@@ -1029,7 +1029,7 @@ static irqreturn_t streamer_interrupt(in
 {
 	struct net_device *dev =3D (struct net_device *) dev_id;
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	__u16 sisr;
 	__u16 misr;
@@ -1152,7 +1152,7 @@ static irqreturn_t streamer_interrupt(in
 static int streamer_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	unsigned long flags ;
=20
@@ -1203,7 +1203,7 @@ #endif
 static int streamer_close(struct net_device *dev)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	unsigned long flags;
 	int i;
@@ -1269,7 +1269,7 @@ #endif
 static void streamer_set_rx_mode(struct net_device *dev)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	__u8 options =3D 0;
 	struct dev_mc_list *dmi;
@@ -1328,7 +1328,7 @@ static void streamer_set_rx_mode(struct=20
=20
 static void streamer_srb_bh(struct net_device *dev)
 {
-	struct streamer_private *streamer_priv =3D (struct streamer_private *) de=
v->priv;
+	struct streamer_private *streamer_priv =3D netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	__u16 srb_word;
=20
@@ -1493,14 +1493,14 @@ static void streamer_srb_bh(struct net_d
 static struct net_device_stats *streamer_get_stats(struct net_device *dev)
 {
 	struct streamer_private *streamer_priv;
-	streamer_priv =3D (struct streamer_private *) dev->priv;
+	streamer_priv =3D netdev_priv(dev);
 	return (struct net_device_stats *) &streamer_priv->streamer_stats;
 }
=20
 static int streamer_set_mac_address(struct net_device *dev, void *addr)
 {
 	struct sockaddr *saddr =3D addr;
-	struct streamer_private *streamer_priv =3D (struct streamer_private *) de=
v->priv;
+	struct streamer_private *streamer_priv =3D netdev_priv(dev);
=20
 	if (netif_running(dev))=20
 	{
@@ -1525,7 +1525,7 @@ static int streamer_set_mac_address(stru
 static void streamer_arb_cmd(struct net_device *dev)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	__u8 header_len;
 	__u16 frame_len, buffer_len;
@@ -1740,7 +1740,7 @@ drop_frame:
 static void streamer_asb_bh(struct net_device *dev)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
=20
 	if (streamer_priv->asb_queued =3D 1)=20
@@ -1784,7 +1784,7 @@ static void streamer_asb_bh(struct net_d
 static int streamer_change_mtu(struct net_device *dev, int mtu)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u16 max_mtu;
=20
 	if (streamer_priv->streamer_ring_speed =3D 4)
@@ -1848,7 +1848,7 @@ static int streamer_proc_info(char *buff
 static int sprintf_info(char *buffer, struct net_device *dev)
 {
 	struct streamer_private *streamer_priv -	    (struct streamer_private *) =
dev->priv;
+	    netdev_priv(dev);
 	__u8 __iomem *streamer_mmio =3D streamer_priv->streamer_mmio;
 	struct streamer_adapter_addr_table sat;
 	struct streamer_parameters_table spt;
diff --git a/drivers/net/tokenring/madgemc.c b/drivers/net/tokenring/madgem=
c.c
index f8f4d74..9eafc2e 100644
--- a/drivers/net/tokenring/madgemc.c
+++ b/drivers/net/tokenring/madgemc.c
@@ -690,7 +690,7 @@ static int madgemc_close(struct net_devi
 static int madgemc_mcaproc(char *buf, int slot, void *d)=20
 {=09
 	struct net_device *dev =3D (struct net_device *)d;
-	struct net_local *tp =3D dev->priv;
+	struct net_local *tp =3D netdev_priv(dev);
 	struct card_info *curcard =3D tp->tmspriv;
 	int len =3D 0;
 =09
@@ -736,7 +736,7 @@ static int __devexit madgemc_remove(stru
=20
 	BUG_ON(!dev);
=20
-	tp =3D dev->priv;
+	tp =3D netdev_priv(dev);
 	card =3D tp->tmspriv;
 	kfree(card);
 	tp->tmspriv =3D NULL;
diff --git a/drivers/net/tokenring/olympic.c b/drivers/net/tokenring/olympi=
c.c
index 09b3cfb..a96784e 100644
--- a/drivers/net/tokenring/olympic.c
+++ b/drivers/net/tokenring/olympic.c
@@ -219,14 +219,14 @@ static int __devinit olympic_probe(struc
 		goto op_release_dev;
 	}
=20
-	olympic_priv =3D dev->priv ;
+	olympic_priv =3D netdev_priv(dev) ;
 =09
 	spin_lock_init(&olympic_priv->olympic_lock) ;=20
=20
 	init_waitqueue_head(&olympic_priv->srb_wait);
 	init_waitqueue_head(&olympic_priv->trb_wait);
 #if OLYMPIC_DEBUG =20
-	printk(KERN_INFO "pci_device: %p, dev:%p, dev->priv: %p\n", pdev, dev, de=
v->priv);
+	printk(KERN_INFO "pci_device: %p, dev:%p, dev->priv: %p\n", pdev, dev, ne=
tdev_priv(dev));
 #endif
 	dev->irq=3Dpdev->irq;
 	dev->base_addr=3Dpci_resource_start(pdev, 0);
@@ -297,7 +297,7 @@ static int __devinit olympic_init(struct
 	unsigned long t;=20
 	unsigned int uaa_addr;
=20
-    	olympic_priv=3D(struct olympic_private *)dev->priv;
+    	olympic_priv=3Dnetdev_priv(dev);
 	olympic_mmio=3Dolympic_priv->olympic_mmio;
=20
 	printk("%s \n", version);
@@ -435,7 +435,7 @@ #endif
=20
 static int olympic_open(struct net_device *dev)=20
 {
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
 	u8 __iomem *olympic_mmio=3Dolympic_priv->olympic_mmio,*init_srb;
 	unsigned long flags, t;
 	int i, open_finished =3D 1 ;
@@ -755,7 +755,7 @@ out:
  */
 static void olympic_rx(struct net_device *dev)
 {
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
 	u8 __iomem *olympic_mmio=3Dolympic_priv->olympic_mmio;
 	struct olympic_rx_status *rx_status;
 	struct olympic_rx_desc *rx_desc ;=20
@@ -897,7 +897,7 @@ #endif
=20
 static void olympic_freemem(struct net_device *dev)=20
 {=20
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
 	int i;
 		=09
 	for(i=3D0;i<OLYMPIC_RX_RING_SIZE;i++) {
@@ -930,7 +930,7 @@ static void olympic_freemem(struct net_d
 static irqreturn_t olympic_interrupt(int irq, void *dev_id)=20
 {
 	struct net_device *dev=3D (struct net_device *)dev_id;
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
 	u8 __iomem *olympic_mmio=3Dolympic_priv->olympic_mmio;
 	u32 sisr;
 	u8 __iomem *adapter_check_area ;=20
@@ -1046,7 +1046,7 @@ static irqreturn_t olympic_interrupt(int
=20
 static int olympic_xmit(struct sk_buff *skb, struct net_device *dev)=20
 {
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
 	u8 __iomem *olympic_mmio=3Dolympic_priv->olympic_mmio;
 	unsigned long flags ;=20
=20
@@ -1077,7 +1077,7 @@ static int olympic_xmit(struct sk_buff *
=20
 static int olympic_close(struct net_device *dev)=20
 {
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
 	u8 __iomem *olympic_mmio=3Dolympic_priv->olympic_mmio,*srb;
 	unsigned long t,flags;
=20
@@ -1147,7 +1147,7 @@ #endif
=20
 static void olympic_set_rx_mode(struct net_device *dev)=20
 {
-	struct olympic_private *olympic_priv =3D (struct olympic_private *) dev->=
priv ;=20
+	struct olympic_private *olympic_priv =3D netdev_priv(dev) ;=20
    	u8 __iomem *olympic_mmio =3D olympic_priv->olympic_mmio ;=20
 	u8 options =3D 0;=20
 	u8 __iomem *srb;
@@ -1215,7 +1215,7 @@ static void olympic_set_rx_mode(struct n
=20
 static void olympic_srb_bh(struct net_device *dev)=20
 {=20
-	struct olympic_private *olympic_priv =3D (struct olympic_private *) dev->=
priv ;=20
+	struct olympic_private *olympic_priv =3D netdev_priv(dev) ;=20
    	u8 __iomem *olympic_mmio =3D olympic_priv->olympic_mmio ;=20
 	u8 __iomem *srb;
=20
@@ -1361,14 +1361,14 @@ static void olympic_srb_bh(struct net_de
 static struct net_device_stats * olympic_get_stats(struct net_device *dev)
 {
 	struct olympic_private *olympic_priv ;
-	olympic_priv=3D(struct olympic_private *) dev->priv;
+	olympic_priv=3Dnetdev_priv(dev);
 	return (struct net_device_stats *) &olympic_priv->olympic_stats;=20
 }
=20
 static int olympic_set_mac_address (struct net_device *dev, void *addr)=20
 {
 	struct sockaddr *saddr =3D addr ;=20
-	struct olympic_private *olympic_priv =3D (struct olympic_private *)dev->p=
riv ;=20
+	struct olympic_private *olympic_priv =3D netdev_priv(dev) ;=20
=20
 	if (netif_running(dev)) {=20
 		printk(KERN_WARNING "%s: Cannot set mac/laa address while card is open\n=
", dev->name) ;=20
@@ -1389,7 +1389,7 @@ static int olympic_set_mac_address (stru
=20
 static void olympic_arb_cmd(struct net_device *dev)
 {
-	struct olympic_private *olympic_priv =3D (struct olympic_private *) dev->=
priv;
+	struct olympic_private *olympic_priv =3D netdev_priv(dev);
 	u8 __iomem *olympic_mmio=3Dolympic_priv->olympic_mmio;
 	u8 __iomem *arb_block, *asb_block, *srb  ;=20
 	u8 header_len ;=20
@@ -1575,7 +1575,7 @@ drop_frame:
=20
 static void olympic_asb_bh(struct net_device *dev)=20
 {
-	struct olympic_private *olympic_priv =3D (struct olympic_private *) dev->=
priv ;=20
+	struct olympic_private *olympic_priv =3D netdev_priv(dev) ;=20
 	u8 __iomem *arb_block, *asb_block ;=20
=20
 	arb_block =3D (olympic_priv->olympic_lap + olympic_priv->arb) ;=20
@@ -1615,7 +1615,7 @@ static void olympic_asb_bh(struct net_de
 =20
 static int olympic_change_mtu(struct net_device *dev, int mtu)=20
 {
-	struct olympic_private *olympic_priv =3D (struct olympic_private *) dev->=
priv;
+	struct olympic_private *olympic_priv =3D netdev_priv(dev);
 	u16 max_mtu ;=20
=20
 	if (olympic_priv->olympic_ring_speed =3D 4)
@@ -1637,7 +1637,7 @@ static int olympic_change_mtu(struct net
 static int olympic_proc_info(char *buffer, char **start, off_t offset, int=
 length, int *eof, void *data)
 {
 	struct net_device *dev =3D (struct net_device *)data ;=20
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
 	u8 __iomem *oat =3D (olympic_priv->olympic_lap + olympic_priv->olympic_ad=
dr_table_addr) ;=20
 	u8 __iomem *opt =3D (olympic_priv->olympic_lap + olympic_priv->olympic_pa=
rms_addr) ;=20
 	int size =3D 0 ;=20
@@ -1748,7 +1748,7 @@ static int olympic_proc_info(char *buffe
 static void __devexit olympic_remove_one(struct pci_dev *pdev)=20
 {
 	struct net_device *dev =3D pci_get_drvdata(pdev) ;=20
-	struct olympic_private *olympic_priv=3D(struct olympic_private *)dev->pri=
v;
+	struct olympic_private *olympic_priv=3Dnetdev_priv(dev);
=20
 	if (olympic_priv->olympic_network_monitor) {=20
 		char proc_name[20] ;=20
diff --git a/drivers/net/tokenring/tmspci.c b/drivers/net/tokenring/tmspci.c
index 3b2f00b..aec75c9 100644
--- a/drivers/net/tokenring/tmspci.c
+++ b/drivers/net/tokenring/tmspci.c
@@ -149,7 +149,7 @@ static int __devinit tms_pci_attach(stru
 		goto err_out_irq;
 	}
=20
-	tp =3D dev->priv;
+	tp =3D netdev_priv(dev);
 	tp->setnselout =3D tms_pci_setnselout_pins;
 	=09
 	tp->sifreadb =3D tms_pci_sifreadb;
@@ -210,7 +210,7 @@ static void tms_pci_read_eeprom(struct n
 static unsigned short tms_pci_setnselout_pins(struct net_device *dev)
 {
 	unsigned short val =3D 0;
-	struct net_local *tp =3D dev->priv;
+	struct net_local *tp =3D netdev_priv(dev);
 	struct card_info *cardinfo =3D tp->tmspriv;
  =20
 	if(tp->DataRate =3D SPEED_4)

