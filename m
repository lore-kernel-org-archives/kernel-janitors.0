From: Colin King <colin.king@canonical.com>
Date: Sat, 11 Jan 2020 09:08:24 +0000
Subject: [PATCH][next] ath11k: avoid null pointer dereference when pointer band is null
Message-Id: <20200111090824.9999-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, John Crispin <john@phrozen.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the unlikely event that cap->supported_bands has neither
WMI_HOST_WLAN_2G_CAP set or WMI_HOST_WLAN_5G_CAP set then pointer
band is null and a null dereference occurs when assigning
band->n_iftype_data.  Move the assignment to the if blocks to
avoid this.  Cleans up static analysis warnings.

Addresses-Coverity: ("Explicit null dereference")
Fixes: 9f056ed8ee01 ("ath11k: add HE support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 556eef9881a7..4a364cfe37ed 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3520,8 +3520,8 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 static void ath11k_mac_setup_he_cap(struct ath11k *ar,
 				    struct ath11k_pdev_cap *cap)
 {
-	struct ieee80211_supported_band *band = NULL;
-	int count = 0;
+	struct ieee80211_supported_band *band;
+	int count;
 
 	if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		count = ath11k_mac_copy_he_cap(ar, cap,
@@ -3529,6 +3529,7 @@ static void ath11k_mac_setup_he_cap(struct ath11k *ar,
 					       NL80211_BAND_2GHZ);
 		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
 		band->iftype_data = ar->mac.iftype[NL80211_BAND_2GHZ];
+		band->n_iftype_data = count;
 	}
 
 	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
@@ -3537,9 +3538,8 @@ static void ath11k_mac_setup_he_cap(struct ath11k *ar,
 					       NL80211_BAND_5GHZ);
 		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
 		band->iftype_data = ar->mac.iftype[NL80211_BAND_5GHZ];
+		band->n_iftype_data = count;
 	}
-
-	band->n_iftype_data = count;
 }
 
 static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
-- 
2.24.0
