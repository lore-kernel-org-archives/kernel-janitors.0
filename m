From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 20 Mar 2019 01:55:10 +0000
Subject: [PATCH net-next] net: bridge: use eth_broadcast_addr() to assign broadcast address
Message-Id: <20190320020657.31423-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, nikolay@cumulusnetworks.com, roopa@cumulusnetworks.com

This patch is to use eth_broadcast_addr() to assign broadcast address
insetad of memset().

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 net/bridge/br_multicast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index a0e369179f6d..b257342c0860 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -517,7 +517,7 @@ struct net_bridge_port_group *br_multicast_new_port_group(
 	if (src)
 		memcpy(p->eth_addr, src, ETH_ALEN);
 	else
-		memset(p->eth_addr, 0xff, ETH_ALEN);
+		eth_broadcast_addr(p->eth_addr);
 
 	return p;
 }
-- 
2.20.1
