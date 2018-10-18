From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 07:36:19 +0000
Subject: [PATCH] ath10k: Fixup extended per sta tx statistics
Message-Id: <20181018073619.c2cxj74enkramhjr@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

I had a couple concerns with this code.  First, we definitely need to
set the error code if the kzalloc() fails.  Secondly, I was worried that
if we didn't set "arsta->tx_stats" to NULL after freeing it, then it
looks to me like it might lead to a use after free.  I can't test that,
but it's harmless to set it to NULL so I did.

Fixes: a904417fc876 ("ath10k: add extended per sta tx statistics support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a1c2801ded10..2b8c8bf80b0d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6296,8 +6296,10 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		if (ath10k_debug_is_extd_tx_stats_enabled(ar)) {
 			arsta->tx_stats = kzalloc(sizeof(*arsta->tx_stats),
 						  GFP_KERNEL);
-			if (!arsta->tx_stats)
+			if (!arsta->tx_stats) {
+				ret = -ENOMEM;
 				goto exit;
+			}
 		}
 
 		num_tdls_stations = ath10k_mac_tdls_vif_stations_count(hw, vif);
@@ -6385,8 +6387,10 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			   "mac vdev %d peer delete %pM sta %pK (sta gone)\n",
 			   arvif->vdev_id, sta->addr, sta);
 
-		if (ath10k_debug_is_extd_tx_stats_enabled(ar))
+		if (ath10k_debug_is_extd_tx_stats_enabled(ar)) {
 			kfree(arsta->tx_stats);
+			arsta->tx_stats = NULL;
+		}
 
 		if (sta->tdls) {
 			ret = ath10k_mac_tdls_peer_update(ar, arvif->vdev_id,
-- 
2.11.0
