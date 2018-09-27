From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Sep 2018 17:04:54 +0000
Subject: [PATCH] qed: fix spelling mistake "b_cb_registred" -> "b_cb_registered"
Message-Id: <20180927170454.7829-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake struct field name, rename it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_ll2.c | 12 ++++++------
 drivers/net/ethernet/qlogic/qed/qed_ll2.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_ll2.c b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
index 14ac9cab2653..da13117a604a 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_ll2.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
@@ -63,8 +63,8 @@
 #include "qed_sp.h"
 #include "qed_rdma.h"
 
-#define QED_LL2_RX_REGISTERED(ll2)	((ll2)->rx_queue.b_cb_registred)
-#define QED_LL2_TX_REGISTERED(ll2)	((ll2)->tx_queue.b_cb_registred)
+#define QED_LL2_RX_REGISTERED(ll2)	((ll2)->rx_queue.b_cb_registered)
+#define QED_LL2_TX_REGISTERED(ll2)	((ll2)->tx_queue.b_cb_registered)
 
 #define QED_LL2_TX_SIZE (256)
 #define QED_LL2_RX_SIZE (4096)
@@ -1404,7 +1404,7 @@ int qed_ll2_acquire_connection(void *cxt, struct qed_ll2_acquire_data *data)
 				    &p_hwfn->p_ll2_info[i],
 				    &p_ll2_info->rx_queue.rx_sb_index,
 				    &p_ll2_info->rx_queue.p_fw_cons);
-		p_ll2_info->rx_queue.b_cb_registred = true;
+		p_ll2_info->rx_queue.b_cb_registered = true;
 	}
 
 	if (data->input.tx_num_desc) {
@@ -1413,7 +1413,7 @@ int qed_ll2_acquire_connection(void *cxt, struct qed_ll2_acquire_data *data)
 				    &p_hwfn->p_ll2_info[i],
 				    &p_ll2_info->tx_queue.tx_sb_index,
 				    &p_ll2_info->tx_queue.p_fw_cons);
-		p_ll2_info->tx_queue.b_cb_registred = true;
+		p_ll2_info->tx_queue.b_cb_registered = true;
 	}
 
 	*data->p_connection_handle = i;
@@ -1929,7 +1929,7 @@ int qed_ll2_terminate_connection(void *cxt, u8 connection_handle)
 
 	/* Stop Tx & Rx of connection, if needed */
 	if (QED_LL2_TX_REGISTERED(p_ll2_conn)) {
-		p_ll2_conn->tx_queue.b_cb_registred = false;
+		p_ll2_conn->tx_queue.b_cb_registered = false;
 		smp_wmb(); /* Make sure this is seen by ll2_lb_rxq_completion */
 		rc = qed_sp_ll2_tx_queue_stop(p_hwfn, p_ll2_conn);
 		if (rc)
@@ -1940,7 +1940,7 @@ int qed_ll2_terminate_connection(void *cxt, u8 connection_handle)
 	}
 
 	if (QED_LL2_RX_REGISTERED(p_ll2_conn)) {
-		p_ll2_conn->rx_queue.b_cb_registred = false;
+		p_ll2_conn->rx_queue.b_cb_registered = false;
 		smp_wmb(); /* Make sure this is seen by ll2_lb_rxq_completion */
 		rc = qed_sp_ll2_rx_queue_stop(p_hwfn, p_ll2_conn);
 		if (rc)
diff --git a/drivers/net/ethernet/qlogic/qed/qed_ll2.h b/drivers/net/ethernet/qlogic/qed/qed_ll2.h
index f65817012e97..1a5c1ae01474 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_ll2.h
+++ b/drivers/net/ethernet/qlogic/qed/qed_ll2.h
@@ -79,7 +79,7 @@ struct qed_ll2_rx_queue {
 	struct qed_chain rxq_chain;
 	struct qed_chain rcq_chain;
 	u8 rx_sb_index;
-	bool b_cb_registred;
+	bool b_cb_registered;
 	__le16 *p_fw_cons;
 	struct list_head active_descq;
 	struct list_head free_descq;
@@ -93,7 +93,7 @@ struct qed_ll2_tx_queue {
 	spinlock_t lock;
 	struct qed_chain txq_chain;
 	u8 tx_sb_index;
-	bool b_cb_registred;
+	bool b_cb_registered;
 	__le16 *p_fw_cons;
 	struct list_head active_descq;
 	struct list_head free_descq;
-- 
2.17.1
