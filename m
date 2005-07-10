From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:15 +0000
Subject: [KJ] [PATCH 14/20] Fix "nocast type" warnings
Message-Id: <200507102320.15176.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:mm/swap_state.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 mm/swap_state.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Index: linux-git/mm/swap_state.c
=================================--- linux-git.orig/mm/swap_state.c	2005-07-08 12:06:48.000000000 +0000
+++ linux-git/mm/swap_state.c	2005-07-10 22:43:14.000000000 +0000
@@ -67,8 +67,8 @@
  * __add_to_swap_cache resembles add_to_page_cache on swapper_space,
  * but sets SwapCache flag and private instead of mapping and index.
  */
-static int __add_to_swap_cache(struct page *page,
-		swp_entry_t entry, int gfp_mask)
+static int __add_to_swap_cache(struct page *page, swp_entry_t entry,
+			       unsigned int __nocast gfp_mask)
 {
 	int error;
 

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
