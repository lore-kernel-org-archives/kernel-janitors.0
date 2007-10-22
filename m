From: Roel Kluin <12o3l@tiscali.nl>
Date: Mon, 22 Oct 2007 14:24:41 +0000
Subject: [PATCH] forcedeth debugging
Message-Id: <471CB2A9.4070408@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is against current git

--
    * Enable forcedeth debugging
    * Change dprintk's to pr_debug
    * Function nv_dprintk_skb_data to pr_debug data.
    
    Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
---
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index ce34b53..d826e09 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -1435,6 +1435,12 @@ config FORCEDETH_NAPI
 
 	  If in doubt, say N.
 
+config FORCEDETH_DEBUG
+	bool "nForce Ethernet debugging"
+	depends on FORCEDETH
+	help
+	  This option enables debugging support for the nForce Ethernet controller.
+
 config CS89x0
 	tristate "CS89x0 support"
 	depends on NET_PCI && (ISA || MACH_IXDP2351 || ARCH_IXDP2X01 || ARCH_PNX010X)
diff --git a/drivers/net/forcedeth.c b/drivers/net/forcedeth.c
index 70ddf1a..98547fd 100644
--- a/drivers/net/forcedeth.c
+++ b/drivers/net/forcedeth.c
@@ -152,12 +152,11 @@
 #include <asm/io.h>
 #include <asm/uaccess.h>
 #include <asm/system.h>
-
-#if 0
-#define dprintk			printk
-#else
-#define dprintk(x...)		do { } while (0)
+#ifdef FORCEDETH_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
+
 
 #define TX_WORK_PER_LOOP  64
 #define RX_WORK_PER_LOOP  64
