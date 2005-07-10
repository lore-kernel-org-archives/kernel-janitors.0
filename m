From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:18:35 +0000
Subject: [KJ] [PATCH 04/20] Fix "nocast type" warnings
Message-Id: <200507102318.35993.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/md/dm-crypt.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/md/dm-crypt.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-git/drivers/md/dm-crypt.c
=================================--- linux-git.orig/drivers/md/dm-crypt.c	2005-07-08 12:06:48.000000000 +0000
+++ linux-git/drivers/md/dm-crypt.c	2005-07-10 22:43:18.000000000 +0000
@@ -330,7 +330,7 @@
 {
 	struct bio *bio;
 	unsigned int nr_iovecs = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
-	int gfp_mask = GFP_NOIO | __GFP_HIGHMEM;
+	unsigned int gfp_mask = GFP_NOIO | __GFP_HIGHMEM;
 	unsigned int i;
 
 	/*

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
