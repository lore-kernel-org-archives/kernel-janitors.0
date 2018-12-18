From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 18 Dec 2018 06:37:02 +0000
Subject: [PATCH -next] cifs: Fix to use kmem_cache_free() instead of kfree()
Message-Id: <1545115022-164840-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

memory allocated by kmem_cache_alloc() in alloc_cache_entry()
should be freed using kmem_cache_free(), not kfree().

Fixes: 34a44fb160f9 ("cifs: Add DFS cache routines")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/cifs/dfs_cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/dfs_cache.c b/fs/cifs/dfs_cache.c
index d20cc94..f745677 100644
--- a/fs/cifs/dfs_cache.c
+++ b/fs/cifs/dfs_cache.c
@@ -414,7 +414,7 @@ static int copy_ref_data(const struct dfs_info3_param *refs, int numrefs,
 
 	ce->ce_path = kstrdup_const(path, GFP_KERNEL);
 	if (!ce->ce_path) {
-		kfree(ce);
+		kmem_cache_free(dfs_cache_slab, ce);
 		return ERR_PTR(-ENOMEM);
 	}
 	INIT_HLIST_NODE(&ce->ce_hlist);
@@ -423,7 +423,7 @@ static int copy_ref_data(const struct dfs_info3_param *refs, int numrefs,
 	rc = copy_ref_data(refs, numrefs, ce, NULL);
 	if (rc) {
 		kfree(ce->ce_path);
-		kfree(ce);
+		kmem_cache_free(dfs_cache_slab, ce);
 		ce = ERR_PTR(rc);
 	}
 	return ce;
