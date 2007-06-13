From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 13 Jun 2007 02:58:42 +0000
Subject: [KJ] [KJ PATCH] Replacing alloc_pages(gfp,
Message-Id: <1181702802.2282.16.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178711839.2280.21.camel@shani-win>
In-Reply-To: <1178711839.2280.21.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, akpm@linux-foundation.org
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org


Replacing alloc_pages(gfp,0) with alloc_page(gfp) 
in net/core/sock.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/net/core/sock.c b/net/core/sock.c
index 22183c2..25bb52b 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1193,7 +1193,7 @@ static struct sk_buff *sock_alloc_send_pskb(struct sock *sk,
 					struct page *page;
 					skb_frag_t *frag;
 
-					page = alloc_pages(sk->sk_allocation, 0);
+					page = alloc_page(sk->sk_allocation);
 					if (!page) {
 						err = -ENOBUFS;
 						skb_shinfo(skb)->nr_frags = i;

-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
