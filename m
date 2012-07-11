From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:32:14 +0000
Subject: [patch -next] net: writes past the end of the struct
Message-Id: <20120711063214.GA11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There are a couple places that try to set part of the struct to 0 by
doing:

    memset(&rt->rt6i_table, 0, sizeof(*rt) - sizeof(struct dst_entry));

It assumes that the first element is a dst_entry and the second element
is ->rt6_table.  The problem is we changed the struct in 97cac0821a
('ipv6: Store route neighbour in rt6_info struct.') and we aren't
clearing rt->n but instead we're writing past the end of the array.

I've changed it to:
    memset(&rt->n, 0, sizeof(*rt) - offsetof(struct rt6_info, n));

The memset in ip6_dst_alloc() was ok but I changed it to use offsetof()
as a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 6e97855..c2186a7 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -1353,8 +1353,8 @@ static inline struct xfrm_dst *xfrm_alloc_dst(struct net *net, int family)
 	xdst = dst_alloc(dst_ops, NULL, 0, 0, 0);
 
 	if (likely(xdst)) {
-		memset(&xdst->u.rt6.rt6i_table, 0,
-			sizeof(*xdst) - sizeof(struct dst_entry));
+		memset(&xdst->u.rt6.n, 0,
+			sizeof(*xdst) - offsetof(struct rt6_info, n));
 		xdst->flo.ops = &xfrm_bundle_fc_ops;
 	} else
 		xdst = ERR_PTR(-ENOBUFS);
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 6cc6c88..41693f6 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -274,7 +274,7 @@ static inline struct rt6_info *ip6_dst_alloc(struct net *net,
 
 	if (rt) {
 		memset(&rt->n, 0,
-		       sizeof(*rt) - sizeof(struct dst_entry));
+		       sizeof(*rt) - offsetof(struct rt6_info, n));
 		rt6_init_peer(rt, table ? &table->tb6_peers : net->ipv6.peers);
 	}
 	return rt;
@@ -975,7 +975,7 @@ struct dst_entry *ip6_blackhole_route(struct net *net, struct dst_entry *dst_ori
 
 	rt = dst_alloc(&ip6_dst_blackhole_ops, ort->dst.dev, 1, 0, 0);
 	if (rt) {
-		memset(&rt->rt6i_table, 0, sizeof(*rt) - sizeof(struct dst_entry));
+		memset(&rt->n, 0, sizeof(*rt) - offsetof(struct rt6_info, n));
 		rt6_init_peer(rt, net->ipv6.peers);
 
 		new = &rt->dst;
