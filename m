From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Aug 2019 12:20:34 +0000
Subject: [PATCH][next] mac80211: minstrel_ht: fix infinite loop because supported is not being shifted
Message-Id: <20190822122034.28664-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the for-loop will spin forever if variable supported is
non-zero because supported is never changed.  Fix this by adding in
the missing right shift of supported.

Addresses-Coverity: ("Infinite loop")
Fixes: 48cb39522a9d ("mac80211: minstrel_ht: improve rate probing for devices with static fallback")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/mac80211/rc80211_minstrel_ht.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index a01168514840..0ef2633349b5 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -634,7 +634,7 @@ minstrel_ht_rate_sample_switch(struct minstrel_priv *mp,
 		u16 supported = mi->supported[g_idx];
 
 		supported >>= mi->max_tp_rate[0] % MCS_GROUP_RATES;
-		for (i = 0; supported; i++) {
+		for (i = 0; supported; supported >>= 1, i++) {
 			if (!(supported & 1))
 				continue;
 
-- 
2.20.1
