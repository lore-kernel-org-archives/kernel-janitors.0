From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:48:19 +0000
Subject: [KJ] [PATCH 2.6.13-c1 2/17] fix sparse warnings (__nocast type)
Message-Id: <200507031848.19703.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_zLDyCTPz6U0/Ww6"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_zLDyCTPz6U0/Ww6
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: mm/slab

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_zLDyCTPz6U0/Ww6
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="slab.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="slab.patch"

 include/linux/slab.h   |   12 +++++++-----
 include/linux/string.h |    2 +-
 mm/slab.c              |   13 +++++++------
 3 files changed, 15 insertions(+), 12 deletions(-)

Index: linux-2.6-git/mm/slab.c
===================================================================
--- linux-2.6-git.orig/mm/slab.c	2005-07-03 15:00:06.000000000 +0000
+++ linux-2.6-git/mm/slab.c	2005-07-03 15:00:51.000000000 +0000
@@ -584,7 +584,8 @@
 	return cachep->array[smp_processor_id()];
 }
 
-static inline kmem_cache_t *__find_general_cachep(size_t size, int gfpflags)
+static inline kmem_cache_t *__find_general_cachep(size_t size,
+                                                  unsigned int __nocast gfpflags)
 {
 	struct cache_sizes *csizep = malloc_sizes;
 
@@ -608,7 +609,7 @@
 	return csizep->cs_cachep;
 }
 
-kmem_cache_t *kmem_find_general_cachep(size_t size, int gfpflags)
+kmem_cache_t *kmem_find_general_cachep(size_t size, unsigned int __nocast gfpflags)
 {
 	return __find_general_cachep(size, gfpflags);
 }
@@ -1425,7 +1426,7 @@
 	INIT_LIST_HEAD(&cachep->lists.slabs_free);
 
 	if (flags & CFLGS_OFF_SLAB)
-		cachep->slabp_cache = kmem_find_general_cachep(slab_size,0);
+		cachep->slabp_cache = kmem_find_general_cachep(slab_size, 0u);
 	cachep->ctor = ctor;
 	cachep->dtor = dtor;
 	cachep->name = name;
@@ -2365,7 +2366,7 @@
  * and can sleep. And it will allocate memory on the given node, which
  * can improve the performance for cpu bound structures.
  */
-void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int nodeid)
+void *kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast flags, int nodeid)
 {
 	int loop;
 	void *objp;
@@ -2439,7 +2440,7 @@
 }
 EXPORT_SYMBOL(kmem_cache_alloc_node);
 
-void *kmalloc_node(size_t size, int flags, int node)
+void *kmalloc_node(size_t size, unsigned int __nocast flags, int node)
 {
 	kmem_cache_t *cachep;
 
@@ -3091,7 +3092,7 @@
  * @s: the string to duplicate
  * @gfp: the GFP mask used in the kmalloc() call when allocating memory
  */
-char *kstrdup(const char *s, int gfp)
+char *kstrdup(const char *s, unsigned int __nocast gfp)
 {
 	size_t len;
 	char *buf;
Index: linux-2.6-git/include/linux/slab.h
===================================================================
--- linux-2.6-git.orig/include/linux/slab.h	2005-07-03 15:00:06.000000000 +0000
+++ linux-2.6-git/include/linux/slab.h	2005-07-03 15:00:20.000000000 +0000
@@ -65,7 +65,8 @@
 extern void kmem_cache_free(kmem_cache_t *, void *);
 extern unsigned int kmem_cache_size(kmem_cache_t *);
 extern const char *kmem_cache_name(kmem_cache_t *);
-extern kmem_cache_t *kmem_find_general_cachep(size_t size, int gfpflags);
+extern kmem_cache_t *kmem_find_general_cachep(size_t size,
+                                              unsigned int __nocast gfpflags);
 
 /* Size description struct for general caches. */
 struct cache_sizes {
@@ -104,14 +105,15 @@
 extern unsigned int ksize(const void *);
 
 #ifdef CONFIG_NUMA
-extern void *kmem_cache_alloc_node(kmem_cache_t *, int flags, int node);
-extern void *kmalloc_node(size_t size, int flags, int node);
+extern void *kmem_cache_alloc_node(kmem_cache_t *, unsigned int __nocast flags, int node);
+extern void *kmalloc_node(size_t size, unsigned int __nocast flags, int node);
 #else
-static inline void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int node)
+static inline void
+*kmem_cache_alloc_node(kmem_cache_t *cachep, unsigned int __nocast flags, int node)
 {
 	return kmem_cache_alloc(cachep, flags);
 }
-static inline void *kmalloc_node(size_t size, int flags, int node)
+static inline void *kmalloc_node(size_t size, unsigned int __nocast flags, int node)
 {
 	return kmalloc(size, flags);
 }
Index: linux-2.6-git/include/linux/string.h
===================================================================
--- linux-2.6-git.orig/include/linux/string.h	2005-07-03 15:00:06.000000000 +0000
+++ linux-2.6-git/include/linux/string.h	2005-07-03 15:00:20.000000000 +0000
@@ -88,7 +88,7 @@
 extern void * memchr(const void *,int,__kernel_size_t);
 #endif
 
-extern char *kstrdup(const char *s, int gfp);
+extern char *kstrdup(const char *s, unsigned int __nocast gfp);
 
 #ifdef __cplusplus
 }

--Boundary-00=_zLDyCTPz6U0/Ww6
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_zLDyCTPz6U0/Ww6--
