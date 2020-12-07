From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Dec 2020 17:54:28 +0000
Subject: [PATCH] ath11k: unlock on error path in ath11k_mac_op_add_interface()
Message-Id: <X85sVGVP/0XvlrEJ@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Ritesh Singh <ritesi@codeaurora.org>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

These error paths need to drop the &ar->conf_mutex before returning.

Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ebed24ec7368..12cc16003e30 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4615,13 +4615,13 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
 				    arvif->vdev_id, vif->addr);
-			return ret;
+			goto err;
 		}
 
 		ret = ath11k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						       vif->addr);
 		if (ret)
-			return ret;
+			goto err;
 
 		ar->num_peers--;
 	}
-- 
2.29.2
