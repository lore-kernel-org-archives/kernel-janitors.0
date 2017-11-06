From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Nov 2017 15:04:54 +0000
Subject: [PATCH] rtnetlink: fix missing size for IFLA_IF_NETNSID
Message-Id: <20171106150454.9623-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@gmail.com>, Jiri Benc <jbenc@redhat.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The size for IFLA_IF_NETNSID is missing from the size calculation
because the proceeding semicolon was not removed. Fix this by removing
the semicolon.

Detected by CoverityScan, CID#1461135 ("Structurally dead code")

Fixes: 79e1ad148c84 ("rtnetlink: use netnsid to query interface")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/rtnetlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index dc5ad84ac096..dabba2a91fc8 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -920,7 +920,7 @@ static noinline size_t if_nlmsg_size(const struct net_device *dev,
 	       + rtnl_xdp_size() /* IFLA_XDP */
 	       + nla_total_size(4)  /* IFLA_EVENT */
 	       + nla_total_size(4)  /* IFLA_NEW_NETNSID */
-	       + nla_total_size(1); /* IFLA_PROTO_DOWN */
+	       + nla_total_size(1)  /* IFLA_PROTO_DOWN */
 	       + nla_total_size(4)  /* IFLA_IF_NETNSID */
 	       + 0;
 }
-- 
2.14.1

