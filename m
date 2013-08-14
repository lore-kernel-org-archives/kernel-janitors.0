From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 09:44:39 +0000
Subject: [patch] VFS: collect_mounts() should return an ERR_PTR
Message-Id: <20130814094439.GD521@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should actually be returning an ERR_PTR on error instead of NULL.
That was how it was designed and all the callers expect it.

Cc: <stable@vger.kernel.org> # 3.10+
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/namespace.c b/fs/namespace.c
index 9809084..f1c61bb 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1429,7 +1429,7 @@ struct vfsmount *collect_mounts(struct path *path)
 			 CL_COPY_ALL | CL_PRIVATE);
 	namespace_unlock();
 	if (IS_ERR(tree))
-		return NULL;
+		return ERR_CAST(tree);
 	return &tree->mnt;
 }
 
