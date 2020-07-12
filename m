From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Jul 2020 17:35:51 +0000
Subject: [PATCH 2/2] nl80211: Simplify error handling path in 'nl80211_trigger_scan()'
Message-Id: <20200712173551.274448-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johannes@sipsolutions.net, davem@davemloft.net, kuba@kernel.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Re-write the end of 'nl80211_trigger_scan()' with a more standard, easy to
understand and future proof version.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/wireless/nl80211.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index a671ee5f5da7..898e5f53f263 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7993,15 +7993,18 @@ static int nl80211_trigger_scan(struct sk_buff *skb, struct genl_info *info)
 	rdev->scan_req = request;
 	err = rdev_scan(rdev, request);
 
-	if (!err) {
-		nl80211_send_scan_start(rdev, wdev);
-		if (wdev->netdev)
-			dev_hold(wdev->netdev);
-	} else {
+	if (err)
+		goto out_free;
+
+	nl80211_send_scan_start(rdev, wdev);
+	if (wdev->netdev)
+		dev_hold(wdev->netdev);
+
+	return 0;
+
  out_free:
-		rdev->scan_req = NULL;
-		kfree(request);
-	}
+	rdev->scan_req = NULL;
+	kfree(request);
 
 	return err;
 }
-- 
2.25.1
