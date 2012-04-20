From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 06:44:44 +0000
Subject: [patch 2/2] ath6kl: fix an indenting issue
Message-Id: <20120420064444.GD22649@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This is supposed to be pushed in one indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath6kl/htc_mbox.c b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
index 065e615..d82020e 100644
--- a/drivers/net/wireless/ath/ath6kl/htc_mbox.c
+++ b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
@@ -793,16 +793,17 @@ static void ath6kl_htc_tx_bundle(struct htc_endpoint *endpoint,
 				 * itself
 				 */
 				txb_mask = ((1 << ac) - 1);
-		/*
-		 * when the scatter request resources drop below a
-		 * certain threshold, disable Tx bundling for all
-		 * AC's with priority lower than the current requesting
-		 * AC. Otherwise re-enable Tx bundling for them
-		 */
-		if (scat_req->scat_q_depth < ATH6KL_SCATTER_REQS)
-			target->tx_bndl_mask &= ~txb_mask;
-		else
-			target->tx_bndl_mask |= txb_mask;
+
+			/*
+			 * when the scatter request resources drop below a
+			 * certain threshold, disable Tx bundling for all
+			 * AC's with priority lower than the current requesting
+			 * AC. Otherwise re-enable Tx bundling for them
+			 */
+			if (scat_req->scat_q_depth < ATH6KL_SCATTER_REQS)
+				target->tx_bndl_mask &= ~txb_mask;
+			else
+				target->tx_bndl_mask |= txb_mask;
 		}
 
 		ath6kl_dbg(ATH6KL_DBG_HTC, "htc tx pkts to scatter: %d\n",
