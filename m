From: Domen Puncer <domen@coderock.org>
Date: Tue, 16 Nov 2004 19:00:51 +0000
Subject: [KJ] [patch 2/2] net/via-rhine: convert to new pio/mmio api
Message-Id: <20041116190051.GC8698@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55449776620567515=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55449776620567515==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Attempt to convert this driver to commom pio/mmio api.
Compile and run testet for pio and mmio cases.

Feedback, please.


 via-rhine.c |  285 +++++++++++++++++++++++++++++-------------------------------
 1 files changed, 140 insertions(+), 145 deletions(-)

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/via-rhine.c	2004-11-16 18:47:48.000000000 +0100
+++ a/drivers/net/via-rhine.c	2004-11-16 19:29:50.000000000 +0100
@@ -207,19 +207,6 @@ KERN_INFO DRV_NAME ".c:v1.10-LK" DRV_VER
    of the Rhine may only work correctly with I/O space accesses. */
 #ifdef CONFIG_VIA_RHINE_MMIO
 #define USE_MMIO
-#else
-#undef readb
-#undef readw
-#undef readl
-#undef writeb
-#undef writew
-#undef writel
-#define readb inb
-#define readw inw
-#define readl inl
-#define writeb outb
-#define writew outw
-#define writel outl
 #endif
 
 MODULE_AUTHOR("Donald Becker <becker@scyld.com>");
