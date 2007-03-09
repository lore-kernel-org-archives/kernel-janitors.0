From: Douglas Schilling Landgraf <dougsland@gmail.com>
Date: Fri, 09 Mar 2007 02:38:17 +0000
Subject: [KJ] [PATCH] au1000_eth.c: cleanup not needed casts
Message-Id: <20070309023817.GA13681@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed all unnecessary casts.

Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>

Index: linux-2.6.20.1/drivers/net/au1000_eth.c
=================================--- linux-2.6.20.1.orig/drivers/net/au1000_eth.c
+++ linux-2.6.20.1/drivers/net/au1000_eth.c
@@ -198,7 +198,7 @@ struct au1000_private *au_macs[NUM_ETH_I
  */
 static int mdio_read(struct net_device *dev, int phy_addr, int reg)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	volatile u32 *const mii_control_reg = &aup->mac->mii_control;
 	volatile u32 *const mii_data_reg = &aup->mac->mii_data;
 	u32 timedout = 20;
@@ -232,7 +232,7 @@ static int mdio_read(struct net_device *
 
 static void mdio_write(struct net_device *dev, int phy_addr, int reg, u16 value)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	volatile u32 *const mii_control_reg = &aup->mac->mii_control;
 	volatile u32 *const mii_data_reg = &aup->mac->mii_data;
 	u32 timedout = 20;
@@ -287,7 +287,7 @@ static int mdiobus_reset(struct mii_bus 
 
 static int mii_probe (struct net_device *dev)
 {
-	struct au1000_private *const aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup = dev->priv;
 	struct phy_device *phydev = NULL;
 
 #if defined(AU1XXX_PHY_STATIC_CONFIG)
@@ -419,7 +419,7 @@ void ReleaseDB(struct au1000_private *au
 
 static void enable_rx_tx(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (au1000_debug > 4)
 		printk(KERN_INFO "%s: enable_rx_tx\n", dev->name);
@@ -430,7 +430,7 @@ static void enable_rx_tx(struct net_devi
 
 static void hard_stop(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (au1000_debug > 4)
 		printk(KERN_INFO "%s: hard stop\n", dev->name);
@@ -442,7 +442,7 @@ static void hard_stop(struct net_device 
 static void enable_mac(struct net_device *dev, int force_reset)
 {
 	unsigned long flags;
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	spin_lock_irqsave(&aup->lock, flags);
 
@@ -461,7 +461,7 @@ static void enable_mac(struct net_device
 
 static void reset_mac_unlocked(struct net_device *dev)
 {
-	struct au1000_private *const aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup = dev->priv;
 	int i;
 
 	hard_stop(dev);
@@ -487,7 +487,7 @@ static void reset_mac_unlocked(struct ne
 
 static void reset_mac(struct net_device *dev)
 {
-	struct au1000_private *const aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup = dev->priv;
 	unsigned long flags;
 
 	if (au1000_debug > 4)
@@ -576,7 +576,7 @@ static int __init au1000_init_module(voi
 
 static int au1000_get_settings(struct net_device *dev, struct ethtool_cmd *cmd)
 {
-	struct au1000_private *aup = (struct au1000_private *)dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (aup->phy_dev)
 		return phy_ethtool_gset(aup->phy_dev, cmd);
@@ -586,7 +586,7 @@ static int au1000_get_settings(struct ne
 
 static int au1000_set_settings(struct net_device *dev, struct ethtool_cmd *cmd)
 {
-	struct au1000_private *aup = (struct au1000_private *)dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (!capable(CAP_NET_ADMIN))
 		return -EPERM;
@@ -600,7 +600,7 @@ static int au1000_set_settings(struct ne
 static void
 au1000_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	struct au1000_private *aup = (struct au1000_private *)dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	strcpy(info->driver, DRV_NAME);
 	strcpy(info->version, DRV_VERSION);
@@ -822,7 +822,7 @@ err_out:
  */
 static int au1000_init(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	u32 flags;
 	int i;
 	u32 control;
@@ -873,7 +873,7 @@ static int au1000_init(struct net_device
 static void
 au1000_adjust_link(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	struct phy_device *phydev = aup->phy_dev;
 	unsigned long flags;
 
@@ -953,7 +953,7 @@ au1000_adjust_link(struct net_device *de
 static int au1000_open(struct net_device *dev)
 {
 	int retval;
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (au1000_debug > 4)
 		printk("%s: open: dev=%p\n", dev->name, dev);
@@ -988,7 +988,7 @@ static int au1000_open(struct net_device
 static int au1000_close(struct net_device *dev)
 {
 	unsigned long flags;
-	struct au1000_private *const aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *const aup = dev->priv;
 
 	if (au1000_debug > 4)
 		printk("%s: close: dev=%p\n", dev->name, dev);
@@ -1019,7 +1019,7 @@ static void __exit au1000_cleanup_module
 	for (i = 0; i < num_ifs; i++) {
 		dev = iflist[i].dev;
 		if (dev) {
-			aup = (struct au1000_private *) dev->priv;
+			aup = dev->priv;
 			unregister_netdev(dev);
 			for (j = 0; j < NUM_RX_DMA; j++)
 				if (aup->rx_db_inuse[j])
@@ -1039,7 +1039,7 @@ static void __exit au1000_cleanup_module
 
 static void update_tx_stats(struct net_device *dev, u32 status)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	struct net_device_stats *ps = &aup->stats;
 
 	if (status & TX_FRAME_ABORTED) {
@@ -1068,7 +1068,7 @@ static void update_tx_stats(struct net_d
  */
 static void au1000_tx_ack(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	volatile tx_dma_t *ptxd;
 
 	ptxd = aup->tx_dma_ring[aup->tx_tail];
@@ -1095,7 +1095,7 @@ static void au1000_tx_ack(struct net_dev
  */
 static int au1000_tx(struct sk_buff *skb, struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	struct net_device_stats *ps = &aup->stats;
 	volatile tx_dma_t *ptxd;
 	u32 buff_stat;
@@ -1149,7 +1149,7 @@ static int au1000_tx(struct sk_buff *skb
 
 static inline void update_rx_stats(struct net_device *dev, u32 status)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	struct net_device_stats *ps = &aup->stats;
 
 	ps->rx_packets++;
@@ -1177,7 +1177,7 @@ static inline void update_rx_stats(struc
  */
 static int au1000_rx(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 	struct sk_buff *skb;
 	volatile rx_dma_t *prxd;
 	u32 buff_stat, status;
@@ -1256,7 +1256,7 @@ static int au1000_rx(struct net_device *
  */
 static irqreturn_t au1000_interrupt(int irq, void *dev_id)
 {
-	struct net_device *dev = (struct net_device *) dev_id;
+	struct net_device *dev = dev_id;
 
 	if (dev = NULL) {
 		printk(KERN_ERR "%s: isr: null dev ptr\n", dev->name);
@@ -1286,7 +1286,7 @@ static void au1000_tx_timeout(struct net
 
 static void set_rx_mode(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (au1000_debug > 4)
 		printk("%s: set_rx_mode: flags=%x\n", dev->name, dev->flags);
@@ -1318,7 +1318,7 @@ static void set_rx_mode(struct net_devic
 
 static int au1000_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	struct au1000_private *aup = (struct au1000_private *)dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (!netif_running(dev)) return -EINVAL;
 
@@ -1329,7 +1329,7 @@ static int au1000_ioctl(struct net_devic
 
 static struct net_device_stats *au1000_get_stats(struct net_device *dev)
 {
-	struct au1000_private *aup = (struct au1000_private *) dev->priv;
+	struct au1000_private *aup = dev->priv;
 
 	if (au1000_debug > 4)
 		printk("%s: au1000_get_stats: dev=%p\n", dev->name, dev);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
