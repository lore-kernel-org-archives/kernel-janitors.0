From: Kim Phillips <kim.phillips@freescale.com>
Date: Tue, 20 Jan 2015 20:01:42 +0000
Subject: [PATCH 1/2] mm/slub: fix typo
Message-Id: <20150120140142.cd2e32d83d66459562bd1717@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Signed-off-by: Kim Phillips <kim.phillips@freescale.com>
---
 mm/slub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index fe376fe..a64cc1b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2512,7 +2512,7 @@ EXPORT_SYMBOL(kmem_cache_alloc_node_trace);
 #endif
 
 /*
- * Slow patch handling. This may still be called frequently since objects
+ * Slow path handling. This may still be called frequently since objects
  * have a longer lifetime than the cpu slabs in most processing loads.
  *
  * So we still attempt to reduce cache line usage. Just take the slab
-- 
2.2.2

