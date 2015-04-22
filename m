From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 16:35:19 +0000
Subject: [PATCH 05/16] Clean up unnecessary void* pointer cast.
Message-Id: <1429720530-20044-5-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/ncpfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ncpfs/inode.c b/fs/ncpfs/inode.c
index 01a9e16..a3aab17 100644
--- a/fs/ncpfs/inode.c
+++ b/fs/ncpfs/inode.c
@@ -52,7 +52,7 @@ static struct kmem_cache * ncp_inode_cachep;
 static struct inode *ncp_alloc_inode(struct super_block *sb)
 {
 	struct ncp_inode_info *ei;
-	ei = (struct ncp_inode_info *)kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
2.1.0

