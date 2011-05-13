From: Julia Lawall <julia@diku.dk>
Date: Fri, 13 May 2011 21:23:02 +0000
Subject: [PATCH] fs/freevxfs/vxfs_fshead.c: Convert kfree to kmem_cache_free
Message-Id: <1305321782-30566-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

vxfs_blkiget allocates its return value using kmem_cache_alloc, so that
value should be freed using kmem_cache_free.  The cache is already made
available via vxfs_extern.h.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/freevxfs/vxfs_fshead.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/freevxfs/vxfs_fshead.c b/fs/freevxfs/vxfs_fshead.c
index c9a6a94..86b59e7 100644
--- a/fs/freevxfs/vxfs_fshead.c
+++ b/fs/freevxfs/vxfs_fshead.c
@@ -198,6 +198,6 @@ vxfs_read_fshead(struct super_block *sbp)
 	iput(infp->vsi_fship);
 	return -EINVAL;
  out_free_fship:
- 	kfree(vip);
+	kmem_cache_free(vxfs_inode_cachep, vip);
 	return -EINVAL;
 }

