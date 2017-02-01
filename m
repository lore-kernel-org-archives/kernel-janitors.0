From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Feb 2017 08:46:32 +0000
Subject: [patch] ipv6: pointer math error in ip6_tnl_parse_tlv_enc_lim()
Message-Id: <20170201084632.GA29912@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Casting is a high precedence operation but "off" and "i" are in terms of
bytes so we need to have some parenthesis here.

Fixes: fbfa743a9d2a ("ipv6: fix ip6_tnl_parse_tlv_enc_lim()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index ff8ee06491c3..75fac933c209 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -441,7 +441,7 @@ __u16 ip6_tnl_parse_tlv_enc_lim(struct sk_buff *skb, __u8 *raw)
 				if (i + sizeof(*tel) > optlen)
 					break;
 
-				tel = (struct ipv6_tlv_tnl_enc_lim *) skb->data + off + i;
+				tel = (struct ipv6_tlv_tnl_enc_lim *)(skb->data + off + i);
 				/* return index of option if found and valid */
 				if (tel->type = IPV6_TLV_TNL_ENCAP_LIMIT &&
 				    tel->length = 1)
