From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Nov 2017 14:57:21 +0000
Subject: [PATCH] fs/9p: remove unnecessary cast on return from kmem_cache_alloc
Message-Id: <20171115145721.16357-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The cast on the return from kmem_cache_alloc is unnecessary and can
be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/9p/vfs_inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index bdabb2765d1b..6c4baeb257b7 100644
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
2.14.1

