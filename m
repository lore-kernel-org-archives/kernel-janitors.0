From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 16:12:39 +0000
Subject: [PATCH] ipv6: fix useless rol32 call on hash
Message-Id: <20180717161239.30782-1-colin.king@canonical.com>
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

Thanks to David Lebrun for spotting this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 include/net/ipv6.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 50eebccbf919..190015652168 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -843,7 +843,7 @@ static inline __be32 ip6_make_flowlabel(struct net *net, struct sk_buff *skb,
 	 * to minimize possbility that any useful information to an
 	 * attacker is leaked. Only lower 20 bits are relevant.
 	 */
-	rol32(hash, 16);
+	hash = rol32(hash, 16);
 
 	flowlabel = (__force __be32)hash & IPV6_FLOWLABEL_MASK;
 
-- 
2.17.1

