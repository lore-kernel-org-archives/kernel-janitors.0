From: Suresh Jayaraman <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 14:40:36 +0000
Subject: [KJ] [PATCH] wireless: Remove unnecessary cast of return value of
Message-Id: <1183040916.3792.57.camel@blr-suresh.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of kmalloc return value in wireless subsystem.

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

 ipw2100.c          |   22 +++++++++-------------
 libertas/debugfs.c |    2 +-
 libertas/ethtool.c |    3 +--
 zd1211rw/zd_chip.c |    3 +--
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ipw2100.c b/drivers/net/wireless/ipw2100.c
index d51daf8..ec243c6 100644
--- a/drivers/net/wireless/ipw2100.c
+++ b/drivers/net/wireless/ipw2100.c
@@ -3362,11 +3362,9 @@ static int ipw2100_msg_allocate(struct ipw2100_priv *priv)
 	void *v;
 	dma_addr_t p;
 
-	priv->msg_buffers -	    (struct ipw2100_tx_packet *)kmalloc(IPW_COMMAND_POOL_SIZE *
-						sizeof(struct
-						       ipw2100_tx_packet),
-						GFP_KERNEL);
+	priv->msg_buffers = kmalloc(IPW_COMMAND_POOL_SIZE *
+					sizeof(struct ipw2100_tx_packet),
+					GFP_KERNEL);
 	if (!priv->msg_buffers) {
 		printk(KERN_ERR DRV_NAME ": %s: PCI alloc failed for msg "
 		       "buffers.\n", priv->net_dev->name);
@@ -4394,11 +4392,9 @@ static int ipw2100_tx_allocate(struct ipw2100_priv *priv)
 		return err;
 	}
 
-	priv->tx_buffers -	    (struct ipw2100_tx_packet *)kmalloc(TX_PENDED_QUEUE_LENGTH *
-						sizeof(struct
-						       ipw2100_tx_packet),
-						GFP_ATOMIC);
+	priv->tx_buffers = kmalloc(TX_PENDED_QUEUE_LENGTH *
+					sizeof(struct ipw2100_tx_packet),
+					GFP_ATOMIC);
 	if (!priv->tx_buffers) {
 		printk(KERN_ERR DRV_NAME
 		       ": %s: alloc failed form tx buffers.\n",
@@ -4547,9 +4543,9 @@ static int ipw2100_rx_allocate(struct ipw2100_priv *priv)
 	/*
 	 * allocate packets
 	 */
-	priv->rx_buffers = (struct ipw2100_rx_packet *)
-	    kmalloc(RX_QUEUE_LENGTH * sizeof(struct ipw2100_rx_packet),
-		    GFP_KERNEL);
+	priv->rx_buffers = kmalloc(RX_QUEUE_LENGTH *
+					sizeof(struct ipw2100_rx_packet),
+					GFP_KERNEL);
 	if (!priv->rx_buffers) {
 		IPW_DEBUG_INFO("can't allocate rx packet buffer table\n");
 
diff --git a/drivers/net/wireless/libertas/debugfs.c b/drivers/net/wireless/libertas/debugfs.c
index 715cbda..6ade63e 100644
--- a/drivers/net/wireless/libertas/debugfs.c
+++ b/drivers/net/wireless/libertas/debugfs.c
@@ -1839,7 +1839,7 @@ static ssize_t wlan_debugfs_write(struct file *f, const char __user *buf,
 	char *p2;
 	struct debug_data *d = (struct debug_data *)f->private_data;
 
-	pdata = (char *)kmalloc(cnt, GFP_KERNEL);
+	pdata = kmalloc(cnt, GFP_KERNEL);
 	if (pdata = NULL)
 		return 0;
 
diff --git a/drivers/net/wireless/libertas/ethtool.c b/drivers/net/wireless/libertas/ethtool.c
index 96f1974..7dad493 100644
--- a/drivers/net/wireless/libertas/ethtool.c
+++ b/drivers/net/wireless/libertas/ethtool.c
@@ -60,8 +60,7 @@ static int libertas_ethtool_get_eeprom(struct net_device *dev,
 
 //      mutex_lock(&priv->mutex);
 
-	adapter->prdeeprom -		    (char *)kmalloc(eeprom->len+sizeof(regctrl), GFP_KERNEL);
+	adapter->prdeeprom = kmalloc(eeprom->len+sizeof(regctrl), GFP_KERNEL);
 	if (!adapter->prdeeprom)
 		return -ENOMEM;
 	memcpy(adapter->prdeeprom, &regctrl, sizeof(regctrl));
diff --git a/drivers/net/wireless/zd1211rw/zd_chip.c b/drivers/net/wireless/zd1211rw/zd_chip.c
index 95b4a2a..eb57913 100644
--- a/drivers/net/wireless/zd1211rw/zd_chip.c
+++ b/drivers/net/wireless/zd1211rw/zd_chip.c
@@ -114,8 +114,7 @@ int zd_ioread32v_locked(struct zd_chip *chip, u32 *values, const zd_addr_t *addr
 
 	/* Allocate a single memory block for values and addresses. */
 	count16 = 2*count;
-	a16 = (zd_addr_t *) kmalloc(count16 * (sizeof(zd_addr_t) + sizeof(u16)),
-		                   GFP_KERNEL);
+	a16 = kmalloc(count16 * (sizeof(zd_addr_t) + sizeof(u16)), GFP_KERNEL);
 	if (!a16) {
 		dev_dbg_f(zd_chip_dev(chip),
 			  "error ENOMEM in allocation of a16\n");

-- 
Suresh Jayaraman <sjayaraman@novell.com>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
