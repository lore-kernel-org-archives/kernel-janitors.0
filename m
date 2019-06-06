From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Jun 2019 08:40:39 +0000
Subject: [PATCH][next] ipv6: fix spelling mistake: "wtih" -> "with"
Message-Id: <20190606084039.6265-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a NL_SET_ERR_MSG message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index fbaa7e9e0d9c..641a31d42ef9 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3342,7 +3342,7 @@ static struct fib6_info *ip6_route_info_create(struct fib6_config *cfg,
 			goto out;
 		}
 		if (rt->fib6_src.plen) {
-			NL_SET_ERR_MSG(extack, "Nexthops can not be used wtih source routing");
+			NL_SET_ERR_MSG(extack, "Nexthops can not be used with source routing");
 			goto out;
 		}
 		rt->nh = nh;
-- 
2.20.1
