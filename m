From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 25 Sep 2012 11:07:09 +0000
Subject: [PATCH] mm/slab: Fix kmem_cache_alloc_node_trace() declaration
Message-Id: <1348571229-844-2-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348571229-844-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1348571229-844-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-mm@kvack.org
Cc: fengguang.wu@intel.com, Ezequiel Garcia <elezegarcia@gmail.com>, Pekka Enberg <penberg@kernel.org>

The bug was introduced in commit 4052147c0afa
"mm, slab: Match SLAB and SLUB kmem_cache_alloc_xxx_trace() prototype".

Cc: Pekka Enberg <penberg@kernel.org>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 mm/slab.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index ca3849f..3409ead 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3862,10 +3862,10 @@ void *kmem_cache_alloc_node(struct kmem_cache *cachep, gfp_t flags, int nodeid)
 EXPORT_SYMBOL(kmem_cache_alloc_node);
 
 #ifdef CONFIG_TRACING
-void *kmem_cache_alloc_node_trace(struct kmem_cache *cachep,
+void *kmem_cache_alloc_node_trace(size_t size,
+				  struct kmem_cache *cachep,
 				  gfp_t flags,
-				  int nodeid,
-				  size_t size)
+				  int nodeid)
 {
 	void *ret;
 
@@ -3887,7 +3887,7 @@ __do_kmalloc_node(size_t size, gfp_t flags, int node, unsigned long caller)
 	cachep = kmem_find_general_cachep(size, flags);
 	if (unlikely(ZERO_OR_NULL_PTR(cachep)))
 		return cachep;
-	return kmem_cache_alloc_node_trace(cachep, flags, node, size);
+	return kmem_cache_alloc_node_trace(size, cachep, flags, node);
 }
 
 #if defined(CONFIG_DEBUG_SLAB) || defined(CONFIG_TRACING)
-- 
1.7.8.6

