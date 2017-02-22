From: "Tobin C. Harding" <me@tobin.cc>
Date: Wed, 22 Feb 2017 06:34:13 +0000
Subject: [PATCH] fs/9p:  Remove cast from memory allocation
Message-Id: <1487745253-15411-1-git-send-email-me@tobin.cc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>
Cc: v9fs-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Tobin C. Harding" <me@tobin.cc>

Coccinelle emits WARNING: casting value returned by memory allocation
function to (struct v9fs_inode *) is useless.

Remove unnecessary cast.

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 fs/9p/vfs_inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index f4f4450..462e9e4 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -238,8 +238,7 @@ v9fs_blank_wstat(struct p9_wstat *wstat)
 struct inode *v9fs_alloc_inode(struct super_block *sb)
 {
 	struct v9fs_inode *v9inode;
-	v9inode = (struct v9fs_inode *)kmem_cache_alloc(v9fs_inode_cache,
-							GFP_KERNEL);
+	v9inode = kmem_cache_alloc(v9fs_inode_cache, GFP_KERNEL);
 	if (!v9inode)
 		return NULL;
 #ifdef CONFIG_9P_FSCACHE
-- 
2.7.4

