From: Colin King <colin.king@canonical.com>
Date: Tue, 26 May 2020 18:07:06 +0000
Subject: [PATCH][next] netfilter: conntrack: fix an unsigned int comparison to less than zero
Message-Id: <20200526180706.199338-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error check to see if protoff is less than zero is always false
because it is a unsigned int.  The call to ipv6_skip_exthdr can return
negative values for an error so cast protoff to int to fix this check.

Addresses-Coverity: ("Macro compares unsigned to 0 (no effect)")
Fixes: ee04805ff54a ("netfilter: conntrack: make conntrack userspace helpers work again")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netfilter/nf_conntrack_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_conntrack_core.c
index 08e0c19f6b39..2933b96a90c6 100644
--- a/net/netfilter/nf_conntrack_core.c
+++ b/net/netfilter/nf_conntrack_core.c
@@ -2114,7 +2114,7 @@ static int nf_confirm_cthelper(struct sk_buff *skb, struct nf_conn *ct,
 		pnum = ipv6_hdr(skb)->nexthdr;
 		protoff = ipv6_skip_exthdr(skb, sizeof(struct ipv6hdr), &pnum,
 					   &frag_off);
-		if (protoff < 0 || (frag_off & htons(~0x7)) != 0)
+		if ((int)protoff < 0 || (frag_off & htons(~0x7)) != 0)
 			return 0;
 		break;
 	}
-- 
2.25.1
