From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2012 17:31:19 +0000
Subject: [patch] mac80211: silence NULL dereference warning
Message-Id: <20121127173119.GC1059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that we could dereference skb later in the function.
It's probably unlikely, but we may as well return here and avoid it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index ec15a49..d923058 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -49,7 +49,7 @@ static struct sk_buff *remove_monitor_info(struct ieee80211_local *local,
 			/* driver bug */
 			WARN_ON(1);
 			dev_kfree_skb(skb);
-			skb = NULL;
+			return NULL;
 		}
 	}
 
