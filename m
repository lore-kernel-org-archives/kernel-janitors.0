From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 06:05:45 +0000
Subject: [KJ] [PATCH 2/5] moving to is_power_of_2
Message-Id: <1171605225.27506.76.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing instances of (n&(n-1)) for power of 2 
check with is_power_of_2 from linux/log.h.


Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
 arch/ia64/mm/hugetlbpage.c     |    1 -
 drivers/block/rd.c             |    1 -
 drivers/md/dm-snap.c           |    1 -
 drivers/net/cxgb3/cxgb3_main.c |    2 --
 drivers/net/pcmcia/pcnet_cs.c  |    1 -
 drivers/rtc/rtc-s3c.c          |    2 --
 drivers/s390/block/dasd_int.h  |    1 -
 drivers/video/vesafb.c         |    1 -
 fs/block_dev.c                 |    1 -
 fs/ext2/super.c                |    1 -
 fs/ext3/super.c                |    1 -
 fs/ext4/super.c                |    2 --
 fs/fat/inode.c                 |    4 ----
 fs/hfsplus/btree.c             |    1 -
 fs/nfs/internal.h              |    1 -
 fs/ntfs/inode.c                |    1 -
 fs/ntfs/logfile.c              |    1 -
 fs/ufs/super.c                 |    1 -
 kernel/kfifo.c                 |    1 -
 net/core/neighbour.c           |    1 -
 sound/core/rtctimer.c          |    1 -
 21 files changed, 0 insertions(+), 27 deletions(-)

diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
index 4fc6887..0ccc70e 100644
--- a/arch/ia64/mm/hugetlbpage.c
+++ b/arch/ia64/mm/hugetlbpage.c
@@ -176,7 +176,6 @@ static int __init hugetlb_setup_sz(char *str)
 		tr_pages = 0x15557000UL;
 
 	size = memparse(str, &str);
