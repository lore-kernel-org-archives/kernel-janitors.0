From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 16:35:16 +0000
Subject: [PATCH 02/16] Clean up unnecessary void* pointer cast.
Message-Id: <1429720530-20044-2-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/reiserfs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 68b5f18..36177d5 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -588,8 +588,7 @@ static struct kmem_cache *reiserfs_inode_cachep;
 static struct inode *reiserfs_alloc_inode(struct super_block *sb)
 {
 	struct reiserfs_inode_info *ei;
-	ei = (struct reiserfs_inode_info *)
-	    kmem_cache_alloc(reiserfs_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(reiserfs_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	atomic_set(&ei->openers, 0);
-- 
2.1.0

