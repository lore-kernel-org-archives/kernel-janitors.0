From: Yue Haibing <yuehaibing@huawei.com>
Date: Tue, 21 Aug 2018 13:56:37 +0000
Subject: [PATCH] netfilter: conntrack: remove duplicated include from nf_conntrack_proto_udp.c
Message-Id: <1534860184-170985-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>
Cc: Yue Haibing <yuehaibing@huawei.com>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 net/netfilter/nf_conntrack_proto_udp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_proto_udp.c b/net/netfilter/nf_conntrack_proto_udp.c
index 7a1b898..9272a2c 100644
--- a/net/netfilter/nf_conntrack_proto_udp.c
+++ b/net/netfilter/nf_conntrack_proto_udp.c
@@ -393,4 +393,3 @@ static struct nf_proto_net *udp_get_net_proto(struct net *net)
 };
 EXPORT_SYMBOL_GPL(nf_conntrack_l4proto_udplite6);
 #endif
-#include <net/netfilter/nf_conntrack_timeout.h>
