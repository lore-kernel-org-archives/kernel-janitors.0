From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Feb 2011 19:03:35 +0000
Subject: [patch] mac80211: remove unneeded check
Message-Id: <20110207190335.GK4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

"ap" is the address of sdata->u.ap so it can never be NULL here.  Also
we dereferenced it on the previous line.  I removed the check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index f305835..ce01bee 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2242,7 +2242,7 @@ struct sk_buff *ieee80211_beacon_get_tim(struct ieee80211_hw *hw,
 	if (sdata->vif.type = NL80211_IFTYPE_AP) {
 		ap = &sdata->u.ap;
 		beacon = rcu_dereference(ap->beacon);
-		if (ap && beacon) {
+		if (beacon) {
 			/*
 			 * headroom, head length,
 			 * tail length and maximum TIM length
