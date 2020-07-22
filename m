From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 15:38:30 +0000
Subject: [PATCH] mac80211: remove the need for variable rates_idx
Message-Id: <20200722153830.959010-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently rates_idx is being initialized with the value -1 and this
value is never read so the initialization is redundant and can be
removed. The next time the variable is used it is assigned a value
that is returned a few statements later. Just return i - 1 and
remove the need for rates_idx.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/mac80211/status.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index cbc40b358ba2..adb1d30ce06e 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -799,7 +799,6 @@ static int ieee80211_tx_get_rates(struct ieee80211_hw *hw,
 				  struct ieee80211_tx_info *info,
 				  int *retry_count)
 {
-	int rates_idx = -1;
 	int count = -1;
 	int i;
 
@@ -821,13 +820,12 @@ static int ieee80211_tx_get_rates(struct ieee80211_hw *hw,
 
 		count += info->status.rates[i].count;
 	}
-	rates_idx = i - 1;
 
 	if (count < 0)
 		count = 0;
 
 	*retry_count = count;
-	return rates_idx;
+	return i - 1;
 }
 
 void ieee80211_tx_monitor(struct ieee80211_local *local, struct sk_buff *skb,
-- 
2.27.0
