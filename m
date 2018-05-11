From: Colin King <colin.king@canonical.com>
Date: Fri, 11 May 2018 13:25:42 +0000
Subject: [PATCH] cfg80211: fix spelling mistake: "uknown" -> "unknown"
Message-Id: <20180511132542.16304-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_debug message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/wireless/reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 72eb7c6b6e7f..e55099b1785d 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -3400,7 +3400,7 @@ bool reg_supported_dfs_region(enum nl80211_dfs_regions dfs_region)
 	case NL80211_DFS_JP:
 		return true;
 	default:
-		pr_debug("Ignoring uknown DFS master region: %d\n", dfs_region);
+		pr_debug("Ignoring unknown DFS master region: %d\n", dfs_region);
 		return false;
 	}
 }
-- 
2.17.0

