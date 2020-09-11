From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Sep 2020 10:35:09 +0000
Subject: [PATCH] ipv6: remove redundant assignment to variable err
Message-Id: <20200911103509.22907-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200415231630.1568296-1-colin.king@canonical.com>
In-Reply-To: <20200415231630.1568296-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read and
it is being updated later with a new value. The initialization is redundant
and can be removed.  Also re-order variable declarations in reverse
Christmas tree ordering.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/route.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 5e7e25e2523a..e8ee20720fe0 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5284,9 +5284,10 @@ static int ip6_route_multipath_del(struct fib6_config *cfg,
 {
 	struct fib6_config r_cfg;
 	struct rtnexthop *rtnh;
+	int last_err = 0;
 	int remaining;
 	int attrlen;
-	int err = 1, last_err = 0;
+	int err;
 
 	remaining = cfg->fc_mp_len;
 	rtnh = (struct rtnexthop *)cfg->fc_mp;
-- 
2.27.0
