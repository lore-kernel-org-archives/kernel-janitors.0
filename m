From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 10:46:21 +0000
Subject: [PATCH net-next] ath11k: fix error return code in ath11k_dp_alloc()
Message-Id: <20200427104621.23752-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath11k@lists.infradead.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: d0998eb84ed3 ("ath11k: optimise ath11k_dp_tx_completion_handler")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath11k/dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 50350f77b309..2f35d325f7a5 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -909,8 +909,10 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 		dp->tx_ring[i].tx_status_head = 0;
 		dp->tx_ring[i].tx_status_tail = DP_TX_COMP_RING_SIZE - 1;
 		dp->tx_ring[i].tx_status = kmalloc(size, GFP_KERNEL);
-		if (!dp->tx_ring[i].tx_status)
+		if (!dp->tx_ring[i].tx_status) {
+			ret = -ENOMEM;
 			goto fail_cmn_srng_cleanup;
+		}
 	}
 
 	for (i = 0; i < HAL_DSCP_TID_MAP_TBL_NUM_ENTRIES_MAX; i++)
