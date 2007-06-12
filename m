From: Shani Moideen <shani.moideen@wipro.com>
Date: Tue, 12 Jun 2007 04:10:17 +0000
Subject: [KJ] [KJ PATCH] Replacing alloc_pages(gfp,
Message-Id: <1181620697.2282.25.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178711839.2280.21.camel@shani-win>
In-Reply-To: <1178711839.2280.21.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@coreworks.de
Cc: netdev@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,
Replacing alloc_pages(gfp,0) with alloc_page(gfp) in
net/ipv4/ip_output.c.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index d6427d9..f9a87f6 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -1003,7 +1003,7 @@ alloc_new_skb:
 			} else if (i < MAX_SKB_FRAGS) {
 				if (copy > PAGE_SIZE)
 					copy = PAGE_SIZE;
-				page = alloc_pages(sk->sk_allocation, 0);
+				page = alloc_page(sk->sk_allocation);
 				if (page = NULL)  {
 					err = -ENOMEM;
 					goto error;

Regards,
Shani

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
