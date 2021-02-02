From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2021 11:31:38 +0000
Subject: [PATCH v2] ath11k: fix a locking bug in ath11k_mac_op_start()
Message-Id: <YBk4GoeE+yc0wlJH@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Peter Oh <peter.oh@eero.com>
Cc: kernel-janitors@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

This error path leads to a Smatch warning:

	drivers/net/wireless/ath/ath11k/mac.c:4269 ath11k_mac_op_start()
	error: double unlocked '&ar->conf_mutex' (orig line 4251)

We're not holding the lock when we do the "goto err;" so it leads to a
double unlock.  The fix is to hold the lock for a little longer.

Fixes: c83c500b55b6 ("ath11k: enable idle power save mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: reviewers were concern that v1 was racy

 drivers/net/wireless/ath/ath11k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1608f64ea95..464d3425488b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4248,8 +4248,6 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 	/* Configure the hash seed for hash based reo dest ring selection */
 	ath11k_wmi_pdev_lro_cfg(ar, ar->pdev->pdev_id);
 
-	mutex_unlock(&ar->conf_mutex);
-
 	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
 			   &ab->pdevs[ar->pdev_idx]);
 
@@ -4262,6 +4260,9 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 			goto err;
 		}
 	}
+
+	mutex_unlock(&ar->conf_mutex);
+
 	return 0;
 
 err:
-- 
2.30.0
