From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 11:23:44 +0000
Subject: [PATCH] NFSv4.2: Fix an error code in nfs4_xattr_cache_init()
Message-Id: <20200727112344.GH389488@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Frank van der Linden <fllinden@amazon.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

This should return -ENOMEM on failure instead of success.

Fixes: 95ad37f90c33 ("NFSv4.2: add client side xattr caching.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
---
 fs/nfs/nfs42xattr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/nfs42xattr.c b/fs/nfs/nfs42xattr.c
index 23fdab977a2a..e75c4bb70266 100644
--- a/fs/nfs/nfs42xattr.c
+++ b/fs/nfs/nfs42xattr.c
@@ -1040,8 +1040,10 @@ int __init nfs4_xattr_cache_init(void)
 		goto out2;
 
 	nfs4_xattr_cache_wq = alloc_workqueue("nfs4_xattr", WQ_MEM_RECLAIM, 0);
-	if (nfs4_xattr_cache_wq = NULL)
+	if (nfs4_xattr_cache_wq = NULL) {
+		ret = -ENOMEM;
 		goto out1;
+	}
 
 	ret = register_shrinker(&nfs4_xattr_cache_shrinker);
 	if (ret)
-- 
2.27.0
