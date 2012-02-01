From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Feb 2012 07:42:11 +0000
Subject: [patch -next] mac80211: off by one in mcs mask handling
Message-Id: <20120201074210.GA22179@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, Simon Wunderlich <simon.wunderlich@s2003.tu-chemnitz.de>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

"ridx" is used as an index into the mcs_mask[] array which has
IEEE80211_HT_MCS_MASK_LEN elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/rate.c b/net/mac80211/rate.c
index 3fef26d..22fc28e 100644
--- a/net/mac80211/rate.c
+++ b/net/mac80211/rate.c
@@ -324,7 +324,7 @@ static bool rate_idx_match_mcs_mask(struct ieee80211_tx_rate *rate,
 	rbit = rate->idx % 8;
 
 	/* sanity check */
-	if (ridx < 0 || ridx > IEEE80211_HT_MCS_MASK_LEN)
+	if (ridx < 0 || ridx >= IEEE80211_HT_MCS_MASK_LEN)
 		return false;
 
 	/* See whether the selected rate or anything below it is allowed. */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index c910b07..7db14b4 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -5408,7 +5408,7 @@ static bool ht_rateset_to_mask(struct ieee80211_supported_band *sband,
 		rbit = BIT(rates[i] % 8);
 
 		/* check validity */
-		if ((ridx < 0) || (ridx > IEEE80211_HT_MCS_MASK_LEN))
+		if ((ridx < 0) || (ridx >= IEEE80211_HT_MCS_MASK_LEN))
 			return false;
 
 		/* check availability */
