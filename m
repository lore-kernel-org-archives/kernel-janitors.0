From: "Tobin C. Harding" <me@tobin.cc>
Date: Wed, 22 Feb 2017 06:27:07 +0000
Subject: [PATCH] ncpfs: Remove cast from memory allocation
Message-Id: <1487744827-20312-1-git-send-email-me@tobin.cc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Vandrovec <petr@vandrovec.name>
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Tobin C. Harding" <me@tobin.cc>

Coccinelle emits WARNING: casting value returned by memory allocation
function to (struct ncp_inode_info *) is useless.

Remove unnecessary cast.

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 fs/ncpfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ncpfs/inode.c b/fs/ncpfs/inode.c
index 7eb89c2..a1b8e7a 100644
--- a/fs/ncpfs/inode.c
+++ b/fs/ncpfs/inode.c
@@ -52,7 +52,7 @@ static struct kmem_cache * ncp_inode_cachep;
 static struct inode *ncp_alloc_inode(struct super_block *sb)
 {
 	struct ncp_inode_info *ei;
-	ei = (struct ncp_inode_info *)kmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
+	ei = lkmem_cache_alloc(ncp_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	return &ei->vfs_inode;
-- 
2.7.4

