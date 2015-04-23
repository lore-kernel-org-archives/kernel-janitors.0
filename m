From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 07:48:26 +0000
Subject: [PATCH v2 07/15] efs: Remove unneeded cast
Message-Id: <1429775314-4171-8-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

kmem_cache_alloc() returns a void pointer - no need to cast it in
fs/efs/super.c::efs_alloc_inode().

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/efs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/efs/super.c b/fs/efs/super.c
index 7fca462..c8411a3 100644
--- a/fs/efs/super.c
+++ b/fs/efs/super.c
@@ -67,7 +67,7 @@ static struct kmem_cache * efs_inode_cachep;
 static struct inode *efs_alloc_inode(struct super_block *sb)
 {
 	struct efs_inode_info *ei;
-	ei = (struct efs_inode_info *)kmem_cache_alloc(efs_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(efs_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
2.1.0

