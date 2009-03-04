From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 04 Mar 2009 18:34:10 +0000
Subject: [PATCH 2/3] xfs: make symbols static
Message-Id: <20090304183356.525.64082.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
In-Reply-To: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Blyakher <felixb@sgi.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Instead of the keyword 'static' the macro 'STATIC' is used, so the
symbols are still global with CONFIG_XFS_DEBUG.

Fix this sparse warnings:
  fs/xfs/linux-2.6/xfs_super.c:638:1: warning: symbol 'xfs_blkdev_get' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_super.c:655:1: warning: symbol 'xfs_blkdev_put' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_super.c:876:1: warning: symbol 'xfsaild' was not declared. Should it be static?
  fs/xfs/xfs_bmap.c:6208:1: warning: symbol 'xfs_check_block' was not declared. Should it be static?
  fs/xfs/xfs_dir2_leaf.c:553:1: warning: symbol 'xfs_dir2_leaf_check' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/xfs/linux-2.6/xfs_super.c |    6 +++---
 fs/xfs/xfs_bmap.c            |    2 +-
 fs/xfs/xfs_dir2_leaf.c       |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/xfs/linux-2.6/xfs_super.c b/fs/xfs/linux-2.6/xfs_super.c
index bc1e647..9633c3c 100644
--- a/fs/xfs/linux-2.6/xfs_super.c
+++ b/fs/xfs/linux-2.6/xfs_super.c
@@ -633,7 +633,7 @@ xfs_max_file_offset(
 	return (((__uint64_t)pagefactor) << bitshift) - 1;
 }
 
-int
+STATIC int
 xfs_blkdev_get(
 	xfs_mount_t		*mp,
 	const char		*name,
@@ -650,7 +650,7 @@ xfs_blkdev_get(
 	return -error;
 }
 
-void
+STATIC void
 xfs_blkdev_put(
 	struct block_device	*bdev)
 {
@@ -871,7 +871,7 @@ xfsaild_wakeup(
 	wake_up_process(ailp->xa_task);
 }
 
-int
+STATIC int
 xfsaild(
 	void	*data)
 {
diff --git a/fs/xfs/xfs_bmap.c b/fs/xfs/xfs_bmap.c
index c852cd6..27062d0 100644
--- a/fs/xfs/xfs_bmap.c
+++ b/fs/xfs/xfs_bmap.c
@@ -6204,7 +6204,7 @@ xfs_bmap_get_bp(
 	return(bp);
 }
 
-void
+STATIC void
 xfs_check_block(
 	struct xfs_btree_block	*block,
 	xfs_mount_t		*mp,
diff --git a/fs/xfs/xfs_dir2_leaf.c b/fs/xfs/xfs_dir2_leaf.c
index ef805a3..6427ff1 100644
--- a/fs/xfs/xfs_dir2_leaf.c
+++ b/fs/xfs/xfs_dir2_leaf.c
@@ -549,7 +549,7 @@ xfs_dir2_leaf_addname(
  * Check the internal consistency of a leaf1 block.
  * Pop an assert if something is wrong.
  */
-void
+STATIC void
 xfs_dir2_leaf_check(
 	xfs_inode_t		*dp,		/* incore directory inode */
 	xfs_dabuf_t		*bp)		/* leaf's buffer */

