From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Dec 2018 16:50:50 +0000
Subject: [PATCH][next] neighbour: remove stray semicolon
Message-Id: <20181220165050.17429-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@gmail.com>, Roopa Prabhu <roopa@cumulusnetworks.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the stray semicolon means that the final term in the addition
is being missed.  Fix this by removing it. Cleans up clang warning:

net/core/neighbour.c:2821:9: warning: expression result unused [-Wunused-value]

Fixes: 82cbb5c631a0 ("neighbour: register rtnl doit handler")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/neighbour.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 43687c9abe1d..1c4b7814ac32 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -2817,7 +2817,7 @@ static int neigh_get_reply(struct net *net, struct neighbour *neigh,
 static inline size_t pneigh_nlmsg_size(void)
 {
 	return NLMSG_ALIGN(sizeof(struct ndmsg))
-	       + nla_total_size(MAX_ADDR_LEN); /* NDA_DST */
+	       + nla_total_size(MAX_ADDR_LEN) /* NDA_DST */
 	       + nla_total_size(1); /* NDA_PROTOCOL */
 }
 
-- 
2.19.1