-	//if (*str || (size & (size-1)) || !(tr_pages & size) ||
 	if (*str || !is_power_of_2(size) || !(tr_pages & size) ||
 		size <= PAGE_SIZE ||
 		size >= (1UL << PAGE_SHIFT << MAX_ORDER)) {
diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index 9c21994..f73c4a8 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -422,7 +422,6 @@ static int __init rd_init(void)
 	int err = -ENOMEM;
 
 	if (rd_blocksize > PAGE_SIZE || rd_blocksize < 512 ||
-			//(rd_blocksize & (rd_blocksize-1))) {
 		   (!is_power_of_2(rd_blocksize))) {
 		printk("RAMDISK: wrong blocksize %d, reverting to defaults\n",
 		       rd_blocksize);
diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index f066405..f2d4b23 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -415,7 +415,6 @@ static int set_chunk_size(struct dm_snapshot *s, const char *chunk_size_arg,
 	chunk_size = round_up(chunk_size, PAGE_SIZE >> 9);
 
 	/* Check chunk_size is a power of 2 */
-	//if (chunk_size & (chunk_size - 1)) {
 	if (!is_power_of_2(chunk_size)) {
 		*error = "Chunk size is not a power of 2";
 		return -EINVAL;
diff --git a/drivers/net/cxgb3/cxgb3_main.c b/drivers/net/cxgb3/cxgb3_main.c
index 4c7437f..7f9ac8d 100644
--- a/drivers/net/cxgb3/cxgb3_main.c
+++ b/drivers/net/cxgb3/cxgb3_main.c
@@ -1793,8 +1793,6 @@ static int cxgb_extension_ioctl(struct net_device *dev, void __user *useraddr)
 			return -EBUSY;
 		if (copy_from_user(&m, useraddr, sizeof(m)))
 			return -EFAULT;
-		//if (!m.rx_pg_sz || (m.rx_pg_sz & (m.rx_pg_sz - 1)) ||
-			//!m.tx_pg_sz || (m.tx_pg_sz & (m.tx_pg_sz - 1)))
 		if (!is_power_of_2(m.rx_pg_sz) ||
 					!is_power_of_2(m.tx_pg_sz))
 			return -EINVAL;	/* not power of 2 */
diff --git a/drivers/net/pcmcia/pcnet_cs.c b/drivers/net/pcmcia/pcnet_cs.c
index ee0c8b3..fde3389 100644
--- a/drivers/net/pcmcia/pcnet_cs.c
+++ b/drivers/net/pcmcia/pcnet_cs.c
@@ -1484,7 +1484,6 @@ static int setup_shmem_window(struct pcmcia_device *link, int start_pg,
 	window_size = 32 * 1024;
 
     /* Make sure it's a power of two.  */
-    //while ((window_size & (window_size - 1)) != 0)
 	while (!is_power_of_2(window_size))
 	window_size += window_size & ~(window_size - 1);
 
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 1399059..c49e6b3 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -311,8 +311,6 @@ static int s3c_rtc_ioctl(struct device *dev,
 
 	case RTC_IRQP_SET:
 		/* check for power of 2 */
-
-		//if ((arg & (arg-1)) != 0 || arg < 1) {
 		if (!arg || !is_power_of_2(arg)) {
 			ret = -EINVAL;
 			goto exit;
diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
index a27426c..86305d5 100644
--- a/drivers/s390/block/dasd_int.h
+++ b/drivers/s390/block/dasd_int.h
@@ -457,7 +457,6 @@ dasd_free_chunk(struct list_head *chunk_list, void *mem)
 static inline int
 dasd_check_blocksize(int bsize)
 {
-	//if (bsize < 512 || bsize > 4096 || (bsize & (bsize - 1)) != 0)
 	if (bsize < 512 || bsize > 4096 || !is_power_of_2(bsize))
 		return -EMEDIUMTYPE;
 	return 0;
diff --git a/drivers/video/vesafb.c b/drivers/video/vesafb.c
index 4f62398..f89d8cb 100644
--- a/drivers/video/vesafb.c
+++ b/drivers/video/vesafb.c
@@ -422,7 +422,6 @@ static int __init vesafb_probe(struct platform_device *dev)
 			int rc;
 
 			/* Find the largest power-of-two */
-			//while (temp_size & (temp_size - 1))
 			while (!is_power_of_2(temp_size))
 				temp_size &= (temp_size - 1);
 
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 8e20007..e8f2a2b 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -66,7 +66,6 @@ static void kill_bdev(struct block_device *bdev)
 int set_blocksize(struct block_device *bdev, int size)
 {
 	/* Size must be a power of two, and between 512 and PAGE_SIZE */
-	//if (size > PAGE_SIZE || size < 512 || (size & (size-1)))
 	if (size > PAGE_SIZE || size < 512 || !is_power_of_2(size))
 		return -EINVAL;
 
diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 74885c8..7585408 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -803,7 +803,6 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT2_GOOD_OLD_INODE_SIZE) ||
-		    //(sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
 			!is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk ("EXT2-fs: unsupported inode size: %d\n",
diff --git a/fs/ext3/super.c b/fs/ext3/super.c
index 38bd96d..3f4d52c 100644
--- a/fs/ext3/super.c
+++ b/fs/ext3/super.c
@@ -1566,7 +1566,6 @@ static int ext3_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT3_GOOD_OLD_INODE_SIZE) ||
-		    //(sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
 			!is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index a97c850..857f341 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1625,7 +1625,6 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT4_GOOD_OLD_INODE_SIZE) ||
-		    //(sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
 			!is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
@@ -1646,7 +1645,6 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 	if (EXT4_HAS_INCOMPAT_FEATURE(sb, EXT4_FEATURE_INCOMPAT_64BIT)) {
 		if (sbi->s_desc_size < EXT4_MIN_DESC_SIZE_64BIT ||
 		    sbi->s_desc_size > EXT4_MAX_DESC_SIZE ||
-		    //sbi->s_desc_size & (sbi->s_desc_size - 1)) {
 				  !is_power_of_2(sbi->s_desc_size)) {
 			printk(KERN_ERR
 			       "EXT4-fs: unsupported descriptor size %lu\n",
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index cf0b438..8437190 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -1217,8 +1217,6 @@ int fat_fill_super(struct super_block *sb, void *data, int silent,
 	}
 	logical_sector_size  		le16_to_cpu(get_unaligned((__le16 *)&b->sector_size));
-	//if (!logical_sector_size
-	  //  || (logical_sector_size & (logical_sector_size - 1))
 	if (!is_power_of_2(logical_sector_size)
 	    || (logical_sector_size < 512)
 	    || (PAGE_CACHE_SIZE < logical_sector_size)) {
@@ -1229,8 +1227,6 @@ int fat_fill_super(struct super_block *sb, void *data, int silent,
 		goto out_invalid;
 	}
 	sbi->sec_per_clus = b->sec_per_clus;
-	//if (!sbi->sec_per_clus
-	  //  || (sbi->sec_per_clus & (sbi->sec_per_clus - 1))) {
 	if (!is_power_of_2(sbi->sec_per_clus)) {
 		if (!silent)
 			printk(KERN_ERR "FAT: bogus sectors per cluster %u\n",
diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index 9441cee..90ebab7 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -70,7 +70,6 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	}
 
 	size = tree->node_size;
-	//if (!size || size & (size - 1))
 	if (!is_power_of_2(size))
 		goto fail_page;
 	if (!tree->node_count)
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 61cb63d..5a1afbb 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -171,7 +171,6 @@ static inline
 unsigned long nfs_block_bits(unsigned long bsize, unsigned char *nrbitsp)
 {
 	/* make sure blocksize is a power of two */
-	//if ((bsize & (bsize - 1)) || nrbitsp) {
 	if (!is_power_of_2(bsize) || nrbitsp) {
 		unsigned char	nrbits;
 
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index aa2fa95..a6b5c47 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1576,7 +1576,6 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	ntfs_debug("Index collation rule is 0x%x.",
 			le32_to_cpu(ir->collation_rule));
 	ni->itype.index.block_size = le32_to_cpu(ir->index_block_size);
-	//if (ni->itype.index.block_size & (ni->itype.index.block_size - 1)) {
 	if (!is_power_of_2(ni->itype.index.block_size)) {
 		ntfs_error(vi->i_sb, "Index block size (%u) is not a power of "
 				"two.", ni->itype.index.block_size);
diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index dd0de00..ce23992 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -66,7 +66,6 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 			logfile_log_page_size < NTFS_BLOCK_SIZE ||
 			logfile_system_page_size &
 			(logfile_system_page_size - 1) ||
-			//logfile_log_page_size & (logfile_log_page_size - 1)) {
 		   !is_power_of_2(logfile_log_page_size)) {
 		ntfs_error(vi->i_sb, "$LogFile uses unsupported page size.");
 		return false;
diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index dc44e21..0706e4c 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -851,7 +851,6 @@ magic_found:
 	uspi->s_fmask = fs32_to_cpu(sb, usb1->fs_fmask);
 	uspi->s_fshift = fs32_to_cpu(sb, usb1->fs_fshift);
 
-	//if (uspi->s_fsize & (uspi->s_fsize - 1)) {
 	if (!is_power_of_2(uspi->s_fsize)) {
 		printk(KERN_ERR "ufs_read_super: fragment size %u is not a power of 2\n",
 			uspi->s_fsize);
diff --git a/kernel/kfifo.c b/kernel/kfifo.c
index d76844f..eeb5e7e 100644
--- a/kernel/kfifo.c
+++ b/kernel/kfifo.c
@@ -42,7 +42,6 @@ struct kfifo *kfifo_init(unsigned char *buffer, unsigned int size,
 	struct kfifo *fifo;
 
 	/* size must be a power of 2 */
-	//BUG_ON(size & (size - 1));
 	BUG_ON(!is_power_of_2(size));
 
 	fifo = kmalloc(sizeof(struct kfifo), gfp_mask);
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 3e42d6f..348de23 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -311,7 +311,6 @@ static void neigh_hash_grow(struct neigh_table *tbl, unsigned long new_entries)
 
 	NEIGH_CACHE_STAT_INC(tbl, hash_grows);
 
-	//BUG_ON(new_entries & (new_entries - 1));
 	BUG_ON(!is_power_of_2(new_entries));
 	new_hash = neigh_hash_alloc(new_entries);
 	if (!new_hash)
diff --git a/sound/core/rtctimer.c b/sound/core/rtctimer.c
index 073cc94..302c21a 100644
--- a/sound/core/rtctimer.c
+++ b/sound/core/rtctimer.c
@@ -130,7 +130,6 @@ static int __init rtctimer_init(void)
 	struct snd_timer *timer;
 
 	if (rtctimer_freq < 2 || rtctimer_freq > 8192 ||
-//	    (rtctimer_freq & (rtctimer_freq - 1)) != 0) {
 		!is_power_of_2(rtctimer_freq)) {
 		snd_printk(KERN_ERR "rtctimer: invalid frequency %d\n",
 			   rtctimer_freq);
-- 
1.4.4.2


-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
