From: Dan Carpenter <error27@gmail.com>
Date: Fri, 29 Jul 2011 08:52:18 +0000
Subject: [patch] cfg80211: off by one in nl80211_trigger_scan()
Message-Id: <20110729085217.GG3752@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, "open list:CFG80211 and NL80211" <linux-wireless@vger.kernel.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

The test is off by one so we'd read past the end of the
wiphy->bands[] array on the next line.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 28d2aa1..e83e7fe 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3464,7 +3464,7 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 				    tmp) {
 			enum ieee80211_band band = nla_type(attr);
 
-			if (band < 0 || band > IEEE80211_NUM_BANDS) {
+			if (band < 0 || band >= IEEE80211_NUM_BANDS) {
 				err = -EINVAL;
 				goto out_free;
 			}
