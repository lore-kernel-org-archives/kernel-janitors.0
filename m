From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Oct 2017 15:23:46 +0000
Subject: [PATCH] ocfs2: clean up unused variable warnings
Message-Id: <20171027152346.10869-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several instances where variables are being assigned
a value and that value is never read. Hence these assignments
are redundant and can be safely removed. Cleans up clang build
warnings:

dlmast.c:234:2: warning: Value stored to 'lksb' is never read
file.c:2173:3: warning: Value stored to 'end' is never read
localalloc.c:877:2: warning: Value stored to 'lastzero' is never read
namei.c:2569:2: warning: Value stored to 'di' is never read
refcounttree.c:4157:2: warning: Value stored to 'rb' is never read
suballoc.c:2578:2: warning: Value stored to 'fe' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/dlm/dlmast.c   | 2 --
 fs/ocfs2/file.c         | 3 ---
 fs/ocfs2/localalloc.c   | 3 +--
 fs/ocfs2/namei.c        | 2 --
 fs/ocfs2/refcounttree.c | 2 --
 fs/ocfs2/suballoc.c     | 3 ---
 6 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/fs/ocfs2/dlm/dlmast.c b/fs/ocfs2/dlm/dlmast.c
index fd6bbbbd7d78..39831fc2fd52 100644
--- a/fs/ocfs2/dlm/dlmast.c
+++ b/fs/ocfs2/dlm/dlmast.c
@@ -224,14 +224,12 @@ void dlm_do_local_ast(struct dlm_ctxt *dlm, struct dlm_lock_resource *res,
 		      struct dlm_lock *lock)
 {
 	dlm_astlockfunc_t *fn;
-	struct dlm_lockstatus *lksb;
 
 	mlog(0, "%s: res %.*s, lock %u:%llu, Local AST\n", dlm->name,
 	     res->lockname.len, res->lockname.name,
 	     dlm_get_lock_cookie_node(be64_to_cpu(lock->ml.cookie)),
 	     dlm_get_lock_cookie_seq(be64_to_cpu(lock->ml.cookie)));
 
-	lksb = lock->lksb;
 	fn = lock->ast;
 	BUG_ON(lock->ml.node != dlm->node_num);
 
diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index 6e41fc8fabbe..56b18c3e56bc 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -2133,7 +2133,6 @@ static int ocfs2_prepare_inode_for_write(struct file *file,
 	int ret = 0, meta_level = 0;
 	struct dentry *dentry = file->f_path.dentry;
 	struct inode *inode = d_inode(dentry);
-	loff_t end;
 
 	/*
 	 * We start with a read level meta lock and only jump to an ex
@@ -2170,8 +2169,6 @@ static int ocfs2_prepare_inode_for_write(struct file *file,
 			}
 		}
 
-		end = pos + count;
-
 		ret = ocfs2_check_range_for_refcount(inode, pos, count);
 		if (ret = 1) {
 			ocfs2_inode_unlock(inode, meta_level);
diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
index fe0d1f9571bb..159ee84e3533 100644
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -836,7 +836,7 @@ static int ocfs2_local_alloc_find_clear_bits(struct ocfs2_super *osb,
 				     u32 *numbits,
 				     struct ocfs2_alloc_reservation *resv)
 {
-	int numfound = 0, bitoff, left, startoff, lastzero;
+	int numfound = 0, bitoff, left, startoff;
 	int local_resv = 0;
 	struct ocfs2_alloc_reservation r;
 	void *bitmap = NULL;
@@ -874,7 +874,6 @@ static int ocfs2_local_alloc_find_clear_bits(struct ocfs2_super *osb,
 	bitmap = OCFS2_LOCAL_ALLOC(alloc)->la_bitmap;
 
 	numfound = bitoff = startoff = 0;
-	lastzero = -1;
 	left = le32_to_cpu(alloc->id1.bitmap1.i_total);
 	while ((bitoff = ocfs2_find_next_zero_bit(bitmap, left, startoff)) != -1) {
 		if (bitoff = left) {
diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
index 3b0a10d9b36f..9a962ac53d35 100644
--- a/fs/ocfs2/namei.c
+++ b/fs/ocfs2/namei.c
@@ -2500,7 +2500,6 @@ int ocfs2_create_inode_in_orphan(struct inode *dir,
 	struct inode *inode = NULL;
 	struct inode *orphan_dir = NULL;
 	struct ocfs2_super *osb = OCFS2_SB(dir->i_sb);
-	struct ocfs2_dinode *di = NULL;
 	handle_t *handle = NULL;
 	char orphan_name[OCFS2_ORPHAN_NAMELEN + 1];
 	struct buffer_head *parent_di_bh = NULL;
@@ -2566,7 +2565,6 @@ int ocfs2_create_inode_in_orphan(struct inode *dir,
 		goto leave;
 	}
 
-	di = (struct ocfs2_dinode *)new_di_bh->b_data;
 	status = ocfs2_orphan_add(osb, handle, inode, new_di_bh, orphan_name,
 				  &orphan_insert, orphan_dir, false);
 	if (status < 0) {
diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index ab156e35ec00..840598d88aa4 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -4127,7 +4127,6 @@ static int ocfs2_create_reflink_node(struct inode *s_inode,
 	struct buffer_head *ref_root_bh = NULL;
 	struct ocfs2_cached_dealloc_ctxt dealloc;
 	struct ocfs2_super *osb = OCFS2_SB(s_inode->i_sb);
-	struct ocfs2_refcount_block *rb;
 	struct ocfs2_dinode *di = (struct ocfs2_dinode *)s_bh->b_data;
 	struct ocfs2_refcount_tree *ref_tree;
 
@@ -4154,7 +4153,6 @@ static int ocfs2_create_reflink_node(struct inode *s_inode,
 		mlog_errno(ret);
 		goto out;
 	}
-	rb = (struct ocfs2_refcount_block *)ref_root_bh->b_data;
 
 	ret = ocfs2_duplicate_extent_list(s_inode, t_inode, t_bh,
 					  &ref_tree->rf_ci, ref_root_bh,
diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
index 71f22c8fbffd..a74108d22d47 100644
--- a/fs/ocfs2/suballoc.c
+++ b/fs/ocfs2/suballoc.c
@@ -2566,7 +2566,6 @@ static int _ocfs2_free_clusters(handle_t *handle,
 	int status;
 	u16 bg_start_bit;
 	u64 bg_blkno;
-	struct ocfs2_dinode *fe;
 
 	/* You can't ever have a contiguous set of clusters
 	 * bigger than a block group bitmap so we never have to worry
@@ -2575,8 +2574,6 @@ static int _ocfs2_free_clusters(handle_t *handle,
 	 * gotten tested really well. */
 	BUG_ON(start_blk != ocfs2_clusters_to_blocks(bitmap_inode->i_sb, ocfs2_blocks_to_clusters(bitmap_inode->i_sb, start_blk)));
 
-	fe = (struct ocfs2_dinode *) bitmap_bh->b_data;
-
 	ocfs2_block_to_cluster_group(bitmap_inode, start_blk, &bg_blkno,
 				     &bg_start_bit);
 
-- 
2.14.1

