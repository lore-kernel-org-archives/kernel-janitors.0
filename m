From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Feb 2011 01:56:53 +0000
Subject: [patch] iwlwifi: remove duplicate initialization
Message-Id: <20110226015653.GC18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>, Meenakshi Venkataraman <meenakshi.venkataraman@intel.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

rate_mask is initialized again later so this can be removed.  Btw, if 
rate_control_send_low(sta, priv_sta, txrc) returns false, that means
that "sta" is non-NULL.  That's why the second initialization of
rate_mask is a little simpler than the first.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/iwlegacy/iwl-3945-rs.c b/drivers/net/wireless/iwlegacy/iwl-3945-rs.c
index 4fabc54..977bd24 100644
--- a/drivers/net/wireless/iwlegacy/iwl-3945-rs.c
+++ b/drivers/net/wireless/iwlegacy/iwl-3945-rs.c
@@ -644,7 +644,7 @@ static void iwl3945_rs_get_rate(void *priv_r, struct ieee80211_sta *sta,
 	u32 fail_count;
 	s8 scale_action = 0;
 	unsigned long flags;
-	u16 rate_mask = sta ? sta->supp_rates[sband->band] : 0;
+	u16 rate_mask;
 	s8 max_rate_idx = -1;
 	struct iwl_priv *priv __maybe_unused = (struct iwl_priv *)priv_r;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
