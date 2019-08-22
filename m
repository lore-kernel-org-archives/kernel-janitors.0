From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Aug 2019 12:53:40 +0000
Subject: [PATCH] nexthops: remove redundant assignment to variable err
Message-Id: <20190822125340.30783-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is initialized to a value that is never read and it is
re-assigned later. The initialization is redundant and can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/nexthop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 5fe5a3981d43..fc34fd1668d6 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -1151,7 +1151,7 @@ static int nh_create_ipv4(struct net *net, struct nexthop *nh,
 		.fc_encap_type = cfg->nh_encap_type,
 	};
 	u32 tb_id = l3mdev_fib_table(cfg->dev);
-	int err = -EINVAL;
+	int err;
 
 	err = fib_nh_init(net, fib_nh, &fib_cfg, 1, extack);
 	if (err) {
-- 
2.20.1
