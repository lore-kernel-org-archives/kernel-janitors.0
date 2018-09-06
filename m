From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Sep 2018 09:58:44 +0000
Subject: [PATCH] cfg80211: remove redundant check of !scan_plan
Message-Id: <20180906095844.17071-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for !scan_plan is redunant as this has been checked
in the proceeding statement and the code returns -ENOBUFS if
it is true. Remove the redundant check.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/wireless/nl80211.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d5f9b5235cdd..b4908bcb0d77 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -10690,8 +10690,7 @@ static int nl80211_send_wowlan_nd(struct sk_buff *msg,
 		if (!scan_plan)
 			return -ENOBUFS;
 
-		if (!scan_plan ||
-		    nla_put_u32(msg, NL80211_SCHED_SCAN_PLAN_INTERVAL,
+		if (nla_put_u32(msg, NL80211_SCHED_SCAN_PLAN_INTERVAL,
 				req->scan_plans[i].interval) ||
 		    (req->scan_plans[i].iterations &&
 		     nla_put_u32(msg, NL80211_SCHED_SCAN_PLAN_ITERATIONS,
-- 
2.17.1
