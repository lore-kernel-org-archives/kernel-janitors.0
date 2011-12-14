From: Simon Wunderlich <simon.wunderlich@s2003.tu-chemnitz.de>
Date: Wed, 14 Dec 2011 12:33:30 +0000
Subject: [PATCH] mac80211: free skb on error path of ieee80211_ibss_join()
Message-Id: <1323866010-10079-1-git-send-email-siwu@hrz.tu-chemnitz.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Simon <an.alexsimon@googlemail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Our new return also created a memleak. The skb should be freed before
returning an error.

Signed-off-by: Simon Wunderlich <siwu@hrz.tu-chemnitz.de>
---
 net/mac80211/ibss.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 0fc9752..fe0e91e 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -995,6 +995,7 @@ int ieee80211_ibss_join(struct ieee80211_sub_if_data *sdata,
 		if (!ieee80211_set_channel_type(sdata->local, sdata,
 					       params->channel_type)) {
 			mutex_unlock(&sdata->u.ibss.mtx);
+			kfree_skb(skb);
 			return -EINVAL;
 		}
 	}
-- 
1.7.7.3

