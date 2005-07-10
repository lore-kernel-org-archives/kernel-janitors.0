From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:18:17 +0000
Subject: [KJ] [PATCH 03/20] Fix "nocast type" warnings
Message-Id: <200507102318.17410.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:include/linux/skbuff.h

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 include/linux/skbuff.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

Index: linux-git/include/linux/skbuff.h
=================================--- linux-git.orig/include/linux/skbuff.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/linux/skbuff.h	2005-07-10 22:42:58.000000000 +0000
@@ -495,7 +495,8 @@
  *
  *	%NULL is returned on a memory allocation failure.
  */
-static inline struct sk_buff *skb_unshare(struct sk_buff *skb, int pri)
+static inline struct sk_buff *skb_unshare(struct sk_buff *skb,
+					  unsigned int __nocast pri)
 {
 	might_sleep_if(pri & __GFP_WAIT);
 	if (skb_cloned(skb)) {

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
