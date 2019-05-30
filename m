From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 15:57:54 +0000
Subject: [PATCH][next] nexthop: remove redundant assignment to err
Message-Id: <20190530155754.31634-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is initialized with a value that is never read
and err is reassigned a few statements later. This initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/nexthop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 1af8a329dacb..7a5a3d08fec3 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -836,7 +836,7 @@ static int nh_create_ipv6(struct net *net,  struct nexthop *nh,
 		.fc_encap = cfg->nh_encap,
 		.fc_encap_type = cfg->nh_encap_type,
 	};
-	int err = -EINVAL;
+	int err;
 
 	if (!ipv6_addr_any(&cfg->gw.ipv6))
 		fib6_cfg.fc_flags |= RTF_GATEWAY;
-- 
2.20.1
