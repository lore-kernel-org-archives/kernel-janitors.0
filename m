From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:30 +0000
Subject: [KJ] [PATCH 16/20] Fix "nocast type" warnings
Message-Id: <200507102320.30496.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/base/dmapool

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/base/dmapool.c  |    3 ++-
 include/linux/dmapool.h |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

Index: linux-git/drivers/base/dmapool.c
=================================--- linux-git.orig/drivers/base/dmapool.c	2005-07-08 12:06:57.000000000 +0000
+++ linux-git/drivers/base/dmapool.c	2005-07-10 22:43:17.000000000 +0000
@@ -262,7 +262,8 @@
  * If such a memory block can't be allocated, null is returned.
  */
 void *
-dma_pool_alloc (struct dma_pool *pool, int mem_flags, dma_addr_t *handle)
+dma_pool_alloc (struct dma_pool *pool, unsigned int __nocast mem_flags,
+		dma_addr_t *handle)
 {
 	unsigned long		flags;
 	struct dma_page		*page;
Index: linux-git/include/linux/dmapool.h
=================================--- linux-git.orig/include/linux/dmapool.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/linux/dmapool.h	2005-07-10 22:43:17.000000000 +0000
@@ -19,7 +19,8 @@
 
 void dma_pool_destroy(struct dma_pool *pool);
 
-void *dma_pool_alloc(struct dma_pool *pool, int mem_flags, dma_addr_t *handle);
+void *dma_pool_alloc(struct dma_pool *pool, unsigned int __nocast mem_flags,
+		     dma_addr_t *handle);
 
 void dma_pool_free(struct dma_pool *pool, void *vaddr, dma_addr_t addr);
 

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
