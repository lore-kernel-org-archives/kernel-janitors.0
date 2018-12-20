From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 20 Dec 2018 02:43:44 +0000
Subject: [PATCH -next] scsi: fcoe: remove set but not used variable 'port'
Message-Id: <1545273824-132149-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/fcoe/fcoe.c: In function 'fcoe_recv_frame':
drivers/scsi/fcoe/fcoe.c:1672:20: warning:
 variable 'port' set but not used [-Wunused-but-set-variable]

drivers/scsi/fcoe/fcoe.c: In function 'fcoe_device_notification':
drivers/scsi/fcoe/fcoe.c:1861:20: warning:
 variable 'port' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/fcoe/fcoe.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index 4961ae4..cd19be3 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -1669,7 +1669,6 @@ static void fcoe_recv_frame(struct sk_buff *skb)
 	struct fc_stats *stats;
 	struct fcoe_crc_eof crc_eof;
 	struct fc_frame *fp;
-	struct fcoe_port *port;
 	struct fcoe_hdr *hp;
 
 	fr = fcoe_dev_from_skb(skb);
@@ -1687,7 +1686,6 @@ static void fcoe_recv_frame(struct sk_buff *skb)
 			skb_end_pointer(skb), skb->csum,
 			skb->dev ? skb->dev->name : "<NULL>");
 
-	port = lport_priv(lport);
 	skb_linearize(skb); /* check for skb_is_nonlinear is within skb_linearize */
 
 	/*
@@ -1858,7 +1856,6 @@ static int fcoe_device_notification(struct notifier_block *notifier,
 	struct net_device *netdev = netdev_notifier_info_to_dev(ptr);
 	struct fcoe_ctlr *ctlr;
 	struct fcoe_interface *fcoe;
-	struct fcoe_port *port;
 	struct fc_stats *stats;
 	u32 link_possible = 1;
 	u32 mfs;
@@ -1896,7 +1893,6 @@ static int fcoe_device_notification(struct notifier_block *notifier,
 		break;
 	case NETDEV_UNREGISTER:
 		list_del(&fcoe->list);
-		port = lport_priv(ctlr->lp);
 		fcoe_vport_remove(lport);
 		mutex_lock(&fcoe_config_mutex);
 		fcoe_if_destroy(lport);
