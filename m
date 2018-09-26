From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 26 Sep 2018 12:17:17 +0000
Subject: [PATCH net-next] mac80211: fix error handling in ieee80211_register_hw()
Message-Id: <1537964237-169158-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code -ENOMEM from the kmemdup
error handling case instead of 0.

Fixes: 09b4a4faf9d0 ("mac80211: introduce capability flags for VHT EXT NSS support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/mac80211/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 7738101..e6375d0 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1203,8 +1203,10 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 			continue;
 
 		sband = kmemdup(sband, sizeof(*sband), GFP_KERNEL);
-		if (!sband)
+		if (!sband) {
+			result = -ENOMEM;
 			goto fail_rate;
+		}
 
 		wiphy_dbg(hw->wiphy, "copying sband (band %d) due to VHT EXT NSS BW flag\n",
 			  band);
