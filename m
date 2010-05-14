From: Julia Lawall <julia@diku.dk>
Date: Fri, 14 May 2010 19:29:51 +0000
Subject: [PATCH 5/10] drivers/message/i2o/memory.c: Use kstrdup
Message-Id: <Pine.LNX.4.64.1005142129290.28935@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kstrdup when the goal of an allocation is copy a string into the
allocated region.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to;
expression flag,E1,E2;
statement S;
@@

-  to = kmalloc(strlen(from) + 1,flag);
+  to = kstrdup(from, flag);
   ... when != \(from = E1 \| to = E1 \)
   if (to=NULL || ...) S
   ... when != \(from = E2 \| to = E2 \)
-  strcpy(to, from);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/message/i2o/memory.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/message/i2o/memory.c b/drivers/message/i2o/memory.c
--- a/drivers/message/i2o/memory.c
+++ b/drivers/message/i2o/memory.c
@@ -270,10 +270,9 @@ EXPORT_SYMBOL_GPL(i2o_dma_realloc);
 int i2o_pool_alloc(struct i2o_pool *pool, const char *name,
 				 size_t size, int min_nr)
 {
-	pool->name = kmalloc(strlen(name) + 1, GFP_KERNEL);
+	pool->name = kstrdup(name, GFP_KERNEL);
 	if (!pool->name)
 		goto exit;
-	strcpy(pool->name, name);
 
 	pool->slab  	    kmem_cache_create(pool->name, size, 0, SLAB_HWCACHE_ALIGN, NULL);
