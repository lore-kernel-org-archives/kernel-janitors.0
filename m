From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 13:37:47 +0000
Subject: [PATCH 3/3] jfs: Adjust 67 checks for null pointers
Message-Id: <19c99dec-f394-01cf-43fc-0f36d0732107@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ce43084-11c3-6fc0-821b-7fa6e67c3e30@users.sourceforge.net>
In-Reply-To: <3ce43084-11c3-6fc0-821b-7fa6e67c3e30@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, Fabian Frederick <fabf@skynet.be>, Jan Kara <jack@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 15:15:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/jfs/jfs_dmap.c     | 44 ++++++++++++++++++++++----------------------
 fs/jfs/jfs_dtree.c    |  6 +++---
 fs/jfs/jfs_imap.c     | 25 ++++++++++++-------------
 fs/jfs/jfs_logmgr.c   | 18 +++++++++---------
 fs/jfs/jfs_metapage.c |  5 ++---
 fs/jfs/jfs_mount.c    |  6 +++---
 fs/jfs/jfs_txnmgr.c   |  6 +++---
 fs/jfs/jfs_unicode.c  |  3 +--
 fs/jfs/jfs_xtree.c    |  6 +++---
 fs/jfs/namei.c        |  3 +--
 fs/jfs/resize.c       |  2 +-
 fs/jfs/super.c        |  4 ++--
 fs/jfs/xattr.c        | 10 +++++-----
 13 files changed, 67 insertions(+), 71 deletions(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index 2d514c7affc2..59a8f86984c2 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -174,14 +174,14 @@ int dbMount(struct inode *ipbmap)
 	 */
 	/* allocate memory for the in-memory bmap descriptor */
 	bmp = kmalloc(sizeof(struct bmap), GFP_KERNEL);
-	if (bmp = NULL)
+	if (!bmp)
 		return -ENOMEM;
 
 	/* read the on-disk bmap descriptor. */
 	mp = read_metapage(ipbmap,
 			   BMAPBLKNO << JFS_SBI(ipbmap->i_sb)->l2nbperpage,
 			   PSIZE, 0);
-	if (mp = NULL) {
+	if (!mp) {
 		kfree(bmp);
 		return -EIO;
 	}
@@ -274,7 +274,7 @@ int dbSync(struct inode *ipbmap)
 	mp = read_metapage(ipbmap,
 			   BMAPBLKNO << JFS_SBI(ipbmap->i_sb)->l2nbperpage,
 			   PSIZE, 0);
-	if (mp = NULL) {
+	if (!mp) {
 		jfs_err("dbSync: read_metapage failed!");
 		return -EIO;
 	}
@@ -370,7 +370,7 @@ int dbFree(struct inode *ip, s64 blkno, s64 nblocks)
 		/* get the buffer for the current dmap. */
 		lblkno = BLKTODMAP(blkno, bmp->db_l2nbperpage);
 		mp = read_metapage(ipbmap, lblkno, PSIZE, 0);
-		if (mp = NULL) {
+		if (!mp) {
 			IREAD_UNLOCK(ipbmap);
 			return -EIO;
 		}
@@ -464,7 +464,7 @@ dbUpdatePMap(struct inode *ipbmap,
 
 			mp = read_metapage(bmp->db_ipbmap, lblkno, PSIZE,
 					   0);
-			if (mp = NULL)
+			if (!mp)
 				return -EIO;
 			metapage_wait_for_io(mp);
 		}
@@ -780,7 +780,7 @@ int dbAlloc(struct inode *ip, s64 hint, s64 nblocks, s64 * results)
 		rc = -EIO;
 		lblkno = BLKTODMAP(blkno, bmp->db_l2nbperpage);
 		mp = read_metapage(ipbmap, lblkno, PSIZE, 0);
-		if (mp = NULL)
+		if (!mp)
 			goto read_unlock;
 
 		dp = (struct dmap *) mp->data;
@@ -922,7 +922,7 @@ int dbAllocExact(struct inode *ip, s64 blkno, int nblocks)
 	/* read in the dmap covering the extent */
 	lblkno = BLKTODMAP(blkno, bmp->db_l2nbperpage);
 	mp = read_metapage(ipbmap, lblkno, PSIZE, 0);
-	if (mp = NULL) {
+	if (!mp) {
 		IREAD_UNLOCK(ipbmap);
 		return -EIO;
 	}
@@ -1078,7 +1078,7 @@ static int dbExtend(struct inode *ip, s64 blkno, s64 nblocks, s64 addnblocks)
 	 */
 	lblkno = BLKTODMAP(extblkno, bmp->db_l2nbperpage);
 	mp = read_metapage(ipbmap, lblkno, PSIZE, 0);
-	if (mp = NULL) {
+	if (!mp) {
 		IREAD_UNLOCK(ipbmap);
 		return -EIO;
 	}
@@ -1421,7 +1421,7 @@ dbAllocAG(struct bmap * bmp, int agno, s64 nblocks, int l2nb, s64 * results)
 	 */
 	lblkno = BLKTOCTL(blkno, bmp->db_l2nbperpage, bmp->db_aglevel);
 	mp = read_metapage(bmp->db_ipbmap, lblkno, PSIZE, 0);
-	if (mp = NULL)
+	if (!mp)
 		return -EIO;
 	dcp = (struct dmapctl *) mp->data;
 	budmin = dcp->budmin;
@@ -1642,7 +1642,7 @@ s64 dbDiscardAG(struct inode *ip, int agno, s64 minlen)
 	do_div(max_ranges, minlen);
 	range_cnt = min_t(u64, max_ranges + 1, 32 * 1024);
 	totrim = kmalloc(sizeof(struct range2trim) * range_cnt, GFP_NOFS);
-	if (totrim = NULL) {
+	if (!totrim) {
 		jfs_error(bmp->db_ipbmap->i_sb, "no memory for trim array\n");
 		IWRITE_UNLOCK(ipbmap);
 		return 0;
@@ -1743,7 +1743,7 @@ static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno)
 		 */
 		lblkno = BLKTOCTL(b, bmp->db_l2nbperpage, lev);
 		mp = read_metapage(bmp->db_ipbmap, lblkno, PSIZE, 0);
-		if (mp = NULL)
+		if (!mp)
 			return -EIO;
 		dcp = (struct dmapctl *) mp->data;
 		budmin = dcp->budmin;
@@ -1857,7 +1857,7 @@ dbAllocCtl(struct bmap * bmp, s64 nblocks, int l2nb, s64 blkno, s64 * results)
 		 */
 		lblkno = BLKTODMAP(blkno, bmp->db_l2nbperpage);
 		mp = read_metapage(bmp->db_ipbmap, lblkno, PSIZE, 0);
-		if (mp = NULL)
+		if (!mp)
 			return -EIO;
 		dp = (struct dmap *) mp->data;
 
@@ -1884,7 +1884,7 @@ dbAllocCtl(struct bmap * bmp, s64 nblocks, int l2nb, s64 blkno, s64 * results)
 		 */
 		lblkno = BLKTODMAP(b, bmp->db_l2nbperpage);
 		mp = read_metapage(bmp->db_ipbmap, lblkno, PSIZE, 0);
-		if (mp = NULL) {
+		if (!mp) {
 			rc = -EIO;
 			goto backout;
 		}
@@ -1937,7 +1937,7 @@ dbAllocCtl(struct bmap * bmp, s64 nblocks, int l2nb, s64 blkno, s64 * results)
 		 */
 		lblkno = BLKTODMAP(b, bmp->db_l2nbperpage);
 		mp = read_metapage(bmp->db_ipbmap, lblkno, PSIZE, 0);
-		if (mp = NULL) {
+		if (!mp) {
 			/* could not back out.  mark the file system
 			 * to indicate that we have leaked blocks.
 			 */
@@ -2519,7 +2519,7 @@ dbAdjCtl(struct bmap * bmp, s64 blkno, int newval, int alloc, int level)
 	 */
 	lblkno = BLKTOCTL(blkno, bmp->db_l2nbperpage, level);
 	mp = read_metapage(bmp->db_ipbmap, lblkno, PSIZE, 0);
-	if (mp = NULL)
+	if (!mp)
 		return -EIO;
 	dcp = (struct dmapctl *) mp->data;
 
@@ -3232,7 +3232,7 @@ int dbAllocBottomUp(struct inode *ip, s64 blkno, s64 nblocks)
 		/* get the buffer for the current dmap. */
 		lblkno = BLKTODMAP(blkno, bmp->db_l2nbperpage);
 		mp = read_metapage(ipbmap, lblkno, PSIZE, 0);
-		if (mp = NULL) {
+		if (!mp) {
 			IREAD_UNLOCK(ipbmap);
 			return -EIO;
 		}
@@ -3485,7 +3485,7 @@ int dbExtendFS(struct inode *ipbmap, s64 blkno,	s64 nblocks)
 		if (j0) {
 			/* read in L1 page: (blkno & (MAXL1SIZE - 1)) */
 			l1mp = read_metapage(ipbmap, p, PSIZE, 0);
-			if (l1mp = NULL)
+			if (!l1mp)
 				goto errout;
 			l1dcp = (struct dmapctl *) l1mp->data;
 
@@ -3497,7 +3497,7 @@ int dbExtendFS(struct inode *ipbmap, s64 blkno,	s64 nblocks)
 		} else {
 			/* assign/init L1 page */
 			l1mp = get_metapage(ipbmap, p, PSIZE, 0);
-			if (l1mp = NULL)
+			if (!l1mp)
 				goto errout;
 
 			l1dcp = (struct dmapctl *) l1mp->data;
@@ -3517,7 +3517,7 @@ int dbExtendFS(struct inode *ipbmap, s64 blkno,	s64 nblocks)
 				/* read in L0 page: (blkno & (MAXL0SIZE - 1)) */
 
 				l0mp = read_metapage(ipbmap, p, PSIZE, 0);
-				if (l0mp = NULL)
+				if (!l0mp)
 					goto errout;
 				l0dcp = (struct dmapctl *) l0mp->data;
 
@@ -3531,7 +3531,7 @@ int dbExtendFS(struct inode *ipbmap, s64 blkno,	s64 nblocks)
 			} else {
 				/* assign/init L0 page */
 				l0mp = get_metapage(ipbmap, p, PSIZE, 0);
-				if (l0mp = NULL)
+				if (!l0mp)
 					goto errout;
 
 				l0dcp = (struct dmapctl *) l0mp->data;
@@ -3554,14 +3554,14 @@ int dbExtendFS(struct inode *ipbmap, s64 blkno,	s64 nblocks)
 					/* read in dmap page: */
 					mp = read_metapage(ipbmap, p,
 							   PSIZE, 0);
-					if (mp = NULL)
+					if (!mp)
 						goto errout;
 					n = min(nblocks, (s64)BPERDMAP - n);
 				} else {
 					/* assign/init dmap page */
 					mp = read_metapage(ipbmap, p,
 							   PSIZE, 0);
-					if (mp = NULL)
+					if (!mp)
 						goto errout;
 
 					n = min_t(s64, nblocks, BPERDMAP);
diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index de2bcb36e079..b3202b5b0acd 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -1365,7 +1365,7 @@ static int dtSplitPage(tid_t tid, struct inode *ip, struct dtsplit * split,
 	pxdlist->npxd++;
 	rbn = addressPXD(pxd);
 	rmp = get_metapage(ip, rbn, PSIZE, 1);
-	if (rmp = NULL)
+	if (!rmp)
 		return -EIO;
 
 	/* Allocate blocks to quota. */
@@ -3781,12 +3781,12 @@ static int ciGetLeafPrefixKey(dtpage_t * lp, int li, dtpage_t * rp,
 
 	lkey.name = kmalloc((JFS_NAME_MAX + 1) * sizeof(wchar_t),
 					GFP_KERNEL);
-	if (lkey.name = NULL)
+	if (!lkey.name)
 		return -ENOMEM;
 
 	rkey.name = kmalloc((JFS_NAME_MAX + 1) * sizeof(wchar_t),
 					GFP_KERNEL);
-	if (rkey.name = NULL) {
+	if (!rkey.name) {
 		kfree(lkey.name);
 		return -ENOMEM;
 	}
diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index a7e3a61187db..0dcbdf556a1a 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -124,7 +124,7 @@ int diMount(struct inode *ipimap)
 	mp = read_metapage(ipimap,
 			   IMAPBLKNO << JFS_SBI(ipimap->i_sb)->l2nbperpage,
 			   PSIZE, 0);
-	if (mp = NULL) {
+	if (!mp) {
 		kfree(imap);
 		return -EIO;
 	}
@@ -228,7 +228,7 @@ int diSync(struct inode *ipimap)
 	mp = get_metapage(ipimap,
 			  IMAPBLKNO << JFS_SBI(ipimap->i_sb)->l2nbperpage,
 			  PSIZE, 0);
-	if (mp = NULL) {
+	if (!mp) {
 		jfs_err("diSync: get_metapage failed!");
 		return -EIO;
 	}
@@ -433,7 +433,7 @@ struct inode *diReadSpecial(struct super_block *sb, ino_t inum, int secondary)
 	struct metapage *mp;
 
 	ip = new_inode(sb);
-	if (ip = NULL) {
+	if (!ip) {
 		jfs_err("diReadSpecial: new_inode returned NULL!");
 		return ip;
 	}
@@ -454,7 +454,7 @@ struct inode *diReadSpecial(struct super_block *sb, ino_t inum, int secondary)
 
 	/* read the page of fixed disk inode (AIT) in raw mode */
 	mp = read_metapage(ip, address << sbi->l2nbperpage, PSIZE, 1);
-	if (mp = NULL) {
+	if (!mp) {
 		set_nlink(ip, 1);	/* Don't want iput() deleting it */
 		iput(ip);
 		return (NULL);
@@ -531,7 +531,7 @@ void diWriteSpecial(struct inode *ip, int secondary)
 
 	/* read the page of fixed disk inode (AIT) in raw mode */
 	mp = read_metapage(ip, address << sbi->l2nbperpage, PSIZE, 1);
-	if (mp = NULL) {
+	if (!mp) {
 		jfs_err("diWriteSpecial: failed to read aggregate inode extent!");
 		return;
 	}
@@ -558,7 +558,7 @@ void diWriteSpecial(struct inode *ip, int secondary)
  */
 void diFreeSpecial(struct inode *ip)
 {
-	if (ip = NULL) {
+	if (!ip) {
 		jfs_err("diFreeSpecial called with NULL ip!");
 		return;
 	}
@@ -1109,7 +1109,7 @@ int diFree(struct inode *ip)
 					goto error_out;
 				ciagp = (struct iag *) cmp->data;
 			}
-			assert(ciagp != NULL);
+			assert(ciagp);
 		}
 
 		if (inofreeback >= 0) {
@@ -1123,7 +1123,7 @@ int diFree(struct inode *ip)
 					goto error_out;
 				diagp = (struct iag *) dmp->data;
 			}
-			assert(diagp != NULL);
+			assert(diagp);
 		}
 	}
 
@@ -2250,7 +2250,7 @@ static int diNewExt(struct inomap * imap, struct iag * iagp, int extno)
 					goto error_out;
 				ciagp = (struct iag *) cmp->data;
 			}
-			if (ciagp = NULL) {
+			if (!ciagp) {
 				jfs_error(imap->im_ipimap->i_sb,
 					  "ciagp = NULL\n");
 				rc = -EIO;
@@ -2282,7 +2282,7 @@ static int diNewExt(struct inomap * imap, struct iag * iagp, int extno)
 		/* get a buffer for this page of disk inodes.
 		 */
 		dmp = get_metapage(ipimap, blkno + i, PSIZE, 1);
-		if (dmp = NULL) {
+		if (!dmp) {
 			rc = -EIO;
 			goto error_out;
 		}
@@ -2679,9 +2679,8 @@ static int diIAGRead(struct inomap * imap, int iagno, struct metapage ** mpp)
 
 	/* read the iag. */
 	*mpp = read_metapage(ipimap, blkno, PSIZE, 0);
-	if (*mpp = NULL) {
+	if (!*mpp)
 		return -EIO;
-	}
 
 	return (0);
 }
@@ -3000,7 +2999,7 @@ static void duplicateIXtree(struct super_block *sb, s64 blkno,
 	if (JFS_SBI(sb)->mntflag & JFS_BAD_SAIT)	/* s_flag */
 		return;
 	ip = diReadSpecial(sb, FILESYSTEM_I, 1);
-	if (ip = NULL) {
+	if (!ip) {
 		JFS_SBI(sb)->mntflag |= JFS_BAD_SAIT;
 		if (readSuper(sb, &bh))
 			return;
diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index ed103c44bd52..a4ba7cbbde2a 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -249,11 +249,11 @@ int lmLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 	LOG_LOCK(log);
 
 	/* log by (out-of-transaction) JFS ? */
-	if (tblk = NULL)
+	if (!tblk)
 		goto writeRecord;
 
 	/* log from page ? */
-	if (tlck = NULL ||
+	if (!tlck ||
 	    tlck->type & tlckBTROOT || (mp = tlck->mp) = NULL)
 		goto writeRecord;
 
@@ -382,7 +382,7 @@ lmWriteRecord(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 	dstoffset = log->eor;
 
 	/* any log data to write ? */
-	if (tlck = NULL)
+	if (!tlck)
 		goto moveLrd;
 
 	/*
@@ -617,7 +617,7 @@ static int lmNextPage(struct jfs_log * log)
 			 * of the pages since log pages will be added
 			 * continuously
 			 */
-			if (bp->l_wqnext = NULL)
+			if (!bp->l_wqnext)
 				lbmWrite(log, bp, 0, 0);
 		} else {
 			/*
@@ -902,7 +902,7 @@ static void lmPostGC(struct lbuf * bp)
 	 * wake her up to lead her group.
 	 */
 	if ((!list_empty(&log->cqueue)) &&
-	    ((log->gcrtc > 0) || (tblk->bp->l_wqnext != NULL) ||
+	    ((log->gcrtc > 0) || tblk->bp->l_wqnext ||
 	     test_bit(log_FLUSH, &log->flag) || jfs_tlocks_low))
 		/*
 		 * Call lmGCwrite with new group leader
@@ -1842,7 +1842,7 @@ static int lbmLogInit(struct jfs_log * log)
 		buffer = page_address(page);
 		for (offset = 0; offset < PAGE_SIZE; offset += LOGPSIZE) {
 			lbuf = kmalloc(sizeof(*lbuf), GFP_KERNEL);
-			if (lbuf = NULL) {
+			if (!lbuf) {
 				if (offset = 0)
 					__free_page(page);
 				goto error;
@@ -1941,7 +1941,7 @@ static void lbmfree(struct lbuf * bp)
 {
 	struct jfs_log *log = bp->l_log;
 
-	assert(bp->l_wqnext = NULL);
+	assert(!bp->l_wqnext);
 
 	/*
 	 * return the buffer to head of freelist
@@ -2062,9 +2062,9 @@ static void lbmWrite(struct jfs_log * log, struct lbuf * bp, int flag,
 	tail = log->wqueue;
 
 	/* is buffer not already on write queue ? */
-	if (bp->l_wqnext = NULL) {
+	if (!bp->l_wqnext) {
 		/* insert at tail of wqueue */
-		if (tail = NULL) {
+		if (!tail) {
 			log->wqueue = bp;
 			bp->l_wqnext = bp;
 		} else {
diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 6c75a7c87c0c..bc28c90cd145 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -210,13 +210,12 @@ int __init metapage_init(void)
 	 */
 	metapage_cache = kmem_cache_create("jfs_mp", sizeof(struct metapage),
 					   0, 0, NULL);
-	if (metapage_cache = NULL)
+	if (!metapage_cache)
 		return -ENOMEM;
 
 	metapage_mempool = mempool_create_slab_pool(METAPOOL_MIN_PAGES,
 						    metapage_cache);
-
-	if (metapage_mempool = NULL) {
+	if (!metapage_mempool) {
 		kmem_cache_destroy(metapage_cache);
 		return -ENOMEM;
 	}
diff --git a/fs/jfs/jfs_mount.c b/fs/jfs/jfs_mount.c
index 9895595fd2f2..55b8862f9978 100644
--- a/fs/jfs/jfs_mount.c
+++ b/fs/jfs/jfs_mount.c
@@ -96,7 +96,7 @@ int jfs_mount(struct super_block *sb)
 	}
 
 	ipaimap = diReadSpecial(sb, AGGREGATE_I, 0);
-	if (ipaimap = NULL) {
+	if (!ipaimap) {
 		jfs_err("jfs_mount: Failed to read AGGREGATE_I");
 		rc = -EIO;
 		goto errout20;
@@ -117,7 +117,7 @@ int jfs_mount(struct super_block *sb)
 	 * open aggregate block allocation map
 	 */
 	ipbmap = diReadSpecial(sb, BMAP_I, 0);
-	if (ipbmap = NULL) {
+	if (!ipbmap) {
 		rc = -EIO;
 		goto errout22;
 	}
@@ -175,7 +175,7 @@ int jfs_mount(struct super_block *sb)
 	 * open fileset inode allocation map (aka fileset inode)
 	 */
 	ipimap = diReadSpecial(sb, FILESYSTEM_I, 0);
-	if (ipimap = NULL) {
+	if (!ipimap) {
 		jfs_err("jfs_mount: Failed to read FILESYSTEM_I");
 		/* open fileset secondary inode allocation map */
 		rc = -EIO;
diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
index 4d973524c887..13a83e1c0989 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -282,7 +282,7 @@ int txInit(void)
 
 	size = sizeof(struct tblock) * nTxBlock;
 	TxBlock = vmalloc(size);
-	if (TxBlock = NULL)
+	if (!TxBlock)
 		return -ENOMEM;
 
 	for (k = 1; k < nTxBlock - 1; k++) {
@@ -307,7 +307,7 @@ int txInit(void)
 	 */
 	size = sizeof(struct tlock) * nTxLock;
 	TxLock = vmalloc(size);
-	if (TxLock = NULL) {
+	if (!TxLock) {
 		vfree(TxBlock);
 		return -ENOMEM;
 	}
@@ -2201,7 +2201,7 @@ void txEA(tid_t tid, struct inode *ip, dxd_t * oldea, dxd_t * newea)
 	 * format maplock for free of old EA extent
 	 */
 	if (!test_cflag(COMMIT_Nolink, ip) && oldea->flag & DXD_EXTENT) {
-		if (tlck = NULL) {
+		if (!tlck) {
 			tlck = txMaplock(tid, ip, tlckMAP);
 			maplock = (struct pxd_lock *) & tlck->lock;
 			pxdlock = (struct pxd_lock *) maplock;
diff --git a/fs/jfs/jfs_unicode.c b/fs/jfs/jfs_unicode.c
index c7de6f5bbefc..f8a6ad65f42a 100644
--- a/fs/jfs/jfs_unicode.c
+++ b/fs/jfs/jfs_unicode.c
@@ -122,8 +122,7 @@ int get_UCSname(struct component_name * uniName, struct dentry *dentry)
 
 	uniName->name  	    kmalloc((length + 1) * sizeof(wchar_t), GFP_NOFS);
-
-	if (uniName->name = NULL)
+	if (!uniName->name)
 		return -ENOMEM;
 
 	uniName->namlen = jfs_strtoUCS(uniName->name, dentry->d_name.name,
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 5cde6d2fcfca..b5625ef8afb7 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -759,7 +759,7 @@ xtSplitUp(tid_t tid,
 	 *
 	 * allocation hint: ?
 	 */
-	if (split->pxdlist = NULL) {
+	if (!split->pxdlist) {
 		nsplit = btstack->nsplit;
 		split->pxdlist = &pxdlist;
 		pxdlist.maxnpxd = pxdlist.npxd = 0;
@@ -996,7 +996,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
 	 * allocate the new right page for the split
 	 */
 	rmp = get_metapage(ip, rbn, PSIZE, 1);
-	if (rmp = NULL) {
+	if (!rmp) {
 		rc = -EIO;
 		goto clean_up;
 	}
@@ -1249,7 +1249,7 @@ xtSplitRoot(tid_t tid,
 	pxdlist->npxd++;
 	rbn = addressPXD(pxd);
 	rmp = get_metapage(ip, rbn, PSIZE, 1);
-	if (rmp = NULL)
+	if (!rmp)
 		return -EIO;
 
 	/* Allocate blocks to quota. */
diff --git a/fs/jfs/namei.c b/fs/jfs/namei.c
index b41596d71858..587f2f83a725 100644
--- a/fs/jfs/namei.c
+++ b/fs/jfs/namei.c
@@ -1006,8 +1006,7 @@ static int jfs_symlink(struct inode *dip, struct dentry *dentry,
 			int copy_size = min(ssize, PSIZE);
 
 			mp = get_metapage(ip, xaddr, PSIZE, 1);
-
-			if (mp = NULL) {
+			if (!mp) {
 				xtTruncate(tid, ip, 0, COMMIT_PWMAP);
 				rc = -EIO;
 				txAbort(tid, 0);
diff --git a/fs/jfs/resize.c b/fs/jfs/resize.c
index 7ddcb445a3d9..3855ebf4b076 100644
--- a/fs/jfs/resize.c
+++ b/fs/jfs/resize.c
@@ -478,7 +478,7 @@ int jfs_extendfs(struct super_block *sb, s64 newLVSize, int newLogSize)
 	 */
 
 	ipbmap2 = diReadSpecial(sb, BMAP_I, 1);
-	if (ipbmap2 = NULL) {
+	if (!ipbmap2) {
 		printk(KERN_ERR "jfs_extendfs: diReadSpecial(bmap) failed\n");
 		goto error_out;
 	}
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 381476422e8d..2154878ba7e4 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -574,7 +574,7 @@ static int jfs_fill_super(struct super_block *sb, void *data, int silent)
 	 * Initialize direct-mapping inode/address-space
 	 */
 	inode = new_inode(sb);
-	if (inode = NULL) {
+	if (!inode) {
 		ret = -ENOMEM;
 		goto out_unload;
 	}
@@ -975,7 +975,7 @@ static int __init init_jfs_fs(void)
 	    kmem_cache_create("jfs_ip", sizeof(struct jfs_inode_info), 0,
 			    SLAB_RECLAIM_ACCOUNT|SLAB_MEM_SPREAD|SLAB_ACCOUNT,
 			    init_once);
-	if (jfs_inode_cachep = NULL)
+	if (!jfs_inode_cachep)
 		return -ENOMEM;
 
 	/*
diff --git a/fs/jfs/xattr.c b/fs/jfs/xattr.c
index c60f3d32ee91..c0cbec5e477f 100644
--- a/fs/jfs/xattr.c
+++ b/fs/jfs/xattr.c
@@ -494,7 +494,7 @@ static int ea_get(struct inode *inode, struct ea_buffer *ea_buf, int min_size)
 		 * contiguous buffer to work with
 		 */
 		ea_buf->xattr = kmalloc(size, GFP_KERNEL);
-		if (ea_buf->xattr = NULL)
+		if (!ea_buf->xattr)
 			return -ENOMEM;
 
 		ea_buf->flag = EA_MALLOC;
@@ -537,7 +537,7 @@ static int ea_get(struct inode *inode, struct ea_buffer *ea_buf, int min_size)
 		ea_buf->mp = get_metapage(inode, blkno,
 					  blocks_needed << sb->s_blocksize_bits,
 					  1);
-		if (ea_buf->mp = NULL) {
+		if (!ea_buf->mp) {
 			dbFree(inode, blkno, (s64) blocks_needed);
 			rc = -EIO;
 			goto clean_up;
@@ -558,7 +558,7 @@ static int ea_get(struct inode *inode, struct ea_buffer *ea_buf, int min_size)
 	ea_buf->mp = read_metapage(inode, addressDXD(&ji->ea),
 				   lengthDXD(&ji->ea) << sb->s_blocksize_bits,
 				   1);
-	if (ea_buf->mp = NULL) {
+	if (!ea_buf->mp) {
 		rc = -EIO;
 		goto clean_up;
 	}
@@ -712,7 +712,7 @@ int __jfs_setxattr(tid_t tid, struct inode *inode, const char *name,
 			rc = -ENODATA;
 			goto release;
 		}
-		if (value = NULL) {
+		if (!value) {
 			rc = 0;
 			goto release;
 		}
@@ -1016,7 +1016,7 @@ static int jfs_initxattrs(struct inode *inode, const struct xattr *xattr_array,
 	char *name;
 	int err = 0;
 
-	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
+	for (xattr = xattr_array; xattr->name; xattr++) {
 		name = kmalloc(XATTR_SECURITY_PREFIX_LEN +
 			       strlen(xattr->name) + 1, GFP_NOFS);
 		if (!name) {
-- 
2.14.0

