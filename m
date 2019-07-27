From: Colin King <colin.king@canonical.com>
Date: Sat, 27 Jul 2019 23:37:26 +0000
Subject: [PATCH] rocker: fix memory leaks of fib_work on two error return paths
Message-Id: <20190727233726.3121-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ahern <dsahern@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there are two error return paths that leak memory allocated
to fib_work. Fix this by kfree'ing fib_work before returning.

Addresses-Coverity: ("Resource leak")
Fixes: 19a9d136f198 ("ipv4: Flag fib_info with a fib_nh using IPv6 gateway")
Fixes: dbcc4fa718ee ("rocker: Fail attempts to use routes with nexthop objects")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/rocker/rocker_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/rocker/rocker_main.c b/drivers/net/ethernet/rocker/rocker_main.c
index 079f459c73a5..2c5d3f5b84dd 100644
--- a/drivers/net/ethernet/rocker/rocker_main.c
+++ b/drivers/net/ethernet/rocker/rocker_main.c
@@ -2208,10 +2208,12 @@ static int rocker_router_fib_event(struct notifier_block *nb,
 
 			if (fen_info->fi->fib_nh_is_v6) {
 				NL_SET_ERR_MSG_MOD(info->extack, "IPv6 gateway with IPv4 route is not supported");
+				kfree(fib_work);
 				return notifier_from_errno(-EINVAL);
 			}
 			if (fen_info->fi->nh) {
 				NL_SET_ERR_MSG_MOD(info->extack, "IPv4 route with nexthop objects is not supported");
+				kfree(fib_work);
 				return notifier_from_errno(-EINVAL);
 			}
 		}
-- 
2.20.1
