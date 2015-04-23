From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:33:56 +0000
Subject: [PATCH 06/15]  hpfs:Remove explicit casts of kmem_cache_alloc() return value
Message-Id: <1429767245-32453-7-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Avoid a pointless kmem_cache_alloc() return value cast in
fs/hpfs/super.c::hpfs_alloc_inode()

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

