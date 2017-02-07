From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Feb 2017 10:56:38 +0000
Subject: [PATCH][net-next] net: bridge: remove redundant check to see if err is set
Message-Id: <20170207105638.17918-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>, "David S . Miller" <davem@davemloft.net>, bridge@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error check on err is redundant as it is being checked
previously each time it has been updated.  Remove this redundant
check.

Detected with CoverityScan, CID#140030("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/bridge/br_netlink.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
index fc5d885..cdc4e2a 100644
--- a/net/bridge/br_netlink.c
+++ b/net/bridge/br_netlink.c
@@ -612,9 +612,6 @@ static int br_afspec(struct net_bridge *br,
 				return err;
 			break;
 		}
-
-		if (err)
-			return err;
 	}
 
 	return err;
-- 
2.10.2

