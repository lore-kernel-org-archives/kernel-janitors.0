From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 19 Jul 2015 10:53:19 +0000
Subject: [patch] genalloc: freeing const data pointers
Message-Id: <20150719105319.GC8410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Laura Abbott <lauraa@codeaurora.org>, Olof Johansson <olof@lixom.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jan Kara <jack@suse.cz>, Toshi Kikuchi <toshik@chromium.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"pool->name" can be kmalloc()ed or const so we need to free it with
kfree_const().

I also cleaned up the error path in devm_gen_pool_create() a bit.  With
the current code you have to change the kfree() in multiple places
which is bug prone (my first draft of this patch had a bug).

Fixes: e89a70fd54f2 ('genalloc: add support of multiple gen_pools per device')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/genalloc.c b/lib/genalloc.c
index 794804b..c729113 100644
--- a/lib/genalloc.c
+++ b/lib/genalloc.c
@@ -253,7 +253,7 @@ void gen_pool_destroy(struct gen_pool *pool)
 
 		kfree(chunk);
 	}
-	kfree(pool->name);
+	kfree_const(pool->name);
 	kfree(pool);
 }
 EXPORT_SYMBOL(gen_pool_destroy);
@@ -631,23 +631,25 @@ struct gen_pool *devm_gen_pool_create(struct device *dev, int min_alloc_order,
 	}
 
 	ptr = devres_alloc(devm_gen_pool_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr) {
-		kfree(pool_name);
-		return ERR_PTR(-ENOMEM);
-	}
+	if (!ptr)
+		goto free_pool_name;
 
 	pool = gen_pool_create(min_alloc_order, nid);
-	if (pool) {
-		*ptr = pool;
-		pool->name = pool_name;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-		kfree(pool_name);
-		return ERR_PTR(-ENOMEM);
-	}
+	if (!pool)
+		goto free_devres;
+
+	*ptr = pool;
+	pool->name = pool_name;
+	devres_add(dev, ptr);
 
 	return pool;
+
+free_devres:
+	devres_free(ptr);
+free_pool_name:
+	kfree_const(pool_name);
+
+	return ERR_PTR(-ENOMEM);
 }
 EXPORT_SYMBOL(devm_gen_pool_create);
 
