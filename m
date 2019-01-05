From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Jan 2019 18:18:03 +0000
Subject: [PATCH] cifs: Fix a tiny potential memory leak
Message-Id: <20190105181803.GD3288@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The most recent "it" allocation is leaked on this error path.  I
believe that small allocations always succeed in current kernels so
this doesn't really affect run time.

Fixes: 54be1f6c1c37 ("cifs: Add DFS cache routines")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/dfs_cache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cifs/dfs_cache.c b/fs/cifs/dfs_cache.c
index cd63c4a70875..09b7d0d4f6e4 100644
--- a/fs/cifs/dfs_cache.c
+++ b/fs/cifs/dfs_cache.c
@@ -776,6 +776,7 @@ static int get_tgt_list(const struct dfs_cache_entry *ce,
 		it->it_name = kstrndup(t->t_name, strlen(t->t_name),
 				       GFP_KERNEL);
 		if (!it->it_name) {
+			kfree(it);
 			rc = -ENOMEM;
 			goto err_free_it;
 		}
--
2.17.1
