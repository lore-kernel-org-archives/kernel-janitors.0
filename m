From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 25 Sep 2012 11:07:08 +0000
Subject: [PATCH] mm/slab: Fix typo _RET_IP -> _RET_IP_
Message-Id: <1348571229-844-1-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-mm@kvack.org
Cc: fengguang.wu@intel.com, Ezequiel Garcia <elezegarcia@gmail.com>, Pekka Enberg <penberg@kernel.org>

The bug was introduced by commit 7c0cb9c64f83
"mm, slab: Replace 'caller' type, void* -> unsigned long".

Cc: Pekka Enberg <penberg@kernel.org>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 mm/slab.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index d011030..ca3849f 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3869,7 +3869,7 @@ void *kmem_cache_alloc_node_trace(struct kmem_cache *cachep,
 {
 	void *ret;
 
-	ret = slab_alloc_node(cachep, flags, nodeid, _RET_IP);
+	ret = slab_alloc_node(cachep, flags, nodeid, _RET_IP_);
 
 	trace_kmalloc_node(_RET_IP_, ret,
 			   size, cachep->size,
-- 
1.7.8.6

