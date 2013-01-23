From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Jan 2013 19:26:05 +0000
Subject: [patch] NTB: fix pointer math issues
Message-Id: <20130123192605.GA11121@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Mason <jon.mason@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

->remote_rx_info and ->rx_info are struct ntb_rx_info pointers.  If we
add sizeof(struct ntb_rx_info) then it goes too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
index e0bdfd7..676ee16 100644
--- a/drivers/ntb/ntb_transport.c
+++ b/drivers/ntb/ntb_transport.c
@@ -486,7 +486,7 @@ static void ntb_transport_setup_qp_mw(struct ntb_transport *nt,
 			     (qp_num / NTB_NUM_MW * rx_size);
 	rx_size -= sizeof(struct ntb_rx_info);
 
-	qp->rx_buff = qp->remote_rx_info + sizeof(struct ntb_rx_info);
+	qp->rx_buff = qp->remote_rx_info + 1;
 	qp->rx_max_frame = min(transport_mtu, rx_size);
 	qp->rx_max_entry = rx_size / qp->rx_max_frame;
 	qp->rx_index = 0;
@@ -780,7 +780,7 @@ static void ntb_transport_init_queue(struct ntb_transport *nt,
 		      (qp_num / NTB_NUM_MW * tx_size);
 	tx_size -= sizeof(struct ntb_rx_info);
 
-	qp->tx_mw = qp->rx_info + sizeof(struct ntb_rx_info);
+	qp->tx_mw = qp->rx_info + 1;
 	qp->tx_max_frame = min(transport_mtu, tx_size);
 	qp->tx_max_entry = tx_size / qp->tx_max_frame;
 	qp->tx_index = 0;
