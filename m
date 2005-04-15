From: Domen Puncer <domen@coderock.org>
Date: Fri, 15 Apr 2005 20:58:32 +0000
Subject: [KJ] [patch] net/8139too: use iomap interface
Message-Id: <20050415205832.GA3880@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26099810209945751=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26099810209945751==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert to iomap and add __iomem annotations.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/8139too.c	2005-04-15 20:40:28.000000000 +0200
+++ a/drivers/net/8139too.c	2005-04-15 22:42:59.000000000 +0200
@@ -569,7 +569,7 @@ struct rtl_extra_stats {
 };
 
 struct rtl8139_private {
-	void *mmio_addr;
+	void __iomem *ioaddr;
 	int drv_flags;
 	struct pci_dev *pci_dev;
 	u32 msg_enable;
@@ -614,7 +614,7 @@ MODULE_PARM_DESC (multicast_filter_limit
 MODULE_PARM_DESC (media, "8139too: Bits 4+9: force full duplex, bit 5: 100Mbps");
 MODULE_PARM_DESC (full_duplex, "8139too: Force full duplex for board(s) (1)");
 
-static int read_eeprom (void *ioaddr, int location, int addr_len);
+static int read_eeprom (void __iomem *ioaddr, int location, int addr_len);
 static int rtl8139_open (struct net_device *dev);
 static int mdio_read (struct net_device *dev, int phy_id, int location);
 static void mdio_write (struct net_device *dev, int phy_id, int location,
@@ -640,44 +640,29 @@ static struct ethtool_ops rtl8139_ethtoo
 
 #ifdef USE_IO_OPS
 
-#define RTL_R8(reg)		inb (((unsigned long)ioaddr) + (reg))
-#define RTL_R16(reg)		inw (((unsigned long)ioaddr) + (reg))
-#define RTL_R32(reg)		((unsigned long) inl (((unsigned long)ioaddr) + (reg)))
-#define RTL_W8(reg, val8)	outb ((val8), ((unsigned long)ioaddr) + (reg))
-#define RTL_W16(reg, val16)	outw ((val16), ((unsigned long)ioaddr) + (reg))
-#define RTL_W32(reg, val32)	outl ((val32), ((unsigned long)ioaddr) + (reg))
+#define RTL_W8(reg, val8)	iowrite8((val8), ioaddr + (reg))
+#define RTL_W16(reg, val16)	iowrite16((val16), ioaddr + (reg))
+#define RTL_W32(reg, val32)	iowrite32((val32), ioaddr + (reg))
 #define RTL_W8_F		RTL_W8
 #define RTL_W16_F		RTL_W16
 #define RTL_W32_F		RTL_W32
-#undef readb
-#undef readw
-#undef readl
-#undef writeb
-#undef writew
-#undef writel
-#define readb(addr) inb((unsigned long)(addr))
-#define readw(addr) inw((unsigned long)(addr))
-#define readl(addr) inl((unsigned long)(addr))
-#define writeb(val,addr) outb((val),(unsigned long)(addr))
-#define writew(val,addr) outw((val),(unsigned long)(addr))
-#define writel(val,addr) outl((val),(unsigned long)(addr))
 
-#else
+#else /* USE_IO_OPS */
 
 /* write MMIO register, with flush */
 /* Flush avoids rtl8139 bug w/ posted MMIO writes */
-#define RTL_W8_F(reg, val8)	do { writeb ((val8), ioaddr + (reg)); readb (ioaddr + (reg)); } while (0)
-#define RTL_W16_F(reg, val16)	do { writew ((val16), ioaddr + (reg)); readw (ioaddr + (reg)); } while (0)
-#define RTL_W32_F(reg, val32)	do { writel ((val32), ioaddr + (reg)); readl (ioaddr + (reg)); } while (0)
+#define RTL_W8_F(reg, val8)	do { iowrite8((val8), ioaddr + (reg)); ioread8(ioaddr + (reg)); } while (0)
+#define RTL_W16_F(reg, val16)	do { iowrite16((val16), ioaddr + (reg)); ioread16(ioaddr + (reg)); } while (0)
+#define RTL_W32_F(reg, val32)	do { iowrite32((val32), ioaddr + (reg)); ioread32(ioaddr + (reg)); } while (0)
 
 
 #define MMIO_FLUSH_AUDIT_COMPLETE 1
 #if MMIO_FLUSH_AUDIT_COMPLETE
 
 /* write MMIO register */
-#define RTL_W8(reg, val8)	writeb ((val8), ioaddr + (reg))
-#define RTL_W16(reg, val16)	writew ((val16), ioaddr + (reg))
-#define RTL_W32(reg, val32)	writel ((val32), ioaddr + (reg))
+#define RTL_W8(reg, val8)	iowrite8((val8), ioaddr + (reg))
+#define RTL_W16(reg, val16)	iowrite16((val16), ioaddr + (reg))
+#define RTL_W32(reg, val32)	iowrite32((val32), ioaddr + (reg))
 
 #else
 
@@ -687,13 +672,13 @@ static struct ethtool_ops rtl8139_ethtoo
 #define RTL_W32		RTL_W32_F
 
 #endif /* MMIO_FLUSH_AUDIT_COMPLETE */
+#endif /* USE_IO_OPS */
 
-/* read MMIO register */
-#define RTL_R8(reg)		readb (ioaddr + (reg))
-#define RTL_R16(reg)		readw (ioaddr + (reg))
-#define RTL_R32(reg)		((unsigned long) readl (ioaddr + (reg)))
+/* read register */
+#define RTL_R8(reg)		ioread8(ioaddr + (reg))
+#define RTL_R16(reg)		ioread16(ioaddr + (reg))
+#define RTL_R32(reg)		ioread32(ioaddr + (reg))
 
-#endif /* USE_IO_OPS */
 
 
 static const u16 rtl8139_intr_mask =
@@ -740,9 +725,11 @@ static void __rtl8139_cleanup_dev (struc
 	assert (tp->pci_dev != NULL);
 	pdev = tp->pci_dev;
 
-#ifndef USE_IO_OPS
-	if (tp->mmio_addr)
-		iounmap (tp->mmio_addr);
+	if (tp->ioaddr)
+#ifdef USE_IO_OPS
+		ioport_unmap(tp->ioaddr);
+#else
+		iounmap (tp->ioaddr);
 #endif /* !USE_IO_OPS */
 
 	/* it's ok to call this even if we have no regions to free */
@@ -753,7 +740,7 @@ static void __rtl8139_cleanup_dev (struc
 }
 
 
-static void rtl8139_chip_reset (void *ioaddr)
+static void rtl8139_chip_reset (void __iomem *ioaddr)
 {
 	int i;
 
@@ -773,7 +760,7 @@ static void rtl8139_chip_reset (void *io
 static int __devinit rtl8139_init_board (struct pci_dev *pdev,
 					 struct net_device **dev_out)
 {
-	void *ioaddr;
+	void __iomem *ioaddr;
 	struct net_device *dev;
 	struct rtl8139_private *tp;
 	u8 tmp8;
@@ -855,9 +842,12 @@ static int __devinit rtl8139_init_board 
 	pci_set_master (pdev);
 
 #ifdef USE_IO_OPS
-	ioaddr = (void *) pio_start;
-	dev->base_addr = pio_start;
-	tp->mmio_addr = ioaddr;
+	ioaddr = ioport_map(pio_start, pio_len);
+	if (ioaddr == NULL) {
+		printk(KERN_ERR PFX "%s: cannot remap PIO, aborting\n", pci_name(pdev));
+		rc = -EIO;
+		goto err_out;
+	}
 	tp->regs_len = pio_len;
 #else
 	/* ioremap MMIO region */
@@ -867,10 +857,10 @@ static int __devinit rtl8139_init_board 
 		rc = -EIO;
 		goto err_out;
 	}
-	dev->base_addr = (long) ioaddr;
-	tp->mmio_addr = ioaddr;
 	tp->regs_len = mmio_len;
 #endif /* USE_IO_OPS */
+	dev->base_addr = (unsigned long) ioaddr;
+	tp->ioaddr = ioaddr;
 
 	/* Bring old chips out of low-power mode. */
 	RTL_W8 (HltClk, 'R');
@@ -894,7 +884,7 @@ static int __devinit rtl8139_init_board 
 	/* if unknown chip, assume array element #0, original RTL-8139 in this case */
 	printk (KERN_DEBUG PFX "%s: unknown chip version, assuming RTL-8139\n",
 		pci_name(pdev));
-	printk (KERN_DEBUG PFX "%s: TxConfig = 0x%lx\n", pci_name(pdev), RTL_R32 (TxConfig));
+	printk (KERN_DEBUG PFX "%s: TxConfig = 0x%x\n", pci_name(pdev), RTL_R32 (TxConfig));
 	tp->chipset = 0;
 
 match:
@@ -947,7 +937,7 @@ static int __devinit rtl8139_init_one (s
 	struct net_device *dev = NULL;
 	struct rtl8139_private *tp;
 	int i, addr_len, option;
-	void *ioaddr;
+	void __iomem *ioaddr;
 	static int board_idx = -1;
 	u8 pci_rev;
 
@@ -983,7 +973,7 @@ static int __devinit rtl8139_init_one (s
 	assert (dev != NULL);
 	tp = netdev_priv(dev);
 
-	ioaddr = tp->mmio_addr;
+	ioaddr = tp->ioaddr;
 	assert (ioaddr != NULL);
 
 	addr_len = read_eeprom (ioaddr, 0, 8) == 0x8129 ? 8 : 6;
@@ -1020,7 +1010,7 @@ static int __devinit rtl8139_init_one (s
 
 	/* note: tp->chipset set in rtl8139_init_board */
 	tp->drv_flags = board_info[ent->driver_data].hw_flags;
-	tp->mmio_addr = ioaddr;
+	tp->ioaddr = ioaddr;
 	tp->msg_enable =
 		(debug < 0 ? RTL8139_DEF_MSG_ENABLE : ((1 << debug) - 1));
 	spin_lock_init (&tp->lock);
@@ -1147,47 +1137,47 @@ static void __devexit rtl8139_remove_one
    No extra delay is needed with 33Mhz PCI, but 66Mhz may change this.
  */
 
-#define eeprom_delay()	readl(ee_addr)
+#define eeprom_delay()	ioread32(ee_addr)
 
 /* The EEPROM commands include the alway-set leading bit. */
 #define EE_WRITE_CMD	(5)
 #define EE_READ_CMD		(6)
 #define EE_ERASE_CMD	(7)
 
-static int __devinit read_eeprom (void *ioaddr, int location, int addr_len)
+static int __devinit read_eeprom (void __iomem *ioaddr, int location, int addr_len)
 {
 	int i;
 	unsigned retval = 0;
-	void *ee_addr = ioaddr + Cfg9346;
+	void __iomem *ee_addr = ioaddr + Cfg9346;
 	int read_cmd = location | (EE_READ_CMD << addr_len);
 
-	writeb (EE_ENB & ~EE_CS, ee_addr);
-	writeb (EE_ENB, ee_addr);
+	iowrite8 (EE_ENB & ~EE_CS, ee_addr);
+	iowrite8 (EE_ENB, ee_addr);
 	eeprom_delay ();
 
 	/* Shift the read command bits out. */
 	for (i = 4 + addr_len; i >= 0; i--) {
 		int dataval = (read_cmd & (1 << i)) ? EE_DATA_WRITE : 0;
-		writeb (EE_ENB | dataval, ee_addr);
+		iowrite8 (EE_ENB | dataval, ee_addr);
 		eeprom_delay ();
-		writeb (EE_ENB | dataval | EE_SHIFT_CLK, ee_addr);
+		iowrite8 (EE_ENB | dataval | EE_SHIFT_CLK, ee_addr);
 		eeprom_delay ();
 	}
-	writeb (EE_ENB, ee_addr);
+	iowrite8 (EE_ENB, ee_addr);
 	eeprom_delay ();
 
 	for (i = 16; i > 0; i--) {
-		writeb (EE_ENB | EE_SHIFT_CLK, ee_addr);
+		iowrite8 (EE_ENB | EE_SHIFT_CLK, ee_addr);
 		eeprom_delay ();
 		retval =
-		    (retval << 1) | ((readb (ee_addr) & EE_DATA_READ) ? 1 :
+		    (retval << 1) | ((ioread8 (ee_addr) & EE_DATA_READ) ? 1 :
 				     0);
-		writeb (EE_ENB, ee_addr);
+		iowrite8 (EE_ENB, ee_addr);
 		eeprom_delay ();
 	}
 
 	/* Terminate the EEPROM access. */
-	writeb (~EE_CS, ee_addr);
+	iowrite8 (~EE_CS, ee_addr);
 	eeprom_delay ();
 
 	return retval;
@@ -1206,7 +1196,7 @@ static int __devinit read_eeprom (void *
 #define MDIO_WRITE0 (MDIO_DIR)
 #define MDIO_WRITE1 (MDIO_DIR | MDIO_DATA_OUT)
 
-#define mdio_delay(mdio_addr)	readb(mdio_addr)
+#define mdio_delay(mdio_addr)	ioread8(mdio_addr)
 
 
 static char mii_2_8139_map[8] = {
@@ -1223,14 +1213,14 @@ static char mii_2_8139_map[8] = {
 
 #ifdef CONFIG_8139TOO_8129
 /* Syncronize the MII management interface by shifting 32 one bits out. */
-static void mdio_sync (void *mdio_addr)
+static void mdio_sync (void __iomem *mdio_addr)
 {
 	int i;
 
 	for (i = 32; i >= 0; i--) {
-		writeb (MDIO_WRITE1, mdio_addr);
+		iowrite8 (MDIO_WRITE1, mdio_addr);
 		mdio_delay (mdio_addr);
-		writeb (MDIO_WRITE1 | MDIO_CLK, mdio_addr);
+		iowrite8 (MDIO_WRITE1 | MDIO_CLK, mdio_addr);
 		mdio_delay (mdio_addr);
 	}
 }
@@ -1241,14 +1231,14 @@ static int mdio_read (struct net_device 
 	struct rtl8139_private *tp = netdev_priv(dev);
 	int retval = 0;
 #ifdef CONFIG_8139TOO_8129
-	void *mdio_addr = tp->mmio_addr + Config4;
+	void __iomem *mdio_addr = tp->ioaddr + Config4;
 	int mii_cmd = (0xf6 << 10) | (phy_id << 5) | location;
 	int i;
 #endif
 
 	if (phy_id > 31) {	/* Really a 8139.  Use internal registers. */
 		return location < 8 && mii_2_8139_map[location] ?
-		    readw (tp->mmio_addr + mii_2_8139_map[location]) : 0;
+		    ioread16 (tp->ioaddr + mii_2_8139_map[location]) : 0;
 	}
 
 #ifdef CONFIG_8139TOO_8129
@@ -1257,18 +1247,18 @@ static int mdio_read (struct net_device 
 	for (i = 15; i >= 0; i--) {
 		int dataval = (mii_cmd & (1 << i)) ? MDIO_DATA_OUT : 0;
 
-		writeb (MDIO_DIR | dataval, mdio_addr);
+		iowrite8 (MDIO_DIR | dataval, mdio_addr);
 		mdio_delay (mdio_addr);
-		writeb (MDIO_DIR | dataval | MDIO_CLK, mdio_addr);
+		iowrite8 (MDIO_DIR | dataval | MDIO_CLK, mdio_addr);
 		mdio_delay (mdio_addr);
 	}
 
 	/* Read the two transition, 16 data, and wire-idle bits. */
 	for (i = 19; i > 0; i--) {
-		writeb (0, mdio_addr);
+		iowrite8 (0, mdio_addr);
 		mdio_delay (mdio_addr);
-		retval = (retval << 1) | ((readb (mdio_addr) & MDIO_DATA_IN) ? 1 : 0);
-		writeb (MDIO_CLK, mdio_addr);
+		retval = (retval << 1) | ((ioread8 (mdio_addr) & MDIO_DATA_IN) ? 1 : 0);
+		iowrite8 (MDIO_CLK, mdio_addr);
 		mdio_delay (mdio_addr);
 	}
 #endif
@@ -1282,13 +1272,13 @@ static void mdio_write (struct net_devic
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
 #ifdef CONFIG_8139TOO_8129
-	void *mdio_addr = tp->mmio_addr + Config4;
+	void __iomem *mdio_addr = tp->ioaddr + Config4;
 	int mii_cmd = (0x5002 << 16) | (phy_id << 23) | (location << 18) | value;
 	int i;
 #endif
 
 	if (phy_id > 31) {	/* Really a 8139.  Use internal registers. */
-		void *ioaddr = tp->mmio_addr;
+		void __iomem *ioaddr = tp->ioaddr;
 		if (location == 0) {
 			RTL_W8 (Cfg9346, Cfg9346_Unlock);
 			RTL_W16 (BasicModeCtrl, value);
@@ -1305,16 +1295,16 @@ static void mdio_write (struct net_devic
 	for (i = 31; i >= 0; i--) {
 		int dataval =
 		    (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
-		writeb (dataval, mdio_addr);
+		iowrite8 (dataval, mdio_addr);
 		mdio_delay (mdio_addr);
-		writeb (dataval | MDIO_CLK, mdio_addr);
+		iowrite8 (dataval | MDIO_CLK, mdio_addr);
 		mdio_delay (mdio_addr);
 	}
 	/* Clear out extra bits. */
 	for (i = 2; i > 0; i--) {
-		writeb (0, mdio_addr);
+		iowrite8 (0, mdio_addr);
 		mdio_delay (mdio_addr);
-		writeb (MDIO_CLK, mdio_addr);
+		iowrite8 (MDIO_CLK, mdio_addr);
 		mdio_delay (mdio_addr);
 	}
 #endif
@@ -1325,7 +1315,7 @@ static int rtl8139_open (struct net_devi
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
 	int retval;
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 
 	retval = request_irq (dev->irq, rtl8139_interrupt, SA_SHIRQ, dev->name, dev);
 	if (retval)
@@ -1382,7 +1372,7 @@ static void rtl_check_media (struct net_
 static void rtl8139_hw_start (struct net_device *dev)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	u32 i;
 	u8 tmp;
 
@@ -1484,7 +1474,7 @@ static void rtl8139_tune_twister (struct
 				  struct rtl8139_private *tp)
 {
 	int linkcase;
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 
 	/* This is a complicated state machine to configure the "twister" for
 	   impedance/echos based on the cable length.
@@ -1568,7 +1558,7 @@ static void rtl8139_tune_twister (struct
 
 static inline void rtl8139_thread_iter (struct net_device *dev,
 				 struct rtl8139_private *tp,
-				 void *ioaddr)
+				 void __iomem *ioaddr)
 {
 	int mii_lpa;
 
@@ -1638,7 +1628,7 @@ static int rtl8139_thread (void *data)
 
 		if (rtnl_lock_interruptible ())
 			break;
-		rtl8139_thread_iter (dev, tp, tp->mmio_addr);
+		rtl8139_thread_iter (dev, tp, tp->ioaddr);
 		rtnl_unlock ();
 	}
 
@@ -1676,7 +1666,7 @@ static inline void rtl8139_tx_clear (str
 static void rtl8139_tx_timeout (struct net_device *dev)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	int i;
 	u8 tmp8;
 	unsigned long flags;
@@ -1688,7 +1678,7 @@ static void rtl8139_tx_timeout (struct n
 	printk (KERN_DEBUG "%s: Tx queue start entry %ld  dirty entry %ld.\n",
 		dev->name, tp->cur_tx, tp->dirty_tx);
 	for (i = 0; i < NUM_TX_DESC; i++)
-		printk (KERN_DEBUG "%s:  Tx descriptor %d is %8.8lx.%s\n",
+		printk (KERN_DEBUG "%s:  Tx descriptor %d is %8.8x.%s\n",
 			dev->name, i, RTL_R32 (TxStatus0 + (i * 4)),
 			i == tp->dirty_tx % NUM_TX_DESC ?
 				" (queue head)" : "");
@@ -1721,7 +1711,7 @@ static void rtl8139_tx_timeout (struct n
 static int rtl8139_start_xmit (struct sk_buff *skb, struct net_device *dev)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	unsigned int entry;
 	unsigned int len = skb->len;
 
@@ -1763,7 +1753,7 @@ static int rtl8139_start_xmit (struct sk
 
 static void rtl8139_tx_interrupt (struct net_device *dev,
 				  struct rtl8139_private *tp,
-				  void *ioaddr)
+				  void __iomem *ioaddr)
 {
 	unsigned long dirty_tx, tx_left;
 
@@ -1833,7 +1823,7 @@ static void rtl8139_tx_interrupt (struct
 
 /* TODO: clean this up!  Rx reset need not be this intensive */
 static void rtl8139_rx_err (u32 rx_status, struct net_device *dev,
-			    struct rtl8139_private *tp, void *ioaddr)
+			    struct rtl8139_private *tp, void __iomem *ioaddr)
 {
 	u8 tmp8;
 #ifdef CONFIG_8139_OLD_RX_RESET
@@ -1930,7 +1920,7 @@ static __inline__ void wrap_copy(struct 
 
 static void rtl8139_isr_ack(struct rtl8139_private *tp)
 {
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	u16 status;
 
 	status = RTL_R16 (IntrStatus) & RxAckBits;
@@ -1949,7 +1939,7 @@ static void rtl8139_isr_ack(struct rtl81
 static int rtl8139_rx(struct net_device *dev, struct rtl8139_private *tp,
 		      int budget)
 {
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	int received = 0;
 	unsigned char *rx_ring = tp->rx_ring;
 	unsigned int cur_rx = tp->cur_rx;
@@ -2087,7 +2077,7 @@ out:
 
 static void rtl8139_weird_interrupt (struct net_device *dev,
 				     struct rtl8139_private *tp,
-				     void *ioaddr,
+				     void __iomem *ioaddr,
 				     int status, int link_changed)
 {
 	DPRINTK ("%s: Abnormal interrupt, status %8.8x.\n",
@@ -2127,7 +2117,7 @@ static void rtl8139_weird_interrupt (str
 static int rtl8139_poll(struct net_device *dev, int *budget)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	int orig_budget = min(*budget, dev->quota);
 	int done = 1;
 
@@ -2165,7 +2155,7 @@ static irqreturn_t rtl8139_interrupt (in
 {
 	struct net_device *dev = (struct net_device *) dev_instance;
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	u16 status, ackstat;
 	int link_changed = 0; /* avoid bogus "uninit" warning */
 	int handled = 0;
@@ -2241,7 +2231,7 @@ static void rtl8139_poll_controller(stru
 static int rtl8139_close (struct net_device *dev)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	int ret = 0;
 	unsigned long flags;
 
@@ -2304,7 +2294,7 @@ static int rtl8139_close (struct net_dev
 static void rtl8139_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct rtl8139_private *np = netdev_priv(dev);
-	void *ioaddr = np->mmio_addr;
+	void __iomem *ioaddr = np->ioaddr;
 
 	spin_lock_irq(&np->lock);
 	if (rtl_chip_info[np->chipset].flags & HasLWake) {
@@ -2338,7 +2328,7 @@ static void rtl8139_get_wol(struct net_d
 static int rtl8139_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct rtl8139_private *np = netdev_priv(dev);
-	void *ioaddr = np->mmio_addr;
+	void __iomem *ioaddr = np->ioaddr;
 	u32 support;
 	u8 cfg3, cfg5;
 
@@ -2445,7 +2435,7 @@ static void rtl8139_get_regs(struct net_
 	regs->version = RTL_REGS_VER;
 
 	spin_lock_irq(&np->lock);
-	memcpy_fromio(regbuf, np->mmio_addr, regs->len);
+	memcpy_fromio(regbuf, np->ioaddr, regs->len);
 	spin_unlock_irq(&np->lock);
 }
 #endif /* CONFIG_8139TOO_MMIO */
@@ -2506,7 +2496,7 @@ static int netdev_ioctl(struct net_devic
 static struct net_device_stats *rtl8139_get_stats (struct net_device *dev)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	unsigned long flags;
 
 	if (netif_running(dev)) {
@@ -2525,7 +2515,7 @@ static struct net_device_stats *rtl8139_
 static void __set_rx_mode (struct net_device *dev)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	u32 mc_filter[2];	/* Multicast hash filter */
 	int i, rx_mode;
 	u32 tmp;
@@ -2586,7 +2576,7 @@ static int rtl8139_suspend (struct pci_d
 {
 	struct net_device *dev = pci_get_drvdata (pdev);
 	struct rtl8139_private *tp = netdev_priv(dev);
-	void *ioaddr = tp->mmio_addr;
+	void __iomem *ioaddr = tp->ioaddr;
 	unsigned long flags;
 
 	pci_save_state (pdev);

--===============26099810209945751==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26099810209945751==--
