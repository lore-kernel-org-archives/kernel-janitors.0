From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 15:52:54 +0000
Subject: [PATCH] ipv6: sr: fix useless rol32 call on hash
Message-Id: <20180717155254.30367-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The rol32 call is currently rotating hash but the rol'd value is
being discarded. I believe the current code is incorrect and hash
should be assigned the rotated value returned from rol32.

Detected by CoverityScan, CID#1468411 ("Useless call")

Fixes: b5facfdba14c ("ipv6: sr: Compute flowlabel for outer IPv6 header of seg6 encap mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/seg6_iptunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
index 19ccf0dc996c..a8854dd3e9c5 100644
--- a/net/ipv6/seg6_iptunnel.c
+++ b/net/ipv6/seg6_iptunnel.c
@@ -101,7 +101,7 @@ static __be32 seg6_make_flowlabel(struct net *net, struct sk_buff *skb,
 
 	if (do_flowlabel > 0) {
 		hash = skb_get_hash(skb);
-		rol32(hash, 16);
+		hash = rol32(hash, 16);
 		flowlabel = (__force __be32)hash & IPV6_FLOWLABEL_MASK;
 	} else if (!do_flowlabel && skb->protocol = htons(ETH_P_IPV6)) {
 		flowlabel = ip6_flowlabel(inner_hdr);
-- 
2.17.1

