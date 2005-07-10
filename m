From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:08 +0000
Subject: [KJ] [PATCH 13/20] Fix "nocast type" warnings
Message-Id: <200507102320.08379.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:lib/radix-tree

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 include/linux/radix-tree.h |    4 ++--
 lib/radix-tree.c           |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

Index: linux-git/include/linux/radix-tree.h
=================================--- linux-git.orig/include/linux/radix-tree.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/linux/radix-tree.h	2005-07-10 22:43:15.000000000 +0000
@@ -24,7 +24,7 @@
 
 struct radix_tree_root {
 	unsigned int		height;
-	int			gfp_mask;
+	unsigned int		gfp_mask;
 	struct radix_tree_node	*rnode;
 };
 
@@ -50,7 +50,7 @@
 unsigned int
 radix_tree_gang_lookup(struct radix_tree_root *root, void **results,
 			unsigned long first_index, unsigned int max_items);
-int radix_tree_preload(int gfp_mask);
+int radix_tree_preload(unsigned int __nocast gfp_mask);
 void radix_tree_init(void);
 void *radix_tree_tag_set(struct radix_tree_root *root,
 			unsigned long index, int tag);
Index: linux-git/lib/radix-tree.c
=================================--- linux-git.orig/lib/radix-tree.c	2005-07-08 12:06:48.000000000 +0000
+++ linux-git/lib/radix-tree.c	2005-07-10 22:43:15.000000000 +0000
@@ -109,7 +109,7 @@
  * success, return zero, with preemption disabled.  On error, return -ENOMEM
  * with preemption not disabled.
  */
-int radix_tree_preload(int gfp_mask)
+int radix_tree_preload(unsigned int __nocast gfp_mask)
 {
 	struct radix_tree_preload *rtp;
 	struct radix_tree_node *node;

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
