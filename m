From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 13 Jun 2007 02:54:42 +0000
Subject: [KJ] [KJ PATCH] Replacing alloc_pages(gfp,
Message-Id: <1181702562.2282.12.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178711839.2280.21.camel@shani-win>
In-Reply-To: <1178711839.2280.21.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, akpm@linux-foundation.org
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org


Replacing alloc_pages(gfp,0) with alloc_page(gfp) 
in net/core/pktgen.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index b92a322..2600c7f 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -2414,7 +2414,7 @@ static struct sk_buff *fill_packet_ipv4(struct net_device *odev,
 
 		i = 0;
 		while (datalen > 0) {
-			struct page *page = alloc_pages(GFP_KERNEL, 0);
+			struct page *page = alloc_page(GFP_KERNEL);
 			skb_shinfo(skb)->frags[i].page = page;
 			skb_shinfo(skb)->frags[i].page_offset = 0;
 			skb_shinfo(skb)->frags[i].size @@ -2762,7 +2762,7 @@ static struct sk_buff *fill_packet_ipv6(struct net_device *odev,
 
 		i = 0;
 		while (datalen > 0) {
-			struct page *page = alloc_pages(GFP_KERNEL, 0);
+			struct page *page = alloc_page(GFP_KERNEL);
 			skb_shinfo(skb)->frags[i].page = page;
 			skb_shinfo(skb)->frags[i].page_offset = 0;
 			skb_shinfo(skb)->frags[i].size 
-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
