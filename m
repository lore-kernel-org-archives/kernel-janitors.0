From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 09:32:50 +0000
Subject: [PATCH] ath10k: remove set but not used variable 'num_tdls_vifs'
Message-Id: <1541669570-110540-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, ath10k@lists.infradead.org, netdev@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_sta_state':
drivers/net/wireless/ath/ath10k/mac.c:6238:7: warning:
 variable 'num_tdls_vifs' set but not used [-Wunused-but-set-variable]

'num_tdls_vifs' not used any more after
  9a993cc1ea95 ("ath10k: fix the logic of limiting tdls peer counts")

Also, remove the single called function ath10k_mac_tdls_vifs_count
and ath10k_mac_tdls_vifs_count_iter.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a1c2801..6006f7a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5754,30 +5754,6 @@ static int ath10k_mac_tdls_vif_stations_count(struct ieee80211_hw *hw,
 	return data.num_tdls_stations;
 }
 
-static void ath10k_mac_tdls_vifs_count_iter(void *data, u8 *mac,
-					    struct ieee80211_vif *vif)
-{
-	struct ath10k_vif *arvif = (void *)vif->drv_priv;
-	int *num_tdls_vifs = data;
-
-	if (vif->type != NL80211_IFTYPE_STATION)
-		return;
-
-	if (ath10k_mac_tdls_vif_stations_count(arvif->ar->hw, vif) > 0)
-		(*num_tdls_vifs)++;
-}
-
-static int ath10k_mac_tdls_vifs_count(struct ieee80211_hw *hw)
-{
-	int num_tdls_vifs = 0;
-
-	ieee80211_iterate_active_interfaces_atomic(hw,
-						   IEEE80211_IFACE_ITER_NORMAL,
-						   ath10k_mac_tdls_vifs_count_iter,
-						   &num_tdls_vifs);
-	return num_tdls_vifs;
-}
-
 static int ath10k_hw_scan(struct ieee80211_hw *hw,
 			  struct ieee80211_vif *vif,
 			  struct ieee80211_scan_request *hw_req)
@@ -6285,7 +6261,6 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		 */
 		enum wmi_peer_type peer_type = WMI_PEER_TYPE_DEFAULT;
 		u32 num_tdls_stations;
-		u32 num_tdls_vifs;
 
 		ath10k_dbg(ar, ATH10K_DBG_MAC,
 			   "mac vdev %d peer create %pM (new sta) sta %d / %d peer %d / %d\n",
@@ -6301,7 +6276,6 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		}
 
 		num_tdls_stations = ath10k_mac_tdls_vif_stations_count(hw, vif);
-		num_tdls_vifs = ath10k_mac_tdls_vifs_count(hw);
 
 		if (sta->tdls) {
 			if (num_tdls_stations >= ar->max_num_tdls_vdevs) {
