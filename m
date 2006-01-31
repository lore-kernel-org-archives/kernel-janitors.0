From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:03:23 +0000
Subject: [KJ] [Patch 5/7] BUG_ON() Conversion in mm/slab.c
Message-Id: <1138712603.11570.19.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13751013573333859=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13751013573333859==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/slab.c.orig	2006-01-30 23:15:45.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/slab.c	2006-01-30 23:17:41.000000000 +0100
@@ -1058,8 +1058,7 @@ void __init kmem_cache_init(void)
 
 	cache_estimate(0, cache_cache.objsize, cache_line_size(), 0,
 		       &left_over, &cache_cache.num);
-	if (!cache_cache.num)
-		BUG();
+	BUG_ON(!cache_cache.num);
 
 	cache_cache.colour = left_over / cache_cache.colour_off;
 	cache_cache.colour_next = 0;
@@ -1650,8 +1649,7 @@ kmem_cache_create (const char *name, siz
 	 * Always checks flags, a caller might be expecting debug
 	 * support which isn't available.
 	 */
-	if (flags & ~CREATE_MASK)
-		BUG();
+	BUG_ON(flags & ~CREATE_MASK);
 
 	/* Check that size is in terms of words.  This is needed to avoid
 	 * unaligned accesses for some archs when redzoning is used, and makes
@@ -1966,8 +1964,7 @@ static int __node_shrink(kmem_cache_t *c
 
 		slabp = list_entry(l3->slabs_free.prev, struct slab, list);
 #if DEBUG
-		if (slabp->inuse)
-			BUG();
+		BUG_ON(slabp->inuse);
 #endif
 		list_del(&slabp->list);
 
@@ -2008,8 +2005,7 @@ static int __cache_shrink(kmem_cache_t *
  */
 int kmem_cache_shrink(kmem_cache_t *cachep)
 {
-	if (!cachep || in_interrupt())
-		BUG();
+	BUG_ON(!cachep || in_interrupt());
 
 	return __cache_shrink(cachep);
 }
@@ -2037,8 +2033,7 @@ int kmem_cache_destroy(kmem_cache_t *cac
 	int i;
 	struct kmem_list3 *l3;
 
-	if (!cachep || in_interrupt())
-		BUG();
+	BUG_ON(!cachep || in_interrupt());
 
 	/* Don't let CPUs to come and go */
 	lock_cpu_hotplug();
@@ -2161,11 +2156,9 @@ static void cache_init_objs(kmem_cache_t
 static void kmem_flagcheck(kmem_cache_t *cachep, gfp_t flags)
 {
 	if (flags & SLAB_DMA) {
-		if (!(cachep->gfpflags & GFP_DMA))
-			BUG();
+		BUG_ON(!(cachep->gfpflags & GFP_DMA));
 	} else {
-		if (cachep->gfpflags & GFP_DMA)
-			BUG();
+		BUG_ON(cachep->gfpflags & GFP_DMA);
 	}
 }
 
@@ -2200,8 +2193,7 @@ static int cache_grow(kmem_cache_t *cach
 	/* Be lazy and only check for valid flags here,
 	 * keeping it out of the critical path in kmem_cache_alloc().
 	 */
-	if (flags & ~(SLAB_DMA | SLAB_LEVEL_MASK | SLAB_NO_GROW))
-		BUG();
+	BUG_ON(flags & ~(SLAB_DMA | SLAB_LEVEL_MASK | SLAB_NO_GROW));
 	if (flags & SLAB_NO_GROW)
 		return 0;
 



--===============13751013573333859==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13751013573333859==--
