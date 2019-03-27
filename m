From: Colin King <colin.king@canonical.com>
Date: Wed, 27 Mar 2019 18:35:45 +0000
Subject: [PATCH] cfg80211: remove redundant zero check on variable 'changed'
Message-Id: <20190327183545.20631-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The zero check on variable changed is redundant as it must be
between 1 and 3 at the end of the proceeding if statement block.
Remove the redundant check.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/wireless/wext-compat.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/wireless/wext-compat.c b/net/wireless/wext-compat.c
index d522787c7354..46e4d69db845 100644
--- a/net/wireless/wext-compat.c
+++ b/net/wireless/wext-compat.c
@@ -353,9 +353,6 @@ static int cfg80211_wext_siwretry(struct net_device *dev,
 		changed |= WIPHY_PARAM_RETRY_SHORT;
 	}
 
-	if (!changed)
-		return 0;
-
 	err = rdev_set_wiphy_params(rdev, changed);
 	if (err) {
 		wdev->wiphy->retry_short = oshort;
-- 
2.20.1
