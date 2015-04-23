From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 07:48:23 +0000
Subject: [PATCH v2 04/15] ncpfs: Get rid of some pointless allocation cast
Message-Id: <1429775314-4171-5-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove explicit casts of kmem_cache_alloc return values in
fs/ncpfs/inode.c::ncp_alloc_inode().

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

