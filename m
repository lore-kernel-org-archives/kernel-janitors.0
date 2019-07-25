From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 25 Jul 2019 19:13:28 +0000
Subject: [PATCH] mac80211_hwsim: Fix a typo in the name of function 'mac80211_hswim_he_capab()'
Message-Id: <20190725191328.18010-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johannes@sipsolutions.net, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This function name should be 'mac80211_hwsim_he_capab()' (s wand w
switched) to be consistent with the rest of the file.
Fix and use it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/mac80211_hwsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/mac80211_hwsim.c
index b5274d1f30fa..64b0e51f8e8d 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -2595,7 +2595,7 @@ static const struct ieee80211_sband_iftype_data he_capa_5ghz = {
 	},
 };
 
-static void mac80211_hswim_he_capab(struct ieee80211_supported_band *sband)
+static void mac80211_hwsim_he_capab(struct ieee80211_supported_band *sband)
 {
 	if (sband->band = NL80211_BAND_2GHZ)
 		sband->iftype_data @@ -2898,7 +2898,7 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 		sband->ht_cap.mcs.rx_mask[1] = 0xff;
 		sband->ht_cap.mcs.tx_params = IEEE80211_HT_MCS_TX_DEFINED;
 
-		mac80211_hswim_he_capab(sband);
+		mac80211_hwsim_he_capab(sband);
 
 		hw->wiphy->bands[band] = sband;
 	}
-- 
2.20.1
