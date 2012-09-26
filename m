From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 26 Sep 2012 12:21:33 +0000
Subject: [PATCH v2] mm/slab: Fix kmem_cache_alloc_node_trace() declaration
Message-Id: <1348662093-3116-1-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, fengguang.wu@intel.com, Ezequiel Garcia <elezegarcia@gmail.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>

This bug was introduced in commit
"mm, slab: Match SLAB and SLUB kmem_cache_alloc_xxx_trace() prototype".

Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 Changes from v1:
  * Fix kmem_cache_alloc_node_trace to effectively match SLUB's

 include/linux/slab_def.h |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/slab_def.h b/include/linux/slab_def.h
index e98caeb..cc290f0 100644
--- a/include/linux/slab_def.h
+++ b/include/linux/slab_def.h
@@ -159,16 +159,16 @@ extern void *__kmalloc_node(size_t size, gfp_t flags, int node);
 extern void *kmem_cache_alloc_node(struct kmem_cache *, gfp_t flags, int node);
 
 #ifdef CONFIG_TRACING
-extern void *kmem_cache_alloc_node_trace(size_t size,
-					 struct kmem_cache *cachep,
+extern void *kmem_cache_alloc_node_trace(struct kmem_cache *cachep,
 					 gfp_t flags,
-					 int nodeid);
+					 int nodeid,
+					 size_t size);
 #else
 static __always_inline void *
-kmem_cache_alloc_node_trace(size_t size,
-			    struct kmem_cache *cachep,
+kmem_cache_alloc_node_trace(struct kmem_cache *cachep,
 			    gfp_t flags,
-			    int nodeid)
+			    int nodeid,
+			    size_t size)
 {
 	return kmem_cache_alloc_node(cachep, flags, nodeid);
 }
@@ -200,7 +200,7 @@ found:
 #endif
 			cachep = malloc_sizes[i].cs_cachep;
 
-		return kmem_cache_alloc_node_trace(size, cachep, flags, node);
+		return kmem_cache_alloc_node_trace(cachep, flags, node, size);
 	}
 	return __kmalloc_node(size, flags, node);
 }
-- 
1.7.8.6

