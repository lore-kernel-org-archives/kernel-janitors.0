From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:33:51 +0000
Subject: [PATCH 01/15] reiserfs: Avoid pointless casts of kmem_cache_alloc() return value.
Message-Id: <1429767245-32453-2-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Get rid of pointless cast of kmem_cache_alloc() return value in
fs/reiserfs/super.c::reiserfs_alloc_inode().

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

