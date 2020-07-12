From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Jul 2020 17:35:39 +0000
Subject: [PATCH 1/2] nl80211: Remove a misleading label in 'nl80211_trigger_scan()'
Message-Id: <20200712173539.274395-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johannes@sipsolutions.net, davem@davemloft.net, kuba@kernel.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Since commit 5fe231e87372 ("cfg80211: vastly simplify locking"), the
'unlock' label at the end of 'nl80211_trigger_scan()' is useless and
misleading, because nothing is unlocked there.

Direct return can be used instead of 'err = -<error code>; goto unlock;'
construction.

Remove this label and simplify code accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/wireless/nl80211.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 98bfc6a1c806..a671ee5f5da7 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7774,10 +7774,8 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 	if (!rdev->ops->scan)
 		return -EOPNOTSUPP;
 
-	if (rdev->scan_req || rdev->scan_msg) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (rdev->scan_req || rdev->scan_msg)
+		return -EBUSY;
 
 	if (info->attrs[NL80211_ATTR_SCAN_FREQ_KHZ]) {
 		if (!wiphy_ext_feature_isset(wiphy,
@@ -7790,10 +7788,8 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 
 	if (scan_freqs) {
 		n_channels = validate_scan_freqs(scan_freqs);
-		if (!n_channels) {
-			err = -EINVAL;
-			goto unlock;
-		}
+		if (!n_channels)
+			return -EINVAL;
 	} else {
 		n_channels = ieee80211_get_num_supported_channels(wiphy);
 	}
@@ -7802,29 +7798,23 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 		nla_for_each_nested(attr, info->attrs[NL80211_ATTR_SCAN_SSIDS], tmp)
 			n_ssids++;
 
-	if (n_ssids > wiphy->max_scan_ssids) {
-		err = -EINVAL;
-		goto unlock;
-	}
+	if (n_ssids > wiphy->max_scan_ssids)
+		return -EINVAL;
 
 	if (info->attrs[NL80211_ATTR_IE])
 		ie_len = nla_len(info->attrs[NL80211_ATTR_IE]);
 	else
 		ie_len = 0;
 
-	if (ie_len > wiphy->max_scan_ie_len) {
-		err = -EINVAL;
-		goto unlock;
-	}
+	if (ie_len > wiphy->max_scan_ie_len)
+		return -EINVAL;
 
 	request = kzalloc(sizeof(*request)
 			+ sizeof(*request->ssids) * n_ssids
 			+ sizeof(*request->channels) * n_channels
 			+ ie_len, GFP_KERNEL);
-	if (!request) {
-		err = -ENOMEM;
-		goto unlock;
-	}
+	if (!request)
+		return -ENOMEM;
 
 	if (n_ssids)
 		request->ssids = (void *)&request->channels[n_channels];
@@ -8013,7 +8003,6 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 		kfree(request);
 	}
 
- unlock:
 	return err;
 }
 
-- 
2.25.1
