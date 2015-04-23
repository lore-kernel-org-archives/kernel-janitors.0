From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:33:58 +0000
Subject: [PATCH 08/15] adfs:Remove unneeded kmem_cache_alloc() return value cast
Message-Id: <1429767245-32453-9-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

kmem_cache_alloc() returns a void pointer - no need to cast it in
fs/adfs/super.c::adfs_alloc_inode()

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/adfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/adfs/super.c b/fs/adfs/super.c
index a19c31d..4d4a0df 100644
--- a/fs/adfs/super.c
+++ b/fs/adfs/super.c
@@ -242,7 +242,7 @@ static struct kmem_cache *adfs_inode_cachep;
 static struct inode *adfs_alloc_inode(struct super_block *sb)
 {
 	struct adfs_inode_info *ei;
-	ei = (struct adfs_inode_info *)kmem_cache_alloc(adfs_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(adfs_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
2.1.0

