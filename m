From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 15:47:24 +0000
Subject: [PATCH] net: vxge: remove redundant assignments and pointers
Message-Id: <20171107154724.4494-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Mason <jdmason@kudzu.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several pointers that are being assigned but never read
so remove these as they are redundant.  Also remove an assignment
to function_mode that is never read. Cleans up several clang
warnings:

vxge-main.c:1139:2: warning: Value stored to 'hldev' is never read
vxge-main.c:1294:2: warning: Value stored to 'hldev' is never read
vxge-main.c:2188:2: warning: Value stored to 'dev' is never read
vxge-main.c:2188:2: warning: Value stored to 'dev' is never read
vxge-main.c:2723:2: warning: Value stored to 'function_mode' is
never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/neterion/vxge/vxge-main.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/neterion/vxge/vxge-main.c b/drivers/net/ethernet/neterion/vxge/vxge-main.c
index f6ab1d6522a9..fe7e0e1dd01d 100644
--- a/drivers/net/ethernet/neterion/vxge/vxge-main.c
+++ b/drivers/net/ethernet/neterion/vxge/vxge-main.c
@@ -1122,7 +1122,6 @@ static void vxge_set_multicast(struct net_device *dev)
 	struct netdev_hw_addr *ha;
 	struct vxgedev *vdev;
 	int i, mcast_cnt = 0;
-	struct __vxge_hw_device *hldev;
 	struct vxge_vpath *vpath;
 	enum vxge_hw_status status = VXGE_HW_OK;
 	struct macInfo mac_info;
@@ -1136,7 +1135,6 @@ static void vxge_set_multicast(struct net_device *dev)
 		"%s:%d", __func__, __LINE__);
 
 	vdev = netdev_priv(dev);
-	hldev = vdev->devh;
 
 	if (unlikely(!is_vxge_card_up(vdev)))
 		return;
@@ -1283,7 +1281,6 @@ static int vxge_set_mac_addr(struct net_device *dev, void *p)
 {
 	struct sockaddr *addr = p;
 	struct vxgedev *vdev;
-	struct __vxge_hw_device *hldev;
 	enum vxge_hw_status status = VXGE_HW_OK;
 	struct macInfo mac_info_new, mac_info_old;
 	int vpath_idx = 0;
@@ -1291,7 +1288,6 @@ static int vxge_set_mac_addr(struct net_device *dev, void *p)
 	vxge_debug_entryexit(VXGE_TRACE, "%s:%d", __func__, __LINE__);
 
 	vdev = netdev_priv(dev);
-	hldev = vdev->devh;
 
 	if (!is_valid_ether_addr(addr->sa_data))
 		return -EINVAL;
@@ -2177,7 +2173,6 @@ static void adaptive_coalesce_rx_interrupts(struct vxge_ring *ring)
  */
 static irqreturn_t vxge_isr_napi(int irq, void *dev_id)
 {
-	struct net_device *dev;
 	struct __vxge_hw_device *hldev;
 	u64 reason;
 	enum vxge_hw_status status;
@@ -2185,7 +2180,6 @@ static irqreturn_t vxge_isr_napi(int irq, void *dev_id)
 
 	vxge_debug_intr(VXGE_TRACE, "%s:%d", __func__, __LINE__);
 
-	dev = vdev->ndev;
 	hldev = pci_get_drvdata(vdev->pdev);
 
 	if (pci_channel_offline(vdev->pdev))
@@ -2713,14 +2707,13 @@ static int vxge_open(struct net_device *dev)
 	struct vxge_vpath *vpath;
 	int ret = 0;
 	int i;
-	u64 val64, function_mode;
+	u64 val64;
 
 	vxge_debug_entryexit(VXGE_TRACE,
 		"%s: %s:%d", dev->name, __func__, __LINE__);
 
 	vdev = netdev_priv(dev);
 	hldev = pci_get_drvdata(vdev->pdev);
-	function_mode = vdev->config.device_hw_info.function_mode;
 
 	/* make sure you have link off by default every time Nic is
 	 * initialized */
-- 
2.14.1

