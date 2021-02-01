From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Feb 2021 12:24:27 +0000
Subject: [PATCH] ath11k: fix a locking bug in ath11k_mac_op_start()
Message-Id: <YBfy+zc3XkiyIe6t@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

This error path leads to a Smatch warning:

    drivers/net/wireless/ath/ath11k/mac.c:4269 ath11k_mac_op_start()
    error: double unlocked '&ar->conf_mutex' (orig line 4251)

We're not holding the lock when we do the "goto err;" so it leads to a
double unlock.  We should hold the lock because the error path sets
"ar->state" so the right fix is to take the lock before doing the goto.

Fixes: c83c500b55b6 ("ath11k: enable idle power save mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1608f64ea95..12e981e9e3d7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4259,6 +4259,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 						1, pdev->pdev_id);
 		if (ret) {
 			ath11k_err(ab, "failed to enable idle ps: %d\n", ret);
+			mutex_lock(&ar->conf_mutex);
 			goto err;
 		}
 	}
-- 
2.29.2
