From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:37 +0000
Subject: [KJ] [PATCH 17/20] Fix "nocast type" warnings
Message-Id: <200507102320.37206.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/net/sungem.h

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/net/sungem.h |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-git/drivers/net/sungem.h
=================================--- linux-git.orig/drivers/net/sungem.h	2005-07-08 12:06:50.000000000 +0000
+++ linux-git/drivers/net/sungem.h	2005-07-10 22:43:12.000000000 +0000
@@ -1035,7 +1035,7 @@
 			
 #define ALIGNED_RX_SKB_ADDR(addr) \
         ((((unsigned long)(addr) + (64UL - 1UL)) & ~(64UL - 1UL)) - (unsigned long)(addr))
-static __inline__ struct sk_buff *gem_alloc_skb(int size, int gfp_flags)
+static __inline__ struct sk_buff *gem_alloc_skb(int size, unsigned int __nocast gfp_flags)
 {
 	struct sk_buff *skb = alloc_skb(size + 64, gfp_flags);
 

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
