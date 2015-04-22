From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 16:35:21 +0000
Subject: [PATCH 07/16] Clean up unnecessary void* pointer cast.
Message-Id: <1429720530-20044-7-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/hpfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hpfs/super.c b/fs/hpfs/super.c
index 7cd00d3..ccace08 100644
--- a/fs/hpfs/super.c
+++ b/fs/hpfs/super.c
@@ -201,7 +201,7 @@ static struct kmem_cache * hpfs_inode_cachep;
 static struct inode *hpfs_alloc_inode(struct super_block *sb)
 {
 	struct hpfs_inode_info *ei;
-	ei = (struct hpfs_inode_info *)kmem_cache_alloc(hpfs_inode_cachep, GFP_NOFS);
+	ei = kmem_cache_alloc(hpfs_inode_cachep, GFP_NOFS);
 	if (!ei)
 		return NULL;
 	ei->vfs_inode.i_version = 1;
-- 
2.1.0