@@ -363,7 +350,7 @@ enum rhine_quirks {
  */
 
 /* Beware of PCI posted writes */
-#define IOSYNC	do { readb(dev->base_addr + StationAddr); } while (0)
+#define IOSYNC	do { ioread8(rp->base + StationAddr); } while (0)
 
 static struct pci_device_id rhine_pci_tbl[] =
 {
@@ -485,7 +472,7 @@ struct rhine_private {
 	dma_addr_t tx_bufs_dma;
 
 	struct pci_dev *pdev;
-	long pioaddr;
+	void __iomem *pioaddr;
 	struct net_device_stats stats;
 	spinlock_t lock;
 
@@ -500,6 +487,7 @@ struct rhine_private {
 	u8 tx_thresh, rx_thresh;
 
 	struct mii_if_info mii_if;
+	void __iomem *base;
 };
 
 static int  mdio_read(struct net_device *dev, int phy_id, int location);
@@ -529,14 +517,14 @@ static void rhine_shutdown (struct devic
 
 static inline u32 get_intr_status(struct net_device *dev)
 {
-	long ioaddr = dev->base_addr;
 	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *ioaddr = rp->base;
 	u32 intr_status;
 
-	intr_status = readw(ioaddr + IntrStatus);
+	intr_status = ioread16(ioaddr + IntrStatus);
 	/* On Rhine-II, Bit 3 indicates Tx descriptor write-back race. */
 	if (rp->quirks & rqStatusWBRace)
-		intr_status |= readb(ioaddr + IntrStatus2) << 16;
+		intr_status |= ioread8(ioaddr + IntrStatus2) << 16;
 	return intr_status;
 }
 
@@ -546,32 +534,32 @@ static inline u32 get_intr_status(struct
  */
 static void rhine_power_init(struct net_device *dev)
 {
-	long ioaddr = dev->base_addr;
 	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *ioaddr = rp->base;
 	u16 wolstat;
 
 	if (rp->quirks & rqWOL) {
 		/* Make sure chip is in power state D0 */
-		writeb(readb(ioaddr + StickyHW) & 0xFC, ioaddr + StickyHW);
+		iowrite8(ioread8(ioaddr + StickyHW) & 0xFC, ioaddr + StickyHW);
 
 		/* Disable "force PME-enable" */
-		writeb(0x80, ioaddr + WOLcgClr);
+		iowrite8(0x80, ioaddr + WOLcgClr);
 
 		/* Clear power-event config bits (WOL) */
-		writeb(0xFF, ioaddr + WOLcrClr);
+		iowrite8(0xFF, ioaddr + WOLcrClr);
 		/* More recent cards can manage two additional patterns */
 		if (rp->quirks & rq6patterns)
-			writeb(0x03, ioaddr + WOLcrClr1);
+			iowrite8(0x03, ioaddr + WOLcrClr1);
 
 		/* Save power-event status bits */
-		wolstat = readb(ioaddr + PwrcsrSet);
+		wolstat = ioread8(ioaddr + PwrcsrSet);
 		if (rp->quirks & rq6patterns)
-			wolstat |= (readb(ioaddr + PwrcsrSet1) & 0x03) << 8;
+			wolstat |= (ioread8(ioaddr + PwrcsrSet1) & 0x03) << 8;
 
 		/* Clear power-event status bits */
-		writeb(0xFF, ioaddr + PwrcsrClr);
+		iowrite8(0xFF, ioaddr + PwrcsrClr);
 		if (rp->quirks & rq6patterns)
-			writeb(0x03, ioaddr + PwrcsrClr1);
+			iowrite8(0x03, ioaddr + PwrcsrClr1);
 
 		if (wolstat) {
 			char *reason;
@@ -602,41 +590,41 @@ static void rhine_power_init(struct net_
 
 static void rhine_chip_reset(struct net_device *dev)
 {
-	long ioaddr = dev->base_addr;
 	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *ioaddr = rp->base;
 
-	writeb(Cmd1Reset, ioaddr + ChipCmd1);
+	iowrite8(Cmd1Reset, ioaddr + ChipCmd1);
 	IOSYNC;
 
-	if (readb(ioaddr + ChipCmd1) & Cmd1Reset) {
+	if (ioread8(ioaddr + ChipCmd1) & Cmd1Reset) {
 		printk(KERN_INFO "%s: Reset not complete yet. "
 			"Trying harder.\n", DRV_NAME);
 
 		/* Force reset */
 		if (rp->quirks & rqForceReset)
-			writeb(0x40, ioaddr + MiscCmd);
+			iowrite8(0x40, ioaddr + MiscCmd);
 
 		/* Reset can take somewhat longer (rare) */
-		RHINE_WAIT_FOR(!(readb(ioaddr + ChipCmd1) & Cmd1Reset));
+		RHINE_WAIT_FOR(!(ioread8(ioaddr + ChipCmd1) & Cmd1Reset));
 	}
 
 	if (debug > 1)
 		printk(KERN_INFO "%s: Reset %s.\n", dev->name,
-			(readb(ioaddr + ChipCmd1) & Cmd1Reset) ?
+			(ioread8(ioaddr + ChipCmd1) & Cmd1Reset) ?
 			"failed" : "succeeded");
 }
 
 #ifdef USE_MMIO
-static void enable_mmio(long pioaddr, u32 quirks)
+static void enable_mmio(void __iomem *pioaddr, u32 quirks)
 {
 	int n;
 	if (quirks & rqRhineI) {
 		/* More recent docs say that this bit is reserved ... */
-		n = inb(pioaddr + ConfigA) | 0x20;
-		outb(n, pioaddr + ConfigA);
+		n = ioread8(pioaddr + ConfigA) | 0x20;
+		iowrite8(n, pioaddr + ConfigA);
 	} else {
-		n = inb(pioaddr + ConfigD) | 0x80;
-		outb(n, pioaddr + ConfigD);
+		n = ioread8(pioaddr + ConfigD) | 0x80;
+		iowrite8(n, pioaddr + ConfigD);
 	}
 }
 #endif
@@ -645,13 +633,13 @@ static void enable_mmio(long pioaddr, u3
  * Loads bytes 0x00-0x05, 0x6E-0x6F, 0x78-0x7B from EEPROM
  * (plus 0x6C for Rhine-I/II)
  */
-static void __devinit rhine_reload_eeprom(long pioaddr, struct net_device *dev)
+static void __devinit rhine_reload_eeprom(void __iomem *pioaddr, struct net_device *dev)
 {
-	long ioaddr = dev->base_addr;
 	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *ioaddr = rp->base;
 
-	outb(0x20, pioaddr + MACRegEEcsr);
-	RHINE_WAIT_FOR(!(inb(pioaddr + MACRegEEcsr) & 0x20));
+	iowrite8(0x20, pioaddr + MACRegEEcsr);
+	RHINE_WAIT_FOR(!(ioread8(pioaddr + MACRegEEcsr) & 0x20));
 
 #ifdef USE_MMIO
 	/*
@@ -664,7 +652,7 @@ static void __devinit rhine_reload_eepro
 
 	/* Turn off EEPROM-controlled wake-up (magic packet) */
 	if (rp->quirks & rqWOL)
-		writeb(readb(ioaddr + ConfigA) & 0xFE, ioaddr + ConfigA);
+		iowrite8(ioread8(ioaddr + ConfigA) & 0xFE, ioaddr + ConfigA);
 
 }
 
@@ -677,7 +665,7 @@ static void rhine_poll(struct net_device
 }
 #endif
 
-static void rhine_hw_init(struct net_device *dev, long pioaddr)
+static void rhine_hw_init(struct net_device *dev, void __iomem *pioaddr)
 {
 	struct rhine_private *rp = netdev_priv(dev);
 
@@ -700,9 +688,10 @@ static int __devinit rhine_init_one(stru
 	int i, rc;
 	u8 pci_rev;
 	u32 quirks;
-	long pioaddr;
+	long piostart;
 	long memaddr;
-	long ioaddr;
+	void __iomem *pioaddr;
+	void __iomem *ioaddr;
 	int io_size, phy_id;
 	const char *name;
 
@@ -760,8 +749,9 @@ static int __devinit rhine_init_one(stru
 		goto err_out;
 	}
 
-	pioaddr = pci_resource_start(pdev, 0);
+	piostart = pci_resource_start(pdev, 0);
 	memaddr = pci_resource_start(pdev, 1);
+	pioaddr = ioport_map(piostart, io_size);
 
 	pci_set_master(pdev);
 
@@ -769,7 +759,7 @@ static int __devinit rhine_init_one(stru
 	if (!dev) {
 		rc = -ENOMEM;
 		printk(KERN_ERR "alloc_etherdev failed\n");
-		goto err_out;
+		goto err_out_pio_unmap;
 	}
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
@@ -786,7 +776,7 @@ static int __devinit rhine_init_one(stru
 #ifdef USE_MMIO
 	enable_mmio(pioaddr, quirks);
 
-	ioaddr = (long) ioremap(memaddr, io_size);
+	ioaddr = ioremap(memaddr, io_size);
 	if (!ioaddr) {
 		rc = -EIO;
 		printk(KERN_ERR "ioremap failed for device %s, region 0x%X "
@@ -798,8 +788,8 @@ static int __devinit rhine_init_one(stru
 	i = 0;
 	while (mmio_verify_registers[i]) {
 		int reg = mmio_verify_registers[i++];
-		unsigned char a = inb(pioaddr+reg);
-		unsigned char b = readb(ioaddr+reg);
+		unsigned char a = ioread8(pioaddr+reg);
+		unsigned char b = ioread8(ioaddr+reg);
 		if (a != b) {
 			rc = -EIO;
 			printk(KERN_ERR "MMIO do not match PIO [%02x] "
@@ -811,14 +801,15 @@ static int __devinit rhine_init_one(stru
 	ioaddr = pioaddr;
 #endif /* USE_MMIO */
 
-	dev->base_addr = ioaddr;
+	dev->base_addr = (unsigned long)ioaddr;
+	rp->base = ioaddr;
 
 	/* Get chip registers into a sane state */
 	rhine_power_init(dev);
 	rhine_hw_init(dev, pioaddr);
 
 	for (i = 0; i < 6; i++)
-		dev->dev_addr[i] = readb(ioaddr + StationAddr + i);
+		dev->dev_addr[i] = ioread8(ioaddr + StationAddr + i);
 
 	if (!is_valid_ether_addr(dev->dev_addr)) {
 		rc = -EIO;
@@ -828,7 +819,7 @@ static int __devinit rhine_init_one(stru
 
 	/* For Rhine-I/II, phy_id is loaded from EEPROM */
 	if (!phy_id)
-		phy_id = readb(ioaddr + 0x6C);
+		phy_id = ioread8(ioaddr + 0x6C);
 
 	dev->irq = pdev->irq;
 
@@ -865,7 +856,7 @@ static int __devinit rhine_init_one(stru
 #ifdef USE_MMIO
 		memaddr
 #else
-		ioaddr
+		piostart
 #endif
 		 );
 
@@ -902,12 +893,14 @@ static int __devinit rhine_init_one(stru
 
 err_out_unmap:
 #ifdef USE_MMIO
-	iounmap((void *)ioaddr);
+	iounmap(ioaddr);
 err_out_free_res:
 #endif
 	pci_release_regions(pdev);
 err_out_free_netdev:
 	free_netdev(dev);
+err_out_pio_unmap:
+	ioport_unmap(pioaddr);
 err_out:
 	return rc;
 }
@@ -1071,102 +1064,102 @@ static void free_tbufs(struct net_device
 static void rhine_check_media(struct net_device *dev, unsigned int init_media)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 
 	mii_check_media(&rp->mii_if, debug, init_media);
 
 	if (rp->mii_if.full_duplex)
-	    writeb(readb(ioaddr + ChipCmd1) | Cmd1FDuplex,
+	    iowrite8(ioread8(ioaddr + ChipCmd1) | Cmd1FDuplex,
 		   ioaddr + ChipCmd1);
 	else
-	    writeb(readb(ioaddr + ChipCmd1) & ~Cmd1FDuplex,
+	    iowrite8(ioread8(ioaddr + ChipCmd1) & ~Cmd1FDuplex,
 		   ioaddr + ChipCmd1);
 }
 
 static void init_registers(struct net_device *dev)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 	int i;
 
 	for (i = 0; i < 6; i++)
-		writeb(dev->dev_addr[i], ioaddr + StationAddr + i);
+		iowrite8(dev->dev_addr[i], ioaddr + StationAddr + i);
 
 	/* Initialize other registers. */
-	writew(0x0006, ioaddr + PCIBusConfig);	/* Tune configuration??? */
+	iowrite16(0x0006, ioaddr + PCIBusConfig); /* Tune configuration??? */
 	/* Configure initial FIFO thresholds. */
-	writeb(0x20, ioaddr + TxConfig);
+	iowrite8(0x20, ioaddr + TxConfig);
 	rp->tx_thresh = 0x20;
 	rp->rx_thresh = 0x60;		/* Written in rhine_set_rx_mode(). */
 
-	writel(rp->rx_ring_dma, ioaddr + RxRingPtr);
-	writel(rp->tx_ring_dma, ioaddr + TxRingPtr);
+	iowrite32(rp->rx_ring_dma, ioaddr + RxRingPtr);
+	iowrite32(rp->tx_ring_dma, ioaddr + TxRingPtr);
 
 	rhine_set_rx_mode(dev);
 
 	/* Enable interrupts by setting the interrupt mask. */
-	writew(IntrRxDone | IntrRxErr | IntrRxEmpty| IntrRxOverflow |
+	iowrite16(IntrRxDone | IntrRxErr | IntrRxEmpty| IntrRxOverflow |
 	       IntrRxDropped | IntrRxNoBuf | IntrTxAborted |
 	       IntrTxDone | IntrTxError | IntrTxUnderrun |
 	       IntrPCIErr | IntrStatsMax | IntrLinkChange,
 	       ioaddr + IntrEnable);
 
-	writew(CmdStart | CmdTxOn | CmdRxOn | (Cmd1NoTxPoll << 8),
+	iowrite16(CmdStart | CmdTxOn | CmdRxOn | (Cmd1NoTxPoll << 8),
 	       ioaddr + ChipCmd);
 	rhine_check_media(dev, 1);
 }
 
 /* Enable MII link status auto-polling (required for IntrLinkChange) */
-static void rhine_enable_linkmon(long ioaddr)
+static void rhine_enable_linkmon(void __iomem *ioaddr)
 {
-	writeb(0, ioaddr + MIICmd);
-	writeb(MII_BMSR, ioaddr + MIIRegAddr);
-	writeb(0x80, ioaddr + MIICmd);
+	iowrite8(0, ioaddr + MIICmd);
+	iowrite8(MII_BMSR, ioaddr + MIIRegAddr);
+	iowrite8(0x80, ioaddr + MIICmd);
 
-	RHINE_WAIT_FOR((readb(ioaddr + MIIRegAddr) & 0x20));
+	RHINE_WAIT_FOR((ioread8(ioaddr + MIIRegAddr) & 0x20));
 
-	writeb(MII_BMSR | 0x40, ioaddr + MIIRegAddr);
+	iowrite8(MII_BMSR | 0x40, ioaddr + MIIRegAddr);
 }
 
 /* Disable MII link status auto-polling (required for MDIO access) */
-static void rhine_disable_linkmon(long ioaddr, u32 quirks)
+static void rhine_disable_linkmon(void __iomem *ioaddr, u32 quirks)
 {
-	writeb(0, ioaddr + MIICmd);
+	iowrite8(0, ioaddr + MIICmd);
 
 	if (quirks & rqRhineI) {
-		writeb(0x01, ioaddr + MIIRegAddr);	// MII_BMSR
+		iowrite8(0x01, ioaddr + MIIRegAddr);	// MII_BMSR
 
 		/* Can be called from ISR. Evil. */
 		mdelay(1);
 
 		/* 0x80 must be set immediately before turning it off */
-		writeb(0x80, ioaddr + MIICmd);
+		iowrite8(0x80, ioaddr + MIICmd);
 
-		RHINE_WAIT_FOR(readb(ioaddr + MIIRegAddr) & 0x20);
+		RHINE_WAIT_FOR(ioread8(ioaddr + MIIRegAddr) & 0x20);
 
 		/* Heh. Now clear 0x80 again. */
-		writeb(0, ioaddr + MIICmd);
+		iowrite8(0, ioaddr + MIICmd);
 	}
 	else
-		RHINE_WAIT_FOR(readb(ioaddr + MIIRegAddr) & 0x80);
+		RHINE_WAIT_FOR(ioread8(ioaddr + MIIRegAddr) & 0x80);
 }
 
 /* Read and write over the MII Management Data I/O (MDIO) interface. */
 
 static int mdio_read(struct net_device *dev, int phy_id, int regnum)
 {
-	long ioaddr = dev->base_addr;
 	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *ioaddr = rp->base;
 	int result;
 
 	rhine_disable_linkmon(ioaddr, rp->quirks);
 
 	/* rhine_disable_linkmon already cleared MIICmd */
-	writeb(phy_id, ioaddr + MIIPhyAddr);
-	writeb(regnum, ioaddr + MIIRegAddr);
-	writeb(0x40, ioaddr + MIICmd);		/* Trigger read */
-	RHINE_WAIT_FOR(!(readb(ioaddr + MIICmd) & 0x40));
-	result = readw(ioaddr + MIIData);
+	iowrite8(phy_id, ioaddr + MIIPhyAddr);
+	iowrite8(regnum, ioaddr + MIIRegAddr);
+	iowrite8(0x40, ioaddr + MIICmd);		/* Trigger read */
+	RHINE_WAIT_FOR(!(ioread8(ioaddr + MIICmd) & 0x40));
+	result = ioread16(ioaddr + MIIData);
 
 	rhine_enable_linkmon(ioaddr);
 	return result;
@@ -1175,16 +1168,16 @@ static int mdio_read(struct net_device *
 static void mdio_write(struct net_device *dev, int phy_id, int regnum, int value)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 
 	rhine_disable_linkmon(ioaddr, rp->quirks);
 
 	/* rhine_disable_linkmon already cleared MIICmd */
-	writeb(phy_id, ioaddr + MIIPhyAddr);
-	writeb(regnum, ioaddr + MIIRegAddr);
-	writew(value, ioaddr + MIIData);
-	writeb(0x20, ioaddr + MIICmd);		/* Trigger write */
-	RHINE_WAIT_FOR(!(readb(ioaddr + MIICmd) & 0x20));
+	iowrite8(phy_id, ioaddr + MIIPhyAddr);
+	iowrite8(regnum, ioaddr + MIIRegAddr);
+	iowrite16(value, ioaddr + MIIData);
+	iowrite8(0x20, ioaddr + MIICmd);		/* Trigger write */
+	RHINE_WAIT_FOR(!(ioread8(ioaddr + MIICmd) & 0x20));
 
 	rhine_enable_linkmon(ioaddr);
 }
@@ -1192,7 +1185,7 @@ static void mdio_write(struct net_device
 static int rhine_open(struct net_device *dev)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 	int rc;
 
 	rc = request_irq(rp->pdev->irq, &rhine_interrupt, SA_SHIRQ, dev->name,
@@ -1214,7 +1207,7 @@ static int rhine_open(struct net_device 
 	if (debug > 2)
 		printk(KERN_DEBUG "%s: Done rhine_open(), status %4.4x "
 		       "MII status: %4.4x.\n",
-		       dev->name, readw(ioaddr + ChipCmd),
+		       dev->name, ioread16(ioaddr + ChipCmd),
 		       mdio_read(dev, rp->mii_if.phy_id, MII_BMSR));
 
 	netif_start_queue(dev);
@@ -1225,11 +1218,11 @@ static int rhine_open(struct net_device 
 static void rhine_tx_timeout(struct net_device *dev)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 
 	printk(KERN_WARNING "%s: Transmit timed out, status %4.4x, PHY status "
 	       "%4.4x, resetting...\n",
-	       dev->name, readw(ioaddr + IntrStatus),
+	       dev->name, ioread16(ioaddr + IntrStatus),
 	       mdio_read(dev, rp->mii_if.phy_id, MII_BMSR));
 
 	/* protect against concurrent rx interrupts */
@@ -1258,7 +1251,7 @@ static void rhine_tx_timeout(struct net_
 static int rhine_start_tx(struct sk_buff *skb, struct net_device *dev)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 	unsigned entry;
 
 	/* Caution: the write order is important here, set the field
@@ -1311,7 +1304,7 @@ static int rhine_start_tx(struct sk_buff
 	/* Non-x86 Todo: explicitly flush cache lines here. */
 
 	/* Wake the potentially-idle transmit channel */
-	writeb(readb(ioaddr + ChipCmd1) | Cmd1TxDemand,
+	iowrite8(ioread8(ioaddr + ChipCmd1) | Cmd1TxDemand,
 	       ioaddr + ChipCmd1);
 	IOSYNC;
 
@@ -1334,20 +1327,19 @@ static int rhine_start_tx(struct sk_buff
 static irqreturn_t rhine_interrupt(int irq, void *dev_instance, struct pt_regs *rgs)
 {
 	struct net_device *dev = dev_instance;
-	long ioaddr;
+	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *ioaddr = rp->base;
 	u32 intr_status;
 	int boguscnt = max_interrupt_work;
 	int handled = 0;
 
-	ioaddr = dev->base_addr;
-
 	while ((intr_status = get_intr_status(dev))) {
 		handled = 1;
 
 		/* Acknowledge all of the current interrupt sources ASAP. */
 		if (intr_status & IntrTxDescRace)
-			writeb(0x08, ioaddr + IntrStatus2);
-		writew(intr_status & 0xffff, ioaddr + IntrStatus);
+			iowrite8(0x08, ioaddr + IntrStatus2);
+		iowrite16(intr_status & 0xffff, ioaddr + IntrStatus);
 		IOSYNC;
 
 		if (debug > 4)
@@ -1361,9 +1353,9 @@ static irqreturn_t rhine_interrupt(int i
 		if (intr_status & (IntrTxErrSummary | IntrTxDone)) {
 			if (intr_status & IntrTxErrSummary) {
 				/* Avoid scavenging before Tx engine turned off */
-				RHINE_WAIT_FOR(!(readb(ioaddr+ChipCmd) & CmdTxOn));
+				RHINE_WAIT_FOR(!(ioread8(ioaddr+ChipCmd) & CmdTxOn));
 				if (debug > 2 &&
-				    readb(ioaddr+ChipCmd) & CmdTxOn)
+				    ioread8(ioaddr+ChipCmd) & CmdTxOn)
 					printk(KERN_WARNING "%s: "
 					       "rhine_interrupt() Tx engine"
 					       "still on.\n", dev->name);
@@ -1387,7 +1379,7 @@ static irqreturn_t rhine_interrupt(int i
 
 	if (debug > 3)
 		printk(KERN_DEBUG "%s: exiting interrupt, status=%8.8x.\n",
-		       dev->name, readw(ioaddr + IntrStatus));
+		       dev->name, ioread16(ioaddr + IntrStatus));
 	return IRQ_RETVAL(handled);
 }
 
@@ -1582,16 +1574,16 @@ static void rhine_rx(struct net_device *
  * these, for others the counters are set to 1 when written to and
  * instead cleared when read. So we clear them both ways ...
  */
-static inline void clear_tally_counters(const long ioaddr)
+static inline void clear_tally_counters(void __iomem *ioaddr)
 {
-	writel(0, ioaddr + RxMissed);
-	readw(ioaddr + RxCRCErrs);
-	readw(ioaddr + RxMissed);
+	iowrite32(0, ioaddr + RxMissed);
+	ioread16(ioaddr + RxCRCErrs);
+	ioread16(ioaddr + RxMissed);
 }
 
 static void rhine_restart_tx(struct net_device *dev) {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 	int entry = rp->dirty_tx % TX_RING_SIZE;
 	u32 intr_status;
 
@@ -1604,12 +1596,12 @@ static void rhine_restart_tx(struct net_
 	if ((intr_status & IntrTxErrSummary) == 0) {
 
 		/* We know better than the chip where it should continue. */
-		writel(rp->tx_ring_dma + entry * sizeof(struct tx_desc),
+		iowrite32(rp->tx_ring_dma + entry * sizeof(struct tx_desc),
 		       ioaddr + TxRingPtr);
 
-		writeb(readb(ioaddr + ChipCmd) | CmdTxOn,
+		iowrite8(ioread8(ioaddr + ChipCmd) | CmdTxOn,
 		       ioaddr + ChipCmd);
-		writeb(readb(ioaddr + ChipCmd1) | Cmd1TxDemand,
+		iowrite8(ioread8(ioaddr + ChipCmd1) | Cmd1TxDemand,
 		       ioaddr + ChipCmd1);
 		IOSYNC;
 	}
@@ -1626,15 +1618,15 @@ static void rhine_restart_tx(struct net_
 static void rhine_error(struct net_device *dev, int intr_status)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 
 	spin_lock(&rp->lock);
 
 	if (intr_status & IntrLinkChange)
 		rhine_check_media(dev, 0);
 	if (intr_status & IntrStatsMax) {
-		rp->stats.rx_crc_errors += readw(ioaddr + RxCRCErrs);
-		rp->stats.rx_missed_errors += readw(ioaddr + RxMissed);
+		rp->stats.rx_crc_errors += ioread16(ioaddr + RxCRCErrs);
+		rp->stats.rx_missed_errors += ioread16(ioaddr + RxMissed);
 		clear_tally_counters(ioaddr);
 	}
 	if (intr_status & IntrTxAborted) {
@@ -1644,7 +1636,7 @@ static void rhine_error(struct net_devic
 	}
 	if (intr_status & IntrTxUnderrun) {
 		if (rp->tx_thresh < 0xE0)
-			writeb(rp->tx_thresh += 0x20, ioaddr + TxConfig);
+			iowrite8(rp->tx_thresh += 0x20, ioaddr + TxConfig);
 		if (debug > 1)
 			printk(KERN_INFO "%s: Transmitter underrun, Tx "
 			       "threshold now %2.2x.\n",
@@ -1659,7 +1651,7 @@ static void rhine_error(struct net_devic
 	    (intr_status & (IntrTxAborted |
 	     IntrTxUnderrun | IntrTxDescRace)) == 0) {
 		if (rp->tx_thresh < 0xE0) {
-			writeb(rp->tx_thresh += 0x20, ioaddr + TxConfig);
+			iowrite8(rp->tx_thresh += 0x20, ioaddr + TxConfig);
 		}
 		if (debug > 1)
 			printk(KERN_INFO "%s: Unspecified error. Tx "
@@ -1684,12 +1676,12 @@ static void rhine_error(struct net_devic
 static struct net_device_stats *rhine_get_stats(struct net_device *dev)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 	unsigned long flags;
 
 	spin_lock_irqsave(&rp->lock, flags);
-	rp->stats.rx_crc_errors += readw(ioaddr + RxCRCErrs);
-	rp->stats.rx_missed_errors += readw(ioaddr + RxMissed);
+	rp->stats.rx_crc_errors += ioread16(ioaddr + RxCRCErrs);
+	rp->stats.rx_missed_errors += ioread16(ioaddr + RxMissed);
 	clear_tally_counters(ioaddr);
 	spin_unlock_irqrestore(&rp->lock, flags);
 
@@ -1699,7 +1691,7 @@ static struct net_device_stats *rhine_ge
 static void rhine_set_rx_mode(struct net_device *dev)
 {
 	struct rhine_private *rp = netdev_priv(dev);
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 	u32 mc_filter[2];	/* Multicast hash filter */
 	u8 rx_mode;		/* Note: 0x02=accept runt, 0x01=accept errs */
 
@@ -1708,13 +1700,13 @@ static void rhine_set_rx_mode(struct net
 		printk(KERN_NOTICE "%s: Promiscuous mode enabled.\n",
 		       dev->name);
 		rx_mode = 0x1C;
-		writel(0xffffffff, ioaddr + MulticastFilter0);
-		writel(0xffffffff, ioaddr + MulticastFilter1);
+		iowrite32(0xffffffff, ioaddr + MulticastFilter0);
+		iowrite32(0xffffffff, ioaddr + MulticastFilter1);
 	} else if ((dev->mc_count > multicast_filter_limit)
 		   || (dev->flags & IFF_ALLMULTI)) {
 		/* Too many to match, or accept all multicasts. */
-		writel(0xffffffff, ioaddr + MulticastFilter0);
-		writel(0xffffffff, ioaddr + MulticastFilter1);
+		iowrite32(0xffffffff, ioaddr + MulticastFilter0);
+		iowrite32(0xffffffff, ioaddr + MulticastFilter1);
 		rx_mode = 0x0C;
 	} else {
 		struct dev_mc_list *mclist;
@@ -1726,11 +1718,11 @@ static void rhine_set_rx_mode(struct net
 
 			mc_filter[bit_nr >> 5] |= 1 << (bit_nr & 31);
 		}
-		writel(mc_filter[0], ioaddr + MulticastFilter0);
-		writel(mc_filter[1], ioaddr + MulticastFilter1);
+		iowrite32(mc_filter[0], ioaddr + MulticastFilter0);
+		iowrite32(mc_filter[1], ioaddr + MulticastFilter1);
 		rx_mode = 0x0C;
 	}
-	writeb(rp->rx_thresh | rx_mode, ioaddr + RxConfig);
+	iowrite8(rp->rx_thresh | rx_mode, ioaddr + RxConfig);
 }
 
 static void netdev_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
@@ -1854,8 +1846,8 @@ static int netdev_ioctl(struct net_devic
 
 static int rhine_close(struct net_device *dev)
 {
-	long ioaddr = dev->base_addr;
 	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *ioaddr = rp->base;
 
 	spin_lock_irq(&rp->lock);
 
@@ -1864,16 +1856,16 @@ static int rhine_close(struct net_device
 	if (debug > 1)
 		printk(KERN_DEBUG "%s: Shutting down ethercard, "
 		       "status was %4.4x.\n",
-		       dev->name, readw(ioaddr + ChipCmd));
+		       dev->name, ioread16(ioaddr + ChipCmd));
 
 	/* Switch to loopback mode to avoid hardware races. */
-	writeb(rp->tx_thresh | 0x02, ioaddr + TxConfig);
+	iowrite8(rp->tx_thresh | 0x02, ioaddr + TxConfig);
 
 	/* Disable interrupts by clearing the interrupt mask. */
-	writew(0x0000, ioaddr + IntrEnable);
+	iowrite16(0x0000, ioaddr + IntrEnable);
 
 	/* Stop the chip's Tx and Rx processes. */
-	writew(CmdStop, ioaddr + ChipCmd);
+	iowrite16(CmdStop, ioaddr + ChipCmd);
 
 	spin_unlock_irq(&rp->lock);
 
@@ -1889,16 +1881,19 @@ static int rhine_close(struct net_device
 static void __devexit rhine_remove_one(struct pci_dev *pdev)
 {
 	struct net_device *dev = pci_get_drvdata(pdev);
+	struct rhine_private *rp = netdev_priv(dev);
+	void __iomem *pioaddr = rp->pioaddr;
 
 	unregister_netdev(dev);
 
 	pci_release_regions(pdev);
 
 #ifdef USE_MMIO
-	iounmap((char *)(dev->base_addr));
+	iounmap(rp->base);
 #endif
 
 	free_netdev(dev);
+	ioport_unmap(pioaddr);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
@@ -1909,32 +1904,32 @@ static void rhine_shutdown (struct devic
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct rhine_private *rp = netdev_priv(dev);
 
-	long ioaddr = dev->base_addr;
+	void __iomem *ioaddr = rp->base;
 
 	rhine_power_init(dev);
 
 	/* Make sure we use pattern 0, 1 and not 4, 5 */
 	if (rp->quirks & rq6patterns)
-		writeb(0x04, ioaddr + 0xA7);
+		iowrite8(0x04, ioaddr + 0xA7);
 
 	if (rp->wolopts & WAKE_MAGIC)
-		writeb(WOLmagic, ioaddr + WOLcrSet);
+		iowrite8(WOLmagic, ioaddr + WOLcrSet);
 
 	if (rp->wolopts & (WAKE_BCAST|WAKE_MCAST))
-		writeb(WOLbmcast, ioaddr + WOLcgSet);
+		iowrite8(WOLbmcast, ioaddr + WOLcgSet);
 
 	if (rp->wolopts & WAKE_PHY)
-		writeb(WOLlnkon | WOLlnkoff, ioaddr + WOLcrSet);
+		iowrite8(WOLlnkon | WOLlnkoff, ioaddr + WOLcrSet);
 
 	if (rp->wolopts & WAKE_UCAST)
-		writeb(WOLucast, ioaddr + WOLcrSet);
+		iowrite8(WOLucast, ioaddr + WOLcrSet);
 
 	/* Enable legacy WOL (for old motherboards) */
-	writeb(0x01, ioaddr + PwcfgSet);
-	writeb(readb(ioaddr + StickyHW) | 0x04, ioaddr + StickyHW);
+	iowrite8(0x01, ioaddr + PwcfgSet);
+	iowrite8(ioread8(ioaddr + StickyHW) | 0x04, ioaddr + StickyHW);
 
 	/* Hit power state D3 (sleep) */
-	writeb(readb(ioaddr + StickyHW) | 0x03, ioaddr + StickyHW);
+	iowrite8(ioread8(ioaddr + StickyHW) | 0x03, ioaddr + StickyHW);
 
 	/* TODO: Check use of pci_enable_wake() */
 

--===============55449776620567515==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55449776620567515==--
