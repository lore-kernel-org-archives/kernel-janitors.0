From: Colin King <colin.king@canonical.com>
Date: Tue, 08 May 2018 12:57:32 +0000
Subject: [PATCH] mac80211: ethtool: avoid 32 bit multiplication overflow
Message-Id: <20180508125732.5153-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The multiplication of 100000 * cfg80211_calculate_bitrate() is a 32 bit
operation and can overflow if cfg80211_calculate_bitrate is greater
than 42949. Although I don't believe this is occurring at present, it
would be safer to avoid the potential overflow by making the constant
100000 an ULL to ensure a 64 multiplication occurs.

Detected by CoverityScan, CID#1468643 ("Unintentional integer overflow")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/mac80211/ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/ethtool.c b/net/mac80211/ethtool.c
index 08408520c3f8..2ba5686cbcab 100644
--- a/net/mac80211/ethtool.c
+++ b/net/mac80211/ethtool.c
@@ -117,11 +117,11 @@ static void ieee80211_get_stats(struct net_device *dev,
 
 
 		if (sinfo.filled & BIT(NL80211_STA_INFO_TX_BITRATE))
-			data[i] = 100000 *
+			data[i] = 100000ULL *
 				cfg80211_calculate_bitrate(&sinfo.txrate);
 		i++;
 		if (sinfo.filled & BIT(NL80211_STA_INFO_RX_BITRATE))
-			data[i] = 100000 *
+			data[i] = 100000ULL *
 				cfg80211_calculate_bitrate(&sinfo.rxrate);
 		i++;
 
-- 
2.17.0

