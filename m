From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Apr 2020 10:18:59 +0000
Subject: [PATCH] net: ipv6: rpl_iptunnel: remove redundant assignments to variable err
Message-Id: <20200402101859.502158-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never
read and it is being updated later with a new value.  The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/rpl_iptunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/rpl_iptunnel.c b/net/ipv6/rpl_iptunnel.c
index a49ddc6cd020..c3ececd7cfc1 100644
--- a/net/ipv6/rpl_iptunnel.c
+++ b/net/ipv6/rpl_iptunnel.c
@@ -210,7 +210,7 @@ static int rpl_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 	struct dst_entry *orig_dst = skb_dst(skb);
 	struct dst_entry *dst = NULL;
 	struct rpl_lwt *rlwt;
-	int err = -EINVAL;
+	int err;
 
 	rlwt = rpl_lwt_lwtunnel(orig_dst->lwtstate);
 
-- 
2.25.1
