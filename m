From: Shaun Zinck <shaun.zinck@gmail.com>
Date: Tue, 28 Aug 2007 04:34:12 +0000
Subject: fs: use DIV_ROUND_UP where possible
Message-Id: <20070827233412.7edda681@shaun>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Convert code and definitions that look similar to DIV_ROUND_UP (defined in
kernel.h), to use DIV_ROUND_UP instead of redefining or recoding it.
    
Signed-off-by: Shaun Zinck <shaun.zinck@gmail.com>
---
 fs/block_dev.c               |    2 +-
 fs/direct-io.c               |    7 +++----
 fs/jfs/jfs_dtree.h           |    4 ++--
 fs/jfs/resize.c              |    2 +-
 fs/nfs/nfs4renewd.c          |    4 ++--
 fs/ocfs2/cluster/heartbeat.c |    2 +-
 fs/ocfs2/dlm/dlmcommon.h     |    2 +-
 fs/xfs/linux-2.6/xfs_linux.h |    1 -
 fs/xfs/xfs_alloc.c           |    4 ++--
 fs/xfs/xfs_bmap.c            |    4 ++--
 fs/xfs/xfs_dir2_leaf.c       |    4 ++--
 fs/xfs/xfs_ialloc.c          |    4 ++--
 12 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 2980eab..8e0051d 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -286,7 +286,7 @@ blkdev_direct_IO(int rw, struct kiocb *iocb, const struct iovec *iov,
 
 	while (nbytes) {
 		/* roughly estimate number of bio vec needed */
-		nvec = (nbytes + PAGE_SIZE - 1) / PAGE_SIZE;
+		nvec = DIV_ROUND_UP(nbytes, PAGE_SIZE);
 		nvec = max(nvec, nr_segs - seg);
 		nvec = min(nvec, (unsigned long) BIO_MAX_PAGES);
 
diff --git a/fs/direct-io.c b/fs/direct-io.c
index 901dc55..55735a5 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -984,9 +984,8 @@ direct_io_worker(int rw, struct kiocb *iocb, struct inode *inode,
 
 	for (seg = 0; seg < nr_segs; seg++) {
 		user_addr = (unsigned long)iov[seg].iov_base;
-		dio->pages_in_io +-			((user_addr+iov[seg].iov_len +PAGE_SIZE-1)/PAGE_SIZE
-				- user_addr/PAGE_SIZE);
+		dio->pages_in_io += DIV_ROUND_UP(user_addr+iov[seg].iov_len, PAGE_SIZE)
+			- user_addr/PAGE_SIZE;
 	}
 
 	for (seg = 0; seg < nr_segs; seg++) {
@@ -1007,7 +1006,7 @@ direct_io_worker(int rw, struct kiocb *iocb, struct inode *inode,
 			dio->total_pages++;
 			bytes -= PAGE_SIZE - (user_addr & (PAGE_SIZE - 1));
 		}
-		dio->total_pages += (bytes + PAGE_SIZE - 1) / PAGE_SIZE;
+		dio->total_pages += DIV_ROUND_UP(bytes, PAGE_SIZE);
 		dio->curr_user_address = user_addr;
 	
 		ret = do_direct_IO(dio);
diff --git a/fs/jfs/jfs_dtree.h b/fs/jfs/jfs_dtree.h
index 8561c6e..cdac2d5 100644
--- a/fs/jfs/jfs_dtree.h
+++ b/fs/jfs/jfs_dtree.h
@@ -74,7 +74,7 @@ struct idtentry {
 #define DTIHDRDATALEN	11
 
 /* compute number of slots for entry */
-#define	NDTINTERNAL(klen) ( ((4 + (klen)) + (15 - 1)) / 15 )
+#define	NDTINTERNAL(klen) (DIV_ROUND_UP((4 + (klen)), 15))
 
 
 /*
@@ -133,7 +133,7 @@ struct dir_table_slot {
 	( ((s64)((dts)->addr1)) << 32 | __le32_to_cpu((dts)->addr2) )
 
 /* compute number of slots for entry */
-#define	NDTLEAF_LEGACY(klen)	( ((2 + (klen)) + (15 - 1)) / 15 )
+#define	NDTLEAF_LEGACY(klen)	(DIV_ROUND_UP((2 + (klen)), 15))
 #define	NDTLEAF	NDTINTERNAL
 
 
diff --git a/fs/jfs/resize.c b/fs/jfs/resize.c
index 71984ee..7f24a0b 100644
--- a/fs/jfs/resize.c
+++ b/fs/jfs/resize.c
@@ -172,7 +172,7 @@ int jfs_extendfs(struct super_block *sb, s64 newLVSize, int newLogSize)
 	 */
 	t64 = ((newLVSize - newLogSize + BPERDMAP - 1) >> L2BPERDMAP)
 	    << L2BPERDMAP;
-	t32 = ((t64 + (BITSPERPAGE - 1)) / BITSPERPAGE) + 1 + 50;
+	t32 = DIV_ROUND_UP(t64, BITSPERPAGE) + 1 + 50;
 	newFSCKSize = t32 << sbi->l2nbperpage;
 	newFSCKAddress = newLogAddress - newFSCKSize;
 
diff --git a/fs/nfs/nfs4renewd.c b/fs/nfs/nfs4renewd.c
index 3ea352d..a0a1d8a 100644
--- a/fs/nfs/nfs4renewd.c
+++ b/fs/nfs/nfs4renewd.c
@@ -96,7 +96,7 @@ nfs4_renew_state(struct work_struct *work)
 	if (timeout < 5 * HZ)    /* safeguard */
 		timeout = 5 * HZ;
 	dprintk("%s: requeueing work. Lease period = %ld\n",
-			__FUNCTION__, (timeout + HZ - 1) / HZ);
+			__FUNCTION__, DIV_ROUND_UP(timeout, HZ));
 	cancel_delayed_work(&clp->cl_renewd);
 	schedule_delayed_work(&clp->cl_renewd, timeout);
 	spin_unlock(&clp->cl_lock);
@@ -117,7 +117,7 @@ nfs4_schedule_state_renewal(struct nfs_client *clp)
 	if (timeout < 5 * HZ)
 		timeout = 5 * HZ;
 	dprintk("%s: requeueing work. Lease period = %ld\n",
-			__FUNCTION__, (timeout + HZ - 1) / HZ);
+			__FUNCTION__, DIV_ROUND_UP(timeout, HZ));
 	cancel_delayed_work(&clp->cl_renewd);
 	schedule_delayed_work(&clp->cl_renewd, timeout);
 	set_bit(NFS_CS_RENEWD, &clp->cl_res_state);
diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 2bd7f78..8086325 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -1154,7 +1154,7 @@ static int o2hb_map_slot_data(struct o2hb_region *reg)
 		slot->ds_raw_block = NULL;
 	}
 
-	reg->hr_num_pages = (reg->hr_blocks + spp - 1) / spp;
+	reg->hr_num_pages = DIV_ROUND_UP(reg->hr_blocks, spp);
 	mlog(ML_HEARTBEAT, "Going to require %u pages to cover %u blocks "
 			   "at %u blocks per page\n",
 	     reg->hr_num_pages, reg->hr_blocks, spp);
diff --git a/fs/ocfs2/dlm/dlmcommon.h b/fs/ocfs2/dlm/dlmcommon.h
index e90b92f..bf8d181 100644
--- a/fs/ocfs2/dlm/dlmcommon.h
+++ b/fs/ocfs2/dlm/dlmcommon.h
@@ -626,7 +626,7 @@ struct dlm_begin_reco
 
 
 #define BITS_PER_BYTE 8
-#define BITS_TO_BYTES(bits) (((bits)+BITS_PER_BYTE-1)/BITS_PER_BYTE)
+#define BITS_TO_BYTES(bits) (DIV_ROUND_UP((bits), BITS_PER_BYTE))
 
 struct dlm_query_join_request
 {
diff --git a/fs/xfs/linux-2.6/xfs_linux.h b/fs/xfs/linux-2.6/xfs_linux.h
index 330c4ba..9240997 100644
--- a/fs/xfs/linux-2.6/xfs_linux.h
+++ b/fs/xfs/linux-2.6/xfs_linux.h
@@ -197,7 +197,6 @@
 
 #define MIN(a,b)	(min(a,b))
 #define MAX(a,b)	(max(a,b))
-#define howmany(x, y)	(((x)+((y)-1))/(y))
 
 /*
  * Various platform dependent calls that don't fit anywhere else
diff --git a/fs/xfs/xfs_alloc.c b/fs/xfs/xfs_alloc.c
index 012a649..6dcfda9 100644
--- a/fs/xfs/xfs_alloc.c
+++ b/fs/xfs/xfs_alloc.c
@@ -1783,9 +1783,9 @@ xfs_alloc_compute_maxlevels(
 	maxleafents = (mp->m_sb.sb_agblocks + 1) / 2;
 	minleafrecs = mp->m_alloc_mnr[0];
 	minnoderecs = mp->m_alloc_mnr[1];
-	maxblocks = (maxleafents + minleafrecs - 1) / minleafrecs;
+	maxblocks = DIV_ROUND_UP(maxleafents, minleafrecs);
 	for (level = 1; maxblocks > 1; level++)
-		maxblocks = (maxblocks + minnoderecs - 1) / minnoderecs;
+		maxblocks = DIV_ROUND_UP(maxblocks, minnoderecs);
 	mp->m_ag_maxlevels = level;
 }
 
diff --git a/fs/xfs/xfs_bmap.c b/fs/xfs/xfs_bmap.c
index 94b5c5f..8281254 100644
--- a/fs/xfs/xfs_bmap.c
+++ b/fs/xfs/xfs_bmap.c
@@ -4184,12 +4184,12 @@ xfs_bmap_compute_maxlevels(
 	maxrootrecs = (int)XFS_BTREE_BLOCK_MAXRECS(sz, xfs_bmdr, 0);
 	minleafrecs = mp->m_bmap_dmnr[0];
 	minnoderecs = mp->m_bmap_dmnr[1];
-	maxblocks = (maxleafents + minleafrecs - 1) / minleafrecs;
+	maxblocks = DIV_ROUND_UP(maxleafents, minleafrecs);
 	for (level = 1; maxblocks > 1; level++) {
 		if (maxblocks <= maxrootrecs)
 			maxblocks = 1;
 		else
-			maxblocks = (maxblocks + minnoderecs - 1) / minnoderecs;
+			maxblocks = DIV_ROUND_UP(maxblocks, minnoderecs);
 	}
 	mp->m_bm_maxlevels[whichfork] = level;
 }
diff --git a/fs/xfs/xfs_dir2_leaf.c b/fs/xfs/xfs_dir2_leaf.c
index 1b73c9a..892ddda 100644
--- a/fs/xfs/xfs_dir2_leaf.c
+++ b/fs/xfs/xfs_dir2_leaf.c
@@ -805,7 +805,7 @@ xfs_dir2_leaf_getdents(
 	 * block size.
 	 */
 	map_size -		howmany(uio->uio_resid + mp->m_dirblksize,
+		DIV_ROUND_UP(uio->uio_resid + mp->m_dirblksize,
 			mp->m_sb.sb_blocksize);
 	map = kmem_alloc(map_size * sizeof(*map), KM_SLEEP);
 	map_valid = ra_index = ra_offset = ra_current = map_blocks = 0;
@@ -862,7 +862,7 @@ xfs_dir2_leaf_getdents(
 			/*
 			 * Recalculate the readahead blocks wanted.
 			 */
-			ra_want = howmany(uio->uio_resid + mp->m_dirblksize,
+			ra_want = DIV_ROUND_UP(uio->uio_resid + mp->m_dirblksize,
 					  mp->m_sb.sb_blocksize) - 1;
 			/*
 			 * If we don't have as many as we want, and we haven't
diff --git a/fs/xfs/xfs_ialloc.c b/fs/xfs/xfs_ialloc.c
index f943368..0864197 100644
--- a/fs/xfs/xfs_ialloc.c
+++ b/fs/xfs/xfs_ialloc.c
@@ -1298,9 +1298,9 @@ xfs_ialloc_compute_maxlevels(
 		XFS_INODES_PER_CHUNK_LOG;
 	minleafrecs = mp->m_alloc_mnr[0];
 	minnoderecs = mp->m_alloc_mnr[1];
-	maxblocks = (maxleafents + minleafrecs - 1) / minleafrecs;
+	maxblocks = DIV_ROUND_UP(maxleafents, minleafrecs);
 	for (level = 1; maxblocks > 1; level++)
-		maxblocks = (maxblocks + minnoderecs - 1) / minnoderecs;
+		maxblocks = DIV_ROUND_UP(maxblocks, minnoderecs);
 	mp->m_in_maxlevels = level;
 }
 
