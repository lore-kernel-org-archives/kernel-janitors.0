From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 May 2012 08:58:12 +0000
Subject: [patch] dlm: NULL dereference on failure in kmem_cache_create()
Message-Id: <20120515085812.GF30265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We aren't allowed to pass NULL pointers to kmem_cache_destroy() so if
both allocations fail, it leads to a NULL dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index da64df7..7cd24bc 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -21,21 +21,19 @@ static struct kmem_cache *rsb_cache;
 
 int __init dlm_memory_init(void)
 {
-	int ret = 0;
-
 	lkb_cache = kmem_cache_create("dlm_lkb", sizeof(struct dlm_lkb),
 				__alignof__(struct dlm_lkb), 0, NULL);
 	if (!lkb_cache)
-		ret = -ENOMEM;
+		return -ENOMEM;
 
 	rsb_cache = kmem_cache_create("dlm_rsb", sizeof(struct dlm_rsb),
 				__alignof__(struct dlm_rsb), 0, NULL);
 	if (!rsb_cache) {
 		kmem_cache_destroy(lkb_cache);
-		ret = -ENOMEM;
+		return -ENOMEM;
 	}
 
-	return ret;
+	return 0;
 }
 
 void dlm_memory_exit(void)
