From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2020 11:04:32 +0000
Subject: [PATCH] ath11k: dp: clean up a variable name
Message-Id: <X9s7QAHDM2OTIo3a@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

The "&ar->ab->base_lock" and "&ab->base_lock" locks are the same lock
but it's nicer to use the same name consistently everywhere.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 205c0f1a40e9..1b6e663ae784 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1163,7 +1163,7 @@ int ath11k_dp_peer_rx_pn_replay_config(struct ath11k_vif *arvif,
 		}
 	}
 
-	spin_unlock_bh(&ar->ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	return ret;
 }
-- 
2.29.2
