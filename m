From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 May 2012 11:00:03 +0000
Subject: [patch] netfilter: potential NULL dereference in get_inner_hdr()
Message-Id: <20120512110003.GB19472@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo in the error checking and "&&" was used instead of "||".
If skb_header_pointer() returns NULL then it leads to a NULL
dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, this is new code and Sparse complains about endian bugs.

diff --git a/net/netfilter/xt_HMARK.c b/net/netfilter/xt_HMARK.c
index 32fbd73..5817d03 100644
--- a/net/netfilter/xt_HMARK.c
+++ b/net/netfilter/xt_HMARK.c
@@ -223,7 +223,7 @@ static int get_inner_hdr(const struct sk_buff *skb, int iphsz, int *nhoff)
 
 	/* Not enough header? */
 	icmph = skb_header_pointer(skb, *nhoff + iphsz, sizeof(_ih), &_ih);
-	if (icmph = NULL && icmph->type > NR_ICMP_TYPES)
+	if (icmph = NULL || icmph->type > NR_ICMP_TYPES)
 		return 0;
 
 	/* Error message? */
