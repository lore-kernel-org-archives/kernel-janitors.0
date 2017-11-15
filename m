From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Nov 2017 13:55:47 +0000
Subject: [PATCH] ncpfs/inode.c: remove unnecessary cast on return from kmem_cache_alloc
Message-Id: <20171115135547.13869-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Vandrovec <petr@vandrovec.name>, Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The cast on the return from kmem_cache_alloc is unnecessary and can
be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ncpfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ncpfs/inode.c b/fs/ncpfs/inode.c
index 41de88cdc053..6a945532ea1b 100644
--- a/fs/ncpfs/inode.c
+++ b/fs/ncpfs/inode.c
@@ -53,7 +53,7 @@ static struct kmem_cache * ncp_inode_cachep;
 static struct inode *ncp_alloc_inode(struct super_block *sb)
 {
 	struct ncp_inode_info *ei;
-	ei = (struct ncp_inode_info *)kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
2.14.1

