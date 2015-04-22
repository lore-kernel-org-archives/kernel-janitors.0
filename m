From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 16:35:18 +0000
Subject: [PATCH 04/16] Clean up unnecessary void* pointer cast.
Message-Id: <1429720530-20044-4-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/nfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index d42dff6..fc47d55 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -1819,7 +1819,7 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 struct inode *nfs_alloc_inode(struct super_block *sb)
 {
 	struct nfs_inode *nfsi;
-	nfsi = (struct nfs_inode *)kmem_cache_alloc(nfs_inode_cachep, GFP_KERNEL);
+	nfsi = kmem_cache_alloc(nfs_inode_cachep, GFP_KERNEL);
 	if (!nfsi)
 		return NULL;
 	nfsi->flags = 0UL;
-- 
2.1.0

