From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Dec 2019 10:47:54 +0000
Subject: [PATCH] ath11k: delete a stray unlock in ath11k_dbg_htt_stats_req()
Message-Id: <20191213104754.2lwrq2qqokycjjbm@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org

The callers unlock this lock so this error path has a double unlock.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 27b301bc1a1b..4b1b1ecd5eae 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4287,7 +4287,6 @@ int ath11k_dbg_htt_stats_req(struct ath11k *ar)
 	ret = ath11k_dp_tx_htt_h2t_ext_stats_req(ar, type, &cfg_params, cookie);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to send htt stats request: %d\n", ret);
-		mutex_unlock(&ar->conf_mutex);
 		return ret;
 	}
 
-- 
2.11.0
