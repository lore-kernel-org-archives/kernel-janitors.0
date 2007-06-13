From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 13 Jun 2007 02:49:50 +0000
Subject: [KJ] [KJ PATCH] Replacing alloc_pages(gfp,
Message-Id: <1181702270.2282.6.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178711839.2280.21.camel@shani-win>
In-Reply-To: <1178711839.2280.21.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, akpm@linux-foundation.org
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org


Replacing alloc_pages(gfp,0) with alloc_page(gfp) 
in net/core/skbuff.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1422573..b923181 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1805,7 +1805,7 @@ int skb_append_datato_frags(struct sock *sk, struct sk_buff *skb,
 			return -EFAULT;
 
 		/* allocate a new page for next frag */
-		page = alloc_pages(sk->sk_allocation, 0);
+		page = alloc_page(sk->sk_allocation);
 
 		/* If alloc_page fails just return failure and caller will
 		 * free previous allocated pages by doing kfree_skb()

-- 
Shani
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