@@ -1066,21 +1065,21 @@ static int mii_rw(struct net_device *dev, int addr, int miireg, int value)
 
 	if (reg_delay(dev, NvRegMIIControl, NVREG_MIICTL_INUSE, 0,
 			NV_MIIPHY_DELAY, NV_MIIPHY_DELAYMAX, NULL)) {
-		dprintk(KERN_DEBUG "%s: mii_rw of reg %d at PHY %d timed out.\n",
+		pr_debug("%s: mii_rw of reg %d at PHY %d timed out.\n",
 				dev->name, miireg, addr);
 		retval = -1;
 	} else if (value != MII_READ) {
 		/* it was a write operation - fewer failures are detectable */
-		dprintk(KERN_DEBUG "%s: mii_rw wrote 0x%x to reg %d at PHY %d\n",
+		pr_debug("%s: mii_rw wrote 0x%x to reg %d at PHY %d\n",
 				dev->name, value, miireg, addr);
 		retval = 0;
 	} else if (readl(base + NvRegMIIStatus) & NVREG_MIISTAT_ERROR) {
-		dprintk(KERN_DEBUG "%s: mii_rw of reg %d at PHY %d failed.\n",
+		pr_debug("%s: mii_rw of reg %d at PHY %d failed.\n",
 				dev->name, miireg, addr);
 		retval = -1;
 	} else {
 		retval = readl(base + NvRegMIIData);
-		dprintk(KERN_DEBUG "%s: mii_rw read from reg %d at PHY %d: 0x%x.\n",
+		pr_debug("%s: mii_rw read from reg %d at PHY %d: 0x%x.\n",
 				dev->name, miireg, addr, retval);
 	}
 
@@ -1328,7 +1327,7 @@ static void nv_start_rx(struct net_device *dev)
 	u8 __iomem *base = get_hwbase(dev);
 	u32 rx_ctrl = readl(base + NvRegReceiverControl);
 
-	dprintk(KERN_DEBUG "%s: nv_start_rx\n", dev->name);
+	pr_debug("%s: nv_start_rx\n", dev->name);
 	/* Already running? Stop it. */
 	if ((readl(base + NvRegReceiverControl) & NVREG_RCVCTL_START) && !np->mac_in_use) {
 		rx_ctrl &= ~NVREG_RCVCTL_START;
@@ -1341,7 +1340,7 @@ static void nv_start_rx(struct net_device *dev)
         if (np->mac_in_use)
 		rx_ctrl &= ~NVREG_RCVCTL_RX_PATH_EN;
 	writel(rx_ctrl, base + NvRegReceiverControl);
-	dprintk(KERN_DEBUG "%s: nv_start_rx to duplex %d, speed 0x%08x.\n",
+	pr_debug("%s: nv_start_rx to duplex %d, speed 0x%08x.\n",
 				dev->name, np->duplex, np->linkspeed);
 	pci_push(base);
 }
@@ -1352,7 +1351,7 @@ static void nv_stop_rx(struct net_device *dev)
 	u8 __iomem *base = get_hwbase(dev);
 	u32 rx_ctrl = readl(base + NvRegReceiverControl);
 
-	dprintk(KERN_DEBUG "%s: nv_stop_rx\n", dev->name);
+	pr_debug("%s: nv_stop_rx\n", dev->name);
 	if (!np->mac_in_use)
 		rx_ctrl &= ~NVREG_RCVCTL_START;
 	else
@@ -1373,7 +1372,7 @@ static void nv_start_tx(struct net_device *dev)
 	u8 __iomem *base = get_hwbase(dev);
 	u32 tx_ctrl = readl(base + NvRegTransmitterControl);
 
-	dprintk(KERN_DEBUG "%s: nv_start_tx\n", dev->name);
+	pr_debug("%s: nv_start_tx\n", dev->name);
 	tx_ctrl |= NVREG_XMITCTL_START;
 	if (np->mac_in_use)
 		tx_ctrl &= ~NVREG_XMITCTL_TX_PATH_EN;
@@ -1387,7 +1386,7 @@ static void nv_stop_tx(struct net_device *dev)
 	u8 __iomem *base = get_hwbase(dev);
 	u32 tx_ctrl = readl(base + NvRegTransmitterControl);
 
-	dprintk(KERN_DEBUG "%s: nv_stop_tx\n", dev->name);
+	pr_debug("%s: nv_stop_tx\n", dev->name);
 	if (!np->mac_in_use)
 		tx_ctrl &= ~NVREG_XMITCTL_START;
 	else
@@ -1408,7 +1407,7 @@ static void nv_txrx_reset(struct net_device *dev)
 	struct fe_priv *np = netdev_priv(dev);
 	u8 __iomem *base = get_hwbase(dev);
 
-	dprintk(KERN_DEBUG "%s: nv_txrx_reset\n", dev->name);
+	pr_debug("%s: nv_txrx_reset\n", dev->name);
 	writel(NVREG_TXRXCTL_BIT2 | NVREG_TXRXCTL_RESET | np->txrxctl_bits, base + NvRegTxRxControl);
 	pci_push(base);
 	udelay(NV_TXRX_RESET_DELAY);
@@ -1421,7 +1420,7 @@ static void nv_mac_reset(struct net_device *dev)
 	struct fe_priv *np = netdev_priv(dev);
 	u8 __iomem *base = get_hwbase(dev);
 
-	dprintk(KERN_DEBUG "%s: nv_mac_reset\n", dev->name);
+	pr_debug("%s: nv_mac_reset\n", dev->name);
 	writel(NVREG_TXRXCTL_BIT2 | NVREG_TXRXCTL_RESET | np->txrxctl_bits, base + NvRegTxRxControl);
 	pci_push(base);
 	writel(NVREG_MAC_RESET_ASSERT, base + NvRegMacReset);
@@ -1775,6 +1774,19 @@ static inline u32 nv_get_empty_tx_slots(struct fe_priv *np)
 	return (u32)(np->tx_ring_size - ((np->tx_ring_size + (np->put_tx_ctx - np->get_tx_ctx)) % np->tx_ring_size));
 }
 
+static void nv_dprintk_skb_data(unsigned char *data)
+{
+	int j;
+	for (j = 0; j < 64; j++) {
+		if ((j%16) = 0) {
+			printk("\n");
+			printk(KERN_DEBUG "%03x:", j);
+		}
+		printk(" %02x", data[j]);
+	}
+	printk("\n");
+}
+
 /*
  * nv_start_xmit: dev->hard_start_xmit function
  * Called with netif_tx_lock held.
@@ -1878,17 +1890,9 @@ static int nv_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	spin_unlock_irq(&np->lock);
 
-	dprintk(KERN_DEBUG "%s: nv_start_xmit: entries %d queued for transmission. tx_flags_extra: %x\n",
+	pr_debug("%s: nv_start_xmit: entries %d queued for transmission. tx_flags_extra: %x\n",
 		dev->name, entries, tx_flags_extra);
-	{
-		int j;
-		for (j=0; j<64; j++) {
-			if ((j%16) = 0)
-				dprintk("\n%03x:", j);
-			dprintk(" %02x", ((unsigned char*)skb->data)[j]);
-		}
-		dprintk("\n");
-	}
+	nv_dprintk_skb_data(skb->data);
 
 	dev->trans_start = jiffies;
 	writel(NVREG_TXRXCTL_KICK|np->txrxctl_bits, get_hwbase(dev) + NvRegTxRxControl);
@@ -2006,17 +2010,9 @@ static int nv_start_xmit_optimized(struct sk_buff *skb, struct net_device *dev)
 
 	spin_unlock_irq(&np->lock);
 
-	dprintk(KERN_DEBUG "%s: nv_start_xmit_optimized: entries %d queued for transmission. tx_flags_extra: %x\n",
+	pr_debug("%s: nv_start_xmit_optimized: entries %d queued for transmission. tx_flags_extra: %x\n",
 		dev->name, entries, tx_flags_extra);
-	{
-		int j;
-		for (j=0; j<64; j++) {
-			if ((j%16) = 0)
-				dprintk("\n%03x:", j);
-			dprintk(" %02x", ((unsigned char*)skb->data)[j]);
-		}
-		dprintk("\n");
-	}
+	nv_dprintk_skb_data(skb->data);
 
 	dev->trans_start = jiffies;
 	writel(NVREG_TXRXCTL_KICK|np->txrxctl_bits, get_hwbase(dev) + NvRegTxRxControl);
@@ -2037,8 +2033,7 @@ static void nv_tx_done(struct net_device *dev)
 	while ((np->get_tx.orig != np->put_tx.orig) &&
 	       !((flags = le32_to_cpu(np->get_tx.orig->flaglen)) & NV_TX_VALID)) {
 
-		dprintk(KERN_DEBUG "%s: nv_tx_done: flags 0x%x.\n",
-					dev->name, flags);
+		pr_debug("%s: nv_tx_done: flags 0x%x.\n", dev->name, flags);
 
 		pci_unmap_page(np->pci_dev, np->get_tx_ctx->dma,
 			       np->get_tx_ctx->dma_len,
@@ -2097,7 +2092,7 @@ static void nv_tx_done_optimized(struct net_device *dev, int limit)
 	       !((flags = le32_to_cpu(np->get_tx.ex->flaglen)) & NV_TX_VALID) &&
 	       (limit-- > 0)) {
 
-		dprintk(KERN_DEBUG "%s: nv_tx_done_optimized: flags 0x%x.\n",
+		pr_debug("%s: nv_tx_done_optimized: flags 0x%x.\n",
 					dev->name, flags);
 
 		pci_unmap_page(np->pci_dev, np->get_tx_ctx->dma,
@@ -2198,7 +2193,7 @@ static void nv_tx_timeout(struct net_device *dev)
 
 	/* 3) if there are dead entries: clear everything */
 	if (np->get_tx_ctx != np->put_tx_ctx) {
-		printk(KERN_DEBUG "%s: tx_timeout: dead entries!\n", dev->name);
+		pr_debug("%s: tx_timeout: dead entries!\n", dev->name);
 		nv_drain_tx(dev);
 		nv_init_tx(dev);
 		setup_hw_rings(dev, NV_SETUP_TX_RING);
@@ -2228,7 +2223,7 @@ static int nv_getlen(struct net_device *dev, void *packet, int datalen)
 		protolen = ntohs( ((struct ethhdr *)packet)->h_proto);
 		hdrlen = ETH_HLEN;
 	}
-	dprintk(KERN_DEBUG "%s: nv_getlen: datalen %d, protolen %d, hdrlen %d\n",
+	pr_debug("%s: nv_getlen: datalen %d, protolen %d, hdrlen %d\n",
 				dev->name, datalen, protolen, hdrlen);
 	if (protolen > ETH_DATA_LEN)
 		return datalen; /* Value in proto field not a len, no checks possible */
@@ -2240,26 +2235,23 @@ static int nv_getlen(struct net_device *dev, void *packet, int datalen)
 			/* more data on wire than in 802 header, trim of
 			 * additional data.
 			 */
-			dprintk(KERN_DEBUG "%s: nv_getlen: accepting %d bytes.\n",
+			pr_debug("%s: nv_getlen: accepting %d bytes.\n",
 					dev->name, protolen);
 			return protolen;
 		} else {
 			/* less data on wire than mentioned in header.
 			 * Discard the packet.
 			 */
-			dprintk(KERN_DEBUG "%s: nv_getlen: discarding long packet.\n",
-					dev->name);
+			pr_debug("%s: nv_getlen: discarding long packet.\n", dev->name);
 			return -1;
 		}
 	} else {
 		/* short packet. Accept only if 802 values are also short */
 		if (protolen > ETH_ZLEN) {
-			dprintk(KERN_DEBUG "%s: nv_getlen: discarding short packet.\n",
-					dev->name);
+			pr_debug("%s: nv_getlen: discarding short packet.\n", dev->name);
 			return -1;
 		}
-		dprintk(KERN_DEBUG "%s: nv_getlen: accepting %d bytes.\n",
-				dev->name, datalen);
+		pr_debug("%s: nv_getlen: accepting %d bytes.\n", dev->name, datalen);
 		return datalen;
 	}
 }
@@ -2276,8 +2268,7 @@ static int nv_rx_process(struct net_device *dev, int limit)
 	      !((flags = le32_to_cpu(np->get_rx.orig->flaglen)) & NV_RX_AVAIL) &&
 		(rx_work < limit)) {
 
-		dprintk(KERN_DEBUG "%s: nv_rx_process: flags 0x%x.\n",
-					dev->name, flags);
+		pr_debug("%s: nv_rx_process: flags 0x%x.\n", dev->name, flags);
 
 		/*
 		 * the packet is for us - immediately tear down the pci mapping.
@@ -2290,16 +2281,9 @@ static int nv_rx_process(struct net_device *dev, int limit)
 		skb = np->get_rx_ctx->skb;
 		np->get_rx_ctx->skb = NULL;
 
-		{
-			int j;
-			dprintk(KERN_DEBUG "Dumping packet (flags 0x%x).",flags);
-			for (j=0; j<64; j++) {
-				if ((j%16) = 0)
-					dprintk("\n%03x:", j);
-				dprintk(" %02x", ((unsigned char*)skb->data)[j]);
-			}
-			dprintk("\n");
-		}
+		dprintk(KERN_DEBUG "Dumping packet (flags 0x%x).", flags);
+		nv_dprintk_skb_data(skb->data);
+
 		/* look at what we actually got: */
 		if (np->desc_ver = DESC_VER_1) {
 			if (likely(flags & NV_RX_DESCRIPTORVALID)) {
@@ -2381,7 +2365,7 @@ static int nv_rx_process(struct net_device *dev, int limit)
 		/* got a valid packet - forward it to the network core */
 		skb_put(skb, len);
 		skb->protocol = eth_type_trans(skb, dev);
-		dprintk(KERN_DEBUG "%s: nv_rx_process: %d bytes, proto %d accepted.\n",
+		pr_debug("%s: nv_rx_process: %d bytes, proto %d accepted.\n",
 					dev->name, len, skb->protocol);
 #ifdef CONFIG_FORCEDETH_NAPI
 		netif_receive_skb(skb);
@@ -2416,7 +2400,7 @@ static int nv_rx_process_optimized(struct net_device *dev, int limit)
 	      !((flags = le32_to_cpu(np->get_rx.ex->flaglen)) & NV_RX2_AVAIL) &&
 	      (rx_work < limit)) {
 
-		dprintk(KERN_DEBUG "%s: nv_rx_process_optimized: flags 0x%x.\n",
+		pr_debug("%s: nv_rx_process_optimized: flags 0x%x.\n",
 					dev->name, flags);
 
 		/*
@@ -2430,16 +2414,9 @@ static int nv_rx_process_optimized(struct net_device *dev, int limit)
 		skb = np->get_rx_ctx->skb;
 		np->get_rx_ctx->skb = NULL;
 
-		{
-			int j;
-			dprintk(KERN_DEBUG "Dumping packet (flags 0x%x).",flags);
-			for (j=0; j<64; j++) {
-				if ((j%16) = 0)
-					dprintk("\n%03x:", j);
-				dprintk(" %02x", ((unsigned char*)skb->data)[j]);
-			}
-			dprintk("\n");
-		}
+		pr_debug("Dumping packet (flags 0x%x).", flags);
+		nv_dprintk_skb_data(skb->data);
+
 		/* look at what we actually got: */
 		if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
 			len = flags & LEN_MASK_V2;
@@ -2478,7 +2455,7 @@ static int nv_rx_process_optimized(struct net_device *dev, int limit)
 			skb->protocol = eth_type_trans(skb, dev);
 			prefetch(skb->data);
 
-			dprintk(KERN_DEBUG "%s: nv_rx_process_optimized: %d bytes, proto %d accepted.\n",
+			pr_debug("%s: nv_rx_process_optimized: %d bytes, proto %d accepted.\n",
 				dev->name, len, skb->protocol);
 
 			if (likely(!np->vlangrp)) {
@@ -2704,8 +2681,7 @@ static void nv_set_multicast(struct net_device *dev)
 	writel(mask[0], base + NvRegMulticastMaskA);
 	writel(mask[1], base + NvRegMulticastMaskB);
 	writel(pff, base + NvRegPacketFilterFlags);
-	dprintk(KERN_INFO "%s: reconfiguration for multicast lists.\n",
-		dev->name);
+	printk(KERN_INFO "%s: reconfiguration for multicast lists.\n", dev->name);
 	nv_start_rx(dev);
 	spin_unlock_irq(&np->lock);
 }
@@ -2770,7 +2746,7 @@ static int nv_update_linkspeed(struct net_device *dev)
 	mii_status = mii_rw(dev, np->phyaddr, MII_BMSR, MII_READ);
 
 	if (!(mii_status & BMSR_LSTATUS)) {
-		dprintk(KERN_DEBUG "%s: no link detected by phy - falling back to 10HD.\n",
+		pr_debug("%s: no link detected by phy - falling back to 10HD.\n",
 				dev->name);
 		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
 		newdup = 0;
@@ -2779,7 +2755,7 @@ static int nv_update_linkspeed(struct net_device *dev)
 	}
 
 	if (np->autoneg = 0) {
-		dprintk(KERN_DEBUG "%s: nv_update_linkspeed: autoneg off, PHY set to 0x%04x.\n",
+		pr_debug("%s: nv_update_linkspeed: autoneg off, PHY set to 0x%04x.\n",
 				dev->name, np->fixed_mode);
 		if (np->fixed_mode & LPA_100FULL) {
 			newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_100;
@@ -2803,13 +2779,13 @@ static int nv_update_linkspeed(struct net_device *dev)
 		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
 		newdup = 0;
 		retval = 0;
-		dprintk(KERN_DEBUG "%s: autoneg not completed - falling back to 10HD.\n", dev->name);
+		pr_debug("%s: autoneg not completed - falling back to 10HD.\n", dev->name);
 		goto set_speed;
 	}
 
 	adv = mii_rw(dev, np->phyaddr, MII_ADVERTISE, MII_READ);
 	lpa = mii_rw(dev, np->phyaddr, MII_LPA, MII_READ);
-	dprintk(KERN_DEBUG "%s: nv_update_linkspeed: PHY advertises 0x%04x, lpa 0x%04x.\n",
+	pr_debug("%s: nv_update_linkspeed: PHY advertises 0x%04x, lpa 0x%04x.\n",
 				dev->name, adv, lpa);
 
 	retval = 1;
@@ -2819,7 +2795,7 @@ static int nv_update_linkspeed(struct net_device *dev)
 
 		if ((control_1000 & ADVERTISE_1000FULL) &&
 			(status_1000 & LPA_1000FULL)) {
-			dprintk(KERN_DEBUG "%s: nv_update_linkspeed: GBit ethernet detected.\n",
+			pr_debug("%s: nv_update_linkspeed: GBit ethernet detected.\n",
 				dev->name);
 			newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_1000;
 			newdup = 1;
@@ -2842,7 +2818,7 @@ static int nv_update_linkspeed(struct net_device *dev)
 		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
 		newdup = 0;
 	} else {
-		dprintk(KERN_DEBUG "%s: bad ability %04x - falling back to 10HD.\n", dev->name, adv_lpa);
+		pr_debug("%s: bad ability %04x - falling back to 10HD.\n", dev->name, adv_lpa);
 		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
 		newdup = 0;
 	}
@@ -2851,7 +2827,7 @@ set_speed:
 	if (np->duplex = newdup && np->linkspeed = newls)
 		return retval;
 
-	dprintk(KERN_INFO "%s: changing link setting from %d/%d to %d/%d.\n",
+	printk(KERN_INFO "%s: changing link setting from %d/%d to %d/%d.\n",
 			dev->name, np->linkspeed, np->duplex, newls, newdup);
 
 	np->duplex = newdup;
@@ -2972,11 +2948,11 @@ static void nv_link_irq(struct net_device *dev)
 
 	miistat = readl(base + NvRegMIIStatus);
 	writel(NVREG_MIISTAT_MASK, base + NvRegMIIStatus);
-	dprintk(KERN_INFO "%s: link change irq, status 0x%x.\n", dev->name, miistat);
+	printk(KERN_INFO "%s: link change irq, status 0x%x.\n", dev->name, miistat);
 
 	if (miistat & (NVREG_MIISTAT_LINKCHANGE))
 		nv_linkchange(dev);
-	dprintk(KERN_DEBUG "%s: link change notification done.\n", dev->name);
+	pr_debug("%s: link change notification done.\n", dev->name);
 }
 
 static irqreturn_t nv_nic_irq(int foo, void *data)
@@ -2987,7 +2963,7 @@ static irqreturn_t nv_nic_irq(int foo, void *data)
 	u32 events;
 	int i;
 
-	dprintk(KERN_DEBUG "%s: nv_nic_irq\n", dev->name);
+	pr_debug("%s: nv_nic_irq\n", dev->name);
 
 	for (i=0; ; i++) {
 		if (!(np->msi_flags & NV_MSI_X_ENABLED)) {
@@ -2997,7 +2973,7 @@ static irqreturn_t nv_nic_irq(int foo, void *data)
 			events = readl(base + NvRegMSIXIrqStatus) & NVREG_IRQSTAT_MASK;
 			writel(NVREG_IRQSTAT_MASK, base + NvRegMSIXIrqStatus);
 		}
-		dprintk(KERN_DEBUG "%s: irq: %08x\n", dev->name, events);
+		pr_debug("%s: irq: %08x\n", dev->name, events);
 		if (!(events & np->irqmask))
 			break;
 
@@ -3041,11 +3017,11 @@ static irqreturn_t nv_nic_irq(int foo, void *data)
 			np->link_timeout = jiffies + LINK_TIMEOUT;
 		}
 		if (unlikely(events & (NVREG_IRQ_TX_ERR))) {
-			dprintk(KERN_DEBUG "%s: received irq with events 0x%x. Probably TX fail.\n",
+			pr_debug("%s: received irq with events 0x%x. Probably TX fail.\n",
 						dev->name, events);
 		}
 		if (unlikely(events & (NVREG_IRQ_UNKNOWN))) {
-			printk(KERN_DEBUG "%s: received irq with unknown events 0x%x. Please report\n",
+			pr_debug("%s: received irq with unknown events 0x%x. Please report\n",
 						dev->name, events);
 		}
 		if (unlikely(events & NVREG_IRQ_RECOVER_ERROR)) {
@@ -3079,12 +3055,12 @@ static irqreturn_t nv_nic_irq(int foo, void *data)
 				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock(&np->lock);
-			printk(KERN_DEBUG "%s: too many iterations (%d) in nv_nic_irq.\n", dev->name, i);
+			pr_debug("%s: too many iterations (%d) in nv_nic_irq.\n", dev->name, i);
 			break;
 		}
 
 	}
-	dprintk(KERN_DEBUG "%s: nv_nic_irq completed\n", dev->name);
+	pr_debug("%s: nv_nic_irq completed\n", dev->name);
 
 	return IRQ_RETVAL(i);
 }
@@ -3102,7 +3078,7 @@ static irqreturn_t nv_nic_irq_optimized(int foo, void *data)
 	u32 events;
 	int i;
 
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_optimized\n", dev->name);
+	pr_debug("%s: nv_nic_irq_optimized\n", dev->name);
 
 	for (i=0; ; i++) {
 		if (!(np->msi_flags & NV_MSI_X_ENABLED)) {
@@ -3112,7 +3088,7 @@ static irqreturn_t nv_nic_irq_optimized(int foo, void *data)
 			events = readl(base + NvRegMSIXIrqStatus) & NVREG_IRQSTAT_MASK;
 			writel(NVREG_IRQSTAT_MASK, base + NvRegMSIXIrqStatus);
 		}
-		dprintk(KERN_DEBUG "%s: irq: %08x\n", dev->name, events);
+		pr_debug("%s: irq: %08x\n", dev->name, events);
 		if (!(events & np->irqmask))
 			break;
 
@@ -3156,11 +3132,11 @@ static irqreturn_t nv_nic_irq_optimized(int foo, void *data)
 			np->link_timeout = jiffies + LINK_TIMEOUT;
 		}
 		if (unlikely(events & (NVREG_IRQ_TX_ERR))) {
-			dprintk(KERN_DEBUG "%s: received irq with events 0x%x. Probably TX fail.\n",
+			pr_debug("%s: received irq with events 0x%x. Probably TX fail.\n",
 						dev->name, events);
 		}
 		if (unlikely(events & (NVREG_IRQ_UNKNOWN))) {
-			printk(KERN_DEBUG "%s: received irq with unknown events 0x%x. Please report\n",
+			pr_debug("%s: received irq with unknown events 0x%x. Please report\n",
 						dev->name, events);
 		}
 		if (unlikely(events & NVREG_IRQ_RECOVER_ERROR)) {
@@ -3195,12 +3171,12 @@ static irqreturn_t nv_nic_irq_optimized(int foo, void *data)
 				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock(&np->lock);
-			printk(KERN_DEBUG "%s: too many iterations (%d) in nv_nic_irq.\n", dev->name, i);
+			pr_debug("%s: too many iterations (%d) in nv_nic_irq.\n", dev->name, i);
 			break;
 		}
 
 	}
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_optimized completed\n", dev->name);
+	pr_debug("%s: nv_nic_irq_optimized completed\n", dev->name);
 
 	return IRQ_RETVAL(i);
 }
@@ -3214,12 +3190,12 @@ static irqreturn_t nv_nic_irq_tx(int foo, void *data)
 	int i;
 	unsigned long flags;
 
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_tx\n", dev->name);
+	pr_debug("%s: nv_nic_irq_tx\n", dev->name);
 
 	for (i=0; ; i++) {
 		events = readl(base + NvRegMSIXIrqStatus) & NVREG_IRQ_TX_ALL;
 		writel(NVREG_IRQ_TX_ALL, base + NvRegMSIXIrqStatus);
-		dprintk(KERN_DEBUG "%s: tx irq: %08x\n", dev->name, events);
+		pr_debug("%s: tx irq: %08x\n", dev->name, events);
 		if (!(events & np->irqmask))
 			break;
 
@@ -3228,7 +3204,7 @@ static irqreturn_t nv_nic_irq_tx(int foo, void *data)
 		spin_unlock_irqrestore(&np->lock, flags);
 
 		if (unlikely(events & (NVREG_IRQ_TX_ERR))) {
-			dprintk(KERN_DEBUG "%s: received irq with events 0x%x. Probably TX fail.\n",
+			pr_debug("%s: received irq with events 0x%x. Probably TX fail.\n",
 						dev->name, events);
 		}
 		if (unlikely(i > max_interrupt_work)) {
@@ -3242,12 +3218,12 @@ static irqreturn_t nv_nic_irq_tx(int foo, void *data)
 				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock_irqrestore(&np->lock, flags);
-			printk(KERN_DEBUG "%s: too many iterations (%d) in nv_nic_irq_tx.\n", dev->name, i);
+			pr_debug("%s: too many iterations (%d) in nv_nic_irq_tx.\n", dev->name, i);
 			break;
 		}
 
 	}
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_tx completed\n", dev->name);
+	pr_debug("%s: nv_nic_irq_tx completed\n", dev->name);
 
 	return IRQ_RETVAL(i);
 }
@@ -3323,12 +3299,12 @@ static irqreturn_t nv_nic_irq_rx(int foo, void *data)
 	int i;
 	unsigned long flags;
 
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_rx\n", dev->name);
+	pr_debug("%s: nv_nic_irq_rx\n", dev->name);
 
 	for (i=0; ; i++) {
 		events = readl(base + NvRegMSIXIrqStatus) & NVREG_IRQ_RX_ALL;
 		writel(NVREG_IRQ_RX_ALL, base + NvRegMSIXIrqStatus);
-		dprintk(KERN_DEBUG "%s: rx irq: %08x\n", dev->name, events);
+		pr_debug("%s: rx irq: %08x\n", dev->name, events);
 		if (!(events & np->irqmask))
 			break;
 
@@ -3352,11 +3328,11 @@ static irqreturn_t nv_nic_irq_rx(int foo, void *data)
 				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock_irqrestore(&np->lock, flags);
-			printk(KERN_DEBUG "%s: too many iterations (%d) in nv_nic_irq_rx.\n", dev->name, i);
+			pr_debug("%s: too many iterations (%d) in nv_nic_irq_rx.\n", dev->name, i);
 			break;
 		}
 	}
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_rx completed\n", dev->name);
+	pr_debug("%s: nv_nic_irq_rx completed\n", dev->name);
 
 	return IRQ_RETVAL(i);
 }
@@ -3371,12 +3347,12 @@ static irqreturn_t nv_nic_irq_other(int foo, void *data)
 	int i;
 	unsigned long flags;
 
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_other\n", dev->name);
+	pr_debug("%s: nv_nic_irq_other\n", dev->name);
 
 	for (i=0; ; i++) {
 		events = readl(base + NvRegMSIXIrqStatus) & NVREG_IRQ_OTHER;
 		writel(NVREG_IRQ_OTHER, base + NvRegMSIXIrqStatus);
-		dprintk(KERN_DEBUG "%s: irq: %08x\n", dev->name, events);
+		pr_debug("%s: irq: %08x\n", dev->name, events);
 		if (!(events & np->irqmask))
 			break;
 
@@ -3411,7 +3387,7 @@ static irqreturn_t nv_nic_irq_other(int foo, void *data)
 			break;
 		}
 		if (events & (NVREG_IRQ_UNKNOWN)) {
-			printk(KERN_DEBUG "%s: received irq with unknown events 0x%x. Please report\n",
+			pr_debug("%s: received irq with unknown events 0x%x. Please report\n",
 						dev->name, events);
 		}
 		if (unlikely(i > max_interrupt_work)) {
@@ -3425,12 +3401,12 @@ static irqreturn_t nv_nic_irq_other(int foo, void *data)
 				mod_timer(&np->nic_poll, jiffies + POLL_WAIT);
 			}
 			spin_unlock_irqrestore(&np->lock, flags);
-			printk(KERN_DEBUG "%s: too many iterations (%d) in nv_nic_irq_other.\n", dev->name, i);
+			pr_debug("%s: too many iterations (%d) in nv_nic_irq_other.\n", dev->name, i);
 			break;
 		}
 
 	}
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_other completed\n", dev->name);
+	pr_debug("%s: nv_nic_irq_other completed\n", dev->name);
 
 	return IRQ_RETVAL(i);
 }
@@ -3442,7 +3418,7 @@ static irqreturn_t nv_nic_irq_test(int foo, void *data)
 	u8 __iomem *base = get_hwbase(dev);
 	u32 events;
 
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_test\n", dev->name);
+	pr_debug("%s: nv_nic_irq_test\n", dev->name);
 
 	if (!(np->msi_flags & NV_MSI_X_ENABLED)) {
 		events = readl(base + NvRegIrqStatus) & NVREG_IRQSTAT_MASK;
@@ -3452,7 +3428,7 @@ static irqreturn_t nv_nic_irq_test(int foo, void *data)
 		writel(NVREG_IRQ_TIMER, base + NvRegMSIXIrqStatus);
 	}
 	pci_push(base);
-	dprintk(KERN_DEBUG "%s: irq: %08x\n", dev->name, events);
+	pr_debug("%s: irq: %08x\n", dev->name, events);
 	if (!(events & NVREG_IRQ_TIMER))
 		return IRQ_RETVAL(0);
 
@@ -3460,7 +3436,7 @@ static irqreturn_t nv_nic_irq_test(int foo, void *data)
 	np->intr_test = 1;
 	spin_unlock(&np->lock);
 
-	dprintk(KERN_DEBUG "%s: nv_nic_irq_test completed\n", dev->name);
+	pr_debug("%s: nv_nic_irq_test completed\n", dev->name);
 
 	return IRQ_RETVAL(1);
 }
@@ -4572,21 +4548,21 @@ static int nv_loopback_test(struct net_device *dev)
 	if (ret) {
 		if (len != pkt_len) {
 			ret = 0;
-			dprintk(KERN_DEBUG "%s: loopback len mismatch %d vs %d\n",
+			pr_debug("%s: loopback len mismatch %d vs %d\n",
 				dev->name, len, pkt_len);
 		} else {
 			rx_skb = np->rx_skb[0].skb;
 			for (i = 0; i < pkt_len; i++) {
 				if (rx_skb->data[i] != (u8)(i & 0xff)) {
 					ret = 0;
-					dprintk(KERN_DEBUG "%s: loopback pattern check failed on byte %d\n",
+					pr_debug("%s: loopback pattern check failed on byte %d\n",
 						dev->name, i);
 					break;
 				}
 			}
 		}
 	} else {
-		dprintk(KERN_DEBUG "%s: loopback - did not receive test packet\n", dev->name);
+		pr_debug("%s: loopback - did not receive test packet\n", dev->name);
 	}
 
 	pci_unmap_page(np->pci_dev, test_dma_addr,
@@ -4796,7 +4772,7 @@ static int nv_open(struct net_device *dev)
 	int ret = 1;
 	int oom, i;
 
-	dprintk(KERN_DEBUG "nv_open: begin\n");
+	pr_debug("nv_open: begin\n");
 
 	/* erase previous misconfiguration */
 	if (np->driver_data & DEV_HAS_POWER_CNTRL)
@@ -4908,7 +4884,7 @@ static int nv_open(struct net_device *dev)
 		u32 miistat;
 		miistat = readl(base + NvRegMIIStatus);
 		writel(NVREG_MIISTAT_MASK, base + NvRegMIIStatus);
-		dprintk(KERN_INFO "startup: got 0x%08x.\n", miistat);
+		printk(KERN_INFO "startup: got 0x%08x.\n", miistat);
 	}
 	/* set linkspeed to invalid value, thus force nv_update_linkspeed
 	 * to init hw */
@@ -4969,7 +4945,7 @@ static int nv_close(struct net_device *dev)
 	base = get_hwbase(dev);
 	nv_disable_hw_interrupts(dev, np->irqmask);
 	pci_push(base);
-	dprintk(KERN_INFO "%s: Irqmask is zero again\n", dev->name);
+	printk(KERN_INFO "%s: Irqmask is zero again\n", dev->name);
 
 	spin_unlock_irq(&np->lock);
 
@@ -5045,7 +5021,7 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 	err = -EINVAL;
 	addr = 0;
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
-		dprintk(KERN_DEBUG "%s: resource %d start %p len %ld flags 0x%08lx.\n",
+		pr_debug("%s: resource %d start %p len %ld flags 0x%08lx.\n",
 				pci_name(pci_dev), i, (void*)pci_resource_start(pci_dev, i),
 				pci_resource_len(pci_dev, i),
 				pci_resource_flags(pci_dev, i));
@@ -5056,8 +5032,7 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 		}
 	}
 	if (i = DEVICE_COUNT_RESOURCE) {
-		dev_printk(KERN_INFO, &pci_dev->dev,
-			   "Couldn't find register window\n");
+		dev_printk(KERN_INFO, &pci_dev->dev, "Couldn't find register window\n");
 		goto out_relreg;
 	}
 
@@ -5212,8 +5187,7 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 		 * Bad mac address. At least one bios sets the mac address
 		 * to 01:23:45:67:89:ab
 		 */
-		dev_printk(KERN_ERR, &pci_dev->dev,
-			"Invalid Mac address detected: %s\n",
+		dev_printk(KERN_ERR, &pci_dev->dev, "Invalid Mac address detected: %s\n",
 		        print_mac(mac, dev->dev_addr));
 		dev_printk(KERN_ERR, &pci_dev->dev,
 			"Please complain to your hardware vendor. Switching to a random MAC.\n");
@@ -5223,8 +5197,7 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 		get_random_bytes(&dev->dev_addr[3], 3);
 	}
 
-	dprintk(KERN_DEBUG "%s: MAC Address %s\n",
-		pci_name(pci_dev), print_mac(mac, dev->dev_addr));
+	pr_debug("%s: MAC Address %s\n", pci_name(pci_dev), print_mac(mac, dev->dev_addr));
 
 	/* set mac address */
 	nv_copy_mac_to_hw(dev);
@@ -5263,11 +5236,11 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 	if (id->driver_data & DEV_NEED_TIMERIRQ)
 		np->irqmask |= NVREG_IRQ_TIMER;
 	if (id->driver_data & DEV_NEED_LINKTIMER) {
-		dprintk(KERN_INFO "%s: link timer on.\n", pci_name(pci_dev));
+		printk(KERN_INFO "%s: link timer on.\n", pci_name(pci_dev));
 		np->need_linktimer = 1;
 		np->link_timeout = jiffies + LINK_TIMEOUT;
 	} else {
-		dprintk(KERN_INFO "%s: link timer off.\n", pci_name(pci_dev));
+		printk(KERN_INFO "%s: link timer off.\n", pci_name(pci_dev));
 		np->need_linktimer = 0;
 	}
 
@@ -5285,7 +5258,7 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 		/* management unit running on the mac? */
 		if (readl(base + NvRegTransmitterControl) & NVREG_XMITCTL_SYNC_PHY_INIT) {
 			np->mac_in_use = readl(base + NvRegTransmitterControl) & NVREG_XMITCTL_MGMT_ST;
-			dprintk(KERN_INFO "%s: mgmt unit is running. mac in use %x.\n", pci_name(pci_dev), np->mac_in_use);
+			printk(KERN_INFO "%s: mgmt unit is running. mac in use %x.\n", pci_name(pci_dev), np->mac_in_use);
 			for (i = 0; i < 5000; i++) {
 				msleep(1);
 				if (nv_mgmt_acquire_sema(dev)) {
@@ -5294,7 +5267,7 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 					    NVREG_XMITCTL_SYNC_PHY_INIT) {
 						/* phy is inited by mgmt unit */
 						phyinitialized = 1;
-						dprintk(KERN_INFO "%s: Phy already initialized by mgmt unit.\n", pci_name(pci_dev));
+						printk(KERN_INFO "%s: Phy already initialized by mgmt unit.\n", pci_name(pci_dev));
 					} else {
 						/* we need to init the phy */
 					}
@@ -5323,7 +5296,7 @@ static int __devinit nv_probe(struct pci_dev *pci_dev, const struct pci_device_i
 		np->phy_model = id2 & PHYID2_MODEL_MASK;
 		id1 = (id1 & PHYID1_OUI_MASK) << PHYID1_OUI_SHFT;
 		id2 = (id2 & PHYID2_OUI_MASK) >> PHYID2_OUI_SHFT;
-		dprintk(KERN_DEBUG "%s: open: Found PHY %04x:%04x at address %d.\n",
+		pr_debug("%s: open: Found PHY %04x:%04x at address %d.\n",
 			pci_name(pci_dev), id1, id2, phyaddr);
 		np->phyaddr = phyaddr;
 		np->phy_oui = id1 | id2;
