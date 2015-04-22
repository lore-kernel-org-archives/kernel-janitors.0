From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 16:35:20 +0000
Subject: [PATCH 06/16] Clean up unnecessary void* pointer cast.
Message-Id: <1429720530-20044-6-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/minix/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index 3f57af1..8898633 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -62,7 +62,7 @@ static struct kmem_cache * minix_inode_cachep;
 static struct inode *minix_alloc_inode(struct super_block *sb)
 {
 	struct minix_inode_info *ei;
-	ei = (struct minix_inode_info *)kmem_cache_alloc(minix_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(minix_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
2.1.0

