From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Tue, 05 Jul 2005 14:52:52 +0000
Subject: [KJ] [PATCH 2.6.13-c1 2/17] fix sparse warnings [UPDATE]
Message-Id: <200507051452.53040.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031848.19703.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031848.19703.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 05 Jul 2005 15:07, Alexey Dobriyan wrote:
> > Line wrapped.
> 
> And doesn't change prototype.
> 

Description:
     Fix the sparse warning "implicit cast to nocast type"

File/Subsystem: mm/slab

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>



 include/linux/slab.h |    8 ++++++--
 mm/slab.c            |    4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

Index: linux-2.6-git/mm/slab.c
=================================--- linux-2.6-git.orig/mm/slab.c	2005-07-05 13:30:54.000000000 +0000
+++ linux-2.6-git/mm/slab.c	2005-07-05 13:31:03.000000000 +0000
@@ -1425,7 +1425,7 @@
 	INIT_LIST_HEAD(&cachep->lists.slabs_free);
 
 	if (flags & CFLGS_OFF_SLAB)
-		cachep->slabp_cache = kmem_find_general_cachep(slab_size,0);
+		cachep->slabp_cache = kmem_find_general_cachep(slab_size, 0u);
 	cachep->ctor = ctor;
 	cachep->dtor = dtor;
 	cachep->name = name;
@@ -2365,7 +2365,7 @@
  * and can sleep. And it will allocate memory on the given node, which
  * can improve the performance for cpu bound structures.
  */
-void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodeid)
+void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast flags, int nodeid)
 {
 	int loop;
 	void *objp;
Index: linux-2.6-git/include/linux/slab.h
=================================--- linux-2.6-git.orig/include/linux/slab.h	2005-07-05 13:18:04.000000000 +0000
+++ linux-2.6-git/include/linux/slab.h	2005-07-05 13:34:54.000000000 +0000
@@ -104,10 +104,14 @@
 extern unsigned int ksize(const void *);
 
 #ifdef CONFIG_NUMA
-extern void *kmem_cache_alloc_node(kmem_cache_t *, int flags, int node);
+extern void *kmem_cache_alloc_node(kmem_cache_t *,
+                                   unsigned int __nocast flags,
+                                   int node)
 extern void *kmalloc_node(size_t size, int flags, int node);
 #else
-static inline void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int node)
+static inline void *kmem_cache_alloc_node(kmem_cache_t *cachep,
+                                          unsigned int __nocast flags,
+                                          int node)
 {
 	return kmem_cache_alloc(cachep, flags);
 }

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
