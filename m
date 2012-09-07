From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 07 Sep 2012 01:42:29 +0000
Subject: [PATCH] mac80211: quiet gcc warning on 'uninitialized' chan_pwr
Message-Id: <20120907014229.GA14034@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Quiet a false gcc warning:

net/mac80211/mlme.c: In function 'ieee80211_rx_mgmt_beacon':
net/mac80211/mlme.c:903:43: warning: 'chan_pwr' may be used uninitialized in this function [-Wmaybe-uninitialized]

Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index bf19a2a..58983a8 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -868,7 +868,7 @@ static void ieee80211_handle_pwr_constr(struct ieee80211_sub_if_data *sdata,
 {
 	struct ieee80211_country_ie_triplet *triplet;
 	int chan = ieee80211_frequency_to_channel(channel->center_freq);
-	int chan_pwr;
+	int uninitialized_var(chan_pwr);
 	bool have_chan_pwr = false;
 
 	/* Invalid IE */
