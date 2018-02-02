From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Feb 2018 16:31:42 +0000
Subject: [PATCH] mac80211: remove redundant initialization to pointer 'hdr'
Message-Id: <20180202163142.4006-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer hrd is being initialized with a value that is never read
and re-assigned a little later, hence the initialization is redundant
and can be removed.

Cleans up clang warning:
net/mac80211/tx.c:1924:24: warning: Value stored to 'hdr' during its
initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/mac80211/tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 25904af38839..5decd0fb247c 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1921,7 +1921,7 @@ void ieee80211_xmit(struct ieee80211_sub_if_data *sdata,
 {
 	struct ieee80211_local *local = sdata->local;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *) skb->data;
+	struct ieee80211_hdr *hdr;
 	int headroom;
 	bool may_encrypt;
 
-- 
2.15.1

