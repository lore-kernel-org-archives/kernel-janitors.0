From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 06:05:42 +0000
Subject: [KJ] [PATCH 1/5] moving to is_power_of_2
Message-Id: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing instances of (n&(n-1)) for power of 2 
check with is_power_of_2 from linux/log.h.



Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
 arch/ia64/mm/hugetlbpage.c     |    4 +++-
 drivers/block/rd.c             |    3 ++-
 drivers/md/dm-snap.c           |    4 +++-
 drivers/net/cxgb3/cxgb3_main.c |    7 +++++--
 drivers/net/pcmcia/pcnet_cs.c  |    4 +++-
 drivers/rtc/rtc-s3c.c          |    4 +++-
 drivers/s390/block/dasd_int.h  |    4 +++-
 drivers/s390/cio/cio.c         |    3 ++-
 drivers/s390/cio/device_fsm.c  |    3 ++-
 drivers/video/vesafb.c         |    4 +++-
 fs/block_dev.c                 |    4 +++-
 fs/ext2/super.c                |    4 +++-
 fs/ext3/super.c                |    4 +++-
 fs/ext4/super.c                |    7 +++++--
 fs/fat/inode.c                 |   11 +++++++----
 fs/hfs/btree.c                 |    3 ++-
 fs/hfsplus/btree.c             |    4 +++-
 fs/nfs/internal.h              |    5 +++--
 fs/ntfs/inode.c                |    4 +++-
 fs/ntfs/logfile.c              |    4 +++-
 fs/ufs/super.c                 |    7 +++++--
 kernel/kfifo.c                 |    4 +++-
 net/core/neighbour.c           |    4 +++-
 sound/core/rtctimer.c          |    4 +++-
 24 files changed, 78 insertions(+), 31 deletions(-)

diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
index 0c7e94e..4fc6887 100644
--- a/arch/ia64/mm/hugetlbpage.c
+++ b/arch/ia64/mm/hugetlbpage.c
@@ -16,6 +16,7 @@
 #include <linux/smp_lock.h>
 #include <linux/slab.h>
 #include <linux/sysctl.h>
+#include <linux/log2.h>
 #include <asm/mman.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
@@ -175,7 +176,8 @@ static int __init hugetlb_setup_sz(char *str)
 		tr_pages = 0x15557000UL;
 
 	size = memparse(str, &str);
-	if (*str || (size & (size-1)) || !(tr_pages & size) ||
+	//if (*str || (size & (size-1)) || !(tr_pages & size) ||
+	if (*str || !is_power_of_2(size) || !(tr_pages & size) ||
 		size <= PAGE_SIZE ||
 		size >= (1UL << PAGE_SHIFT << MAX_ORDER)) {
 		printk(KERN_WARNING "Invalid huge page size specified\n");
diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index 485aa87..9c21994 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -422,7 +422,8 @@ static int __init rd_init(void)
 	int err = -ENOMEM;
 
 	if (rd_blocksize > PAGE_SIZE || rd_blocksize < 512 ||
-			(rd_blocksize & (rd_blocksize-1))) {
+			//(rd_blocksize & (rd_blocksize-1))) {
+		   (!is_power_of_2(rd_blocksize))) {
 		printk("RAMDISK: wrong blocksize %d, reverting to defaults\n",
 		       rd_blocksize);
 		rd_blocksize = BLOCK_SIZE;
diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 0821a2b..f066405 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/log2.h>
 
 #include "dm-snap.h"
 #include "dm-bio-list.h"
@@ -414,7 +415,8 @@ static int set_chunk_size(struct dm_snapshot *s, const char *chunk_size_arg,
 	chunk_size = round_up(chunk_size, PAGE_SIZE >> 9);
 
 	/* Check chunk_size is a power of 2 */
-	if (chunk_size & (chunk_size - 1)) {
+	//if (chunk_size & (chunk_size - 1)) {
+	if (!is_power_of_2(chunk_size)) {
 		*error = "Chunk size is not a power of 2";
 		return -EINVAL;
 	}
diff --git a/drivers/net/cxgb3/cxgb3_main.c b/drivers/net/cxgb3/cxgb3_main.c
index c67f7d3..4c7437f 100644
--- a/drivers/net/cxgb3/cxgb3_main.c
+++ b/drivers/net/cxgb3/cxgb3_main.c
@@ -42,6 +42,7 @@
 #include <linux/workqueue.h>
 #include <linux/proc_fs.h>
 #include <linux/rtnetlink.h>
+#include <linux/log2.h>
 #include <asm/uaccess.h>
 
 #include "common.h"
@@ -1792,8 +1793,10 @@ static int cxgb_extension_ioctl(struct net_device *dev, void __user *useraddr)
 			return -EBUSY;
 		if (copy_from_user(&m, useraddr, sizeof(m)))
 			return -EFAULT;
-		if (!m.rx_pg_sz || (m.rx_pg_sz & (m.rx_pg_sz - 1)) ||
-			!m.tx_pg_sz || (m.tx_pg_sz & (m.tx_pg_sz - 1)))
+		//if (!m.rx_pg_sz || (m.rx_pg_sz & (m.rx_pg_sz - 1)) ||
+			//!m.tx_pg_sz || (m.tx_pg_sz & (m.tx_pg_sz - 1)))
+		if (!is_power_of_2(m.rx_pg_sz) ||
+					!is_power_of_2(m.tx_pg_sz))
 			return -EINVAL;	/* not power of 2 */
 		if (!(m.rx_pg_sz & 0x14000))
 			return -EINVAL;	/* not 16KB or 64KB */
diff --git a/drivers/net/pcmcia/pcnet_cs.c b/drivers/net/pcmcia/pcnet_cs.c
index d88e9b2..ee0c8b3 100644
--- a/drivers/net/pcmcia/pcnet_cs.c
+++ b/drivers/net/pcmcia/pcnet_cs.c
@@ -38,6 +38,7 @@
 #include <linux/delay.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/log2.h>
 #include <../drivers/net/8390.h>
 
 #include <pcmcia/cs_types.h>
@@ -1483,7 +1484,8 @@ static int setup_shmem_window(struct pcmcia_device *link, int start_pg,
 	window_size = 32 * 1024;
 
     /* Make sure it's a power of two.  */
-    while ((window_size & (window_size - 1)) != 0)
+    //while ((window_size & (window_size - 1)) != 0)
+	while (!is_power_of_2(window_size))
 	window_size += window_size & ~(window_size - 1);
 
     /* Allocate a memory window */
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index f406a2b..1399059 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -20,6 +20,7 @@
 #include <linux/rtc.h>
 #include <linux/bcd.h>
 #include <linux/clk.h>
+#include <linux/log2.h>
 
 #include <asm/hardware.h>
 #include <asm/uaccess.h>
@@ -311,7 +312,8 @@ static int s3c_rtc_ioctl(struct device *dev,
 	case RTC_IRQP_SET:
 		/* check for power of 2 */
 
-		if ((arg & (arg-1)) != 0 || arg < 1) {
+		//if ((arg & (arg-1)) != 0 || arg < 1) {
+		if (!arg || !is_power_of_2(arg)) {
 			ret = -EINVAL;
 			goto exit;
 		}
diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
index a2cc69e..a27426c 100644
--- a/drivers/s390/block/dasd_int.h
+++ b/drivers/s390/block/dasd_int.h
@@ -53,6 +53,7 @@
 #include <linux/genhd.h>
 #include <linux/hdreg.h>
 #include <linux/interrupt.h>
+#include <linux/log2.h>
 #include <asm/ccwdev.h>
 #include <linux/workqueue.h>
 #include <asm/debug.h>
@@ -456,7 +457,8 @@ dasd_free_chunk(struct list_head *chunk_list, void *mem)
 static inline int
 dasd_check_blocksize(int bsize)
 {
-	if (bsize < 512 || bsize > 4096 || (bsize & (bsize - 1)) != 0)
+	//if (bsize < 512 || bsize > 4096 || (bsize & (bsize - 1)) != 0)
+	if (bsize < 512 || bsize > 4096 || !is_power_of_2(bsize))
 		return -EMEDIUMTYPE;
 	return 0;
 }
diff --git a/drivers/s390/cio/cio.c b/drivers/s390/cio/cio.c
index b3a56dc..f61be3e 100644
--- a/drivers/s390/cio/cio.c
+++ b/drivers/s390/cio/cio.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
+#include <linux/log2.h>
 #include <asm/cio.h>
 #include <asm/delay.h>
 #include <asm/irq.h>
@@ -614,7 +615,7 @@ cio_validate_subchannel (struct subchannel *sch, struct subchannel_id schid)
 	sch->schib.pmcw.isc = 3;	/* could be smth. else */
 	sch->schib.pmcw.csense = 1;	/* concurrent sense */
 	sch->schib.pmcw.ena = 0;
-	if ((sch->lpm & (sch->lpm - 1)) != 0)
+	if (!is_power_of_2(sch->lpm))
 		sch->schib.pmcw.mp = 1;	/* multipath mode */
 	return 0;
 out:
diff --git a/drivers/s390/cio/device_fsm.c b/drivers/s390/cio/device_fsm.c
index 51238e7..3ef2092 100644
--- a/drivers/s390/cio/device_fsm.c
+++ b/drivers/s390/cio/device_fsm.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/string.h>
+#include <linux/log2.h>
 
 #include <asm/ccwdev.h>
 #include <asm/cio.h>
@@ -1122,7 +1123,7 @@ device_trigger_reprobe(struct subchannel *sch)
 	sch->schib.pmcw.isc = 3;
 	sch->schib.pmcw.csense = 1;
 	sch->schib.pmcw.ena = 0;
-	if ((sch->lpm & (sch->lpm - 1)) != 0)
+	if (!is_power_of_2(sch->lpm))
 		sch->schib.pmcw.mp = 1;
 	sch->schib.pmcw.intparm = (__u32)(unsigned long)sch;
 	/* We should also udate ssd info, but this has to wait. */
diff --git a/drivers/video/vesafb.c b/drivers/video/vesafb.c
index e16322d..4f62398 100644
--- a/drivers/video/vesafb.c
+++ b/drivers/video/vesafb.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
+#include <linux/log2.h>
 
 #include <video/vga.h>
 #include <asm/io.h>
@@ -421,7 +422,8 @@ static int __init vesafb_probe(struct platform_device *dev)
 			int rc;
 
 			/* Find the largest power-of-two */
-			while (temp_size & (temp_size - 1))
+			//while (temp_size & (temp_size - 1))
+			while (!is_power_of_2(temp_size))
 				temp_size &= (temp_size - 1);
 
 			/* Try and find a power of two to add */
diff --git a/fs/block_dev.c b/fs/block_dev.c
index fc7028b..8e20007 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -22,6 +22,7 @@
 #include <linux/mount.h>
 #include <linux/uio.h>
 #include <linux/namei.h>
+#include <linux/log2.h>
 #include <asm/uaccess.h>
 #include "internal.h"
 
@@ -65,7 +66,8 @@ static void kill_bdev(struct block_device *bdev)
 int set_blocksize(struct block_device *bdev, int size)
 {
 	/* Size must be a power of two, and between 512 and PAGE_SIZE */
-	if (size > PAGE_SIZE || size < 512 || (size & (size-1)))
+	//if (size > PAGE_SIZE || size < 512 || (size & (size-1)))
+	if (size > PAGE_SIZE || size < 512 || !is_power_of_2(size))
 		return -EINVAL;
 
 	/* Size cannot be smaller than the size supported by the device */
diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 6347c2d..74885c8 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -29,6 +29,7 @@
 #include <linux/vfs.h>
 #include <linux/seq_file.h>
 #include <linux/mount.h>
+#include <linux/log2.h>
 #include <asm/uaccess.h>
 #include "ext2.h"
 #include "xattr.h"
@@ -802,7 +803,8 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT2_GOOD_OLD_INODE_SIZE) ||
-		    (sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+		    //(sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+			!is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk ("EXT2-fs: unsupported inode size: %d\n",
 				sbi->s_inode_size);
diff --git a/fs/ext3/super.c b/fs/ext3/super.c
index b348867..38bd96d 100644
--- a/fs/ext3/super.c
+++ b/fs/ext3/super.c
@@ -35,6 +35,7 @@
 #include <linux/namei.h>
 #include <linux/quotaops.h>
 #include <linux/seq_file.h>
+#include <linux/log2.h>
 
 #include <asm/uaccess.h>
 
@@ -1565,7 +1566,8 @@ static int ext3_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT3_GOOD_OLD_INODE_SIZE) ||
-		    (sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+		    //(sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+			!is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
 				"EXT3-fs: unsupported inode size: %d\n",
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 486a641..a97c850 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -35,6 +35,7 @@
 #include <linux/namei.h>
 #include <linux/quotaops.h>
 #include <linux/seq_file.h>
+#include <linux/log2.h>
 
 #include <asm/uaccess.h>
 
@@ -1624,7 +1625,8 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT4_GOOD_OLD_INODE_SIZE) ||
-		    (sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+		    //(sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+			!is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
 				"EXT4-fs: unsupported inode size: %d\n",
@@ -1644,7 +1646,8 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 	if (EXT4_HAS_INCOMPAT_FEATURE(sb, EXT4_FEATURE_INCOMPAT_64BIT)) {
 		if (sbi->s_desc_size < EXT4_MIN_DESC_SIZE_64BIT ||
 		    sbi->s_desc_size > EXT4_MAX_DESC_SIZE ||
-		    sbi->s_desc_size & (sbi->s_desc_size - 1)) {
+		    //sbi->s_desc_size & (sbi->s_desc_size - 1)) {
+				  !is_power_of_2(sbi->s_desc_size)) {
 			printk(KERN_ERR
 			       "EXT4-fs: unsupported descriptor size %lu\n",
 			       sbi->s_desc_size);
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index a9e4688..cf0b438 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -25,6 +25,7 @@
 #include <linux/parser.h>
 #include <linux/uio.h>
 #include <linux/writeback.h>
+#include <linux/log2.h>
 #include <asm/unaligned.h>
 
 #ifndef CONFIG_FAT_DEFAULT_IOCHARSET
@@ -1216,8 +1217,9 @@ int fat_fill_super(struct super_block *sb, void *data, int silent,
 	}
 	logical_sector_size  		le16_to_cpu(get_unaligned((__le16 *)&b->sector_size));
-	if (!logical_sector_size
-	    || (logical_sector_size & (logical_sector_size - 1))
+	//if (!logical_sector_size
+	  //  || (logical_sector_size & (logical_sector_size - 1))
+	if (!is_power_of_2(logical_sector_size)
 	    || (logical_sector_size < 512)
 	    || (PAGE_CACHE_SIZE < logical_sector_size)) {
 		if (!silent)
@@ -1227,8 +1229,9 @@ int fat_fill_super(struct super_block *sb, void *data, int silent,
 		goto out_invalid;
 	}
 	sbi->sec_per_clus = b->sec_per_clus;
-	if (!sbi->sec_per_clus
-	    || (sbi->sec_per_clus & (sbi->sec_per_clus - 1))) {
+	//if (!sbi->sec_per_clus
+	  //  || (sbi->sec_per_clus & (sbi->sec_per_clus - 1))) {
+	if (!is_power_of_2(sbi->sec_per_clus)) {
 		if (!silent)
 			printk(KERN_ERR "FAT: bogus sectors per cluster %u\n",
 			       sbi->sec_per_clus);
diff --git a/fs/hfs/btree.c b/fs/hfs/btree.c
index 5fd0ed7..8a3a650 100644
--- a/fs/hfs/btree.c
+++ b/fs/hfs/btree.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/pagemap.h>
+#include <linux/log2.h>
 
 #include "btree.h"
 
@@ -76,7 +77,7 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id, btree_keycmp ke
 	tree->depth = be16_to_cpu(head->depth);
 
 	size = tree->node_size;
-	if (!size || size & (size - 1))
+	if (!is_power_of_2(size))
 		goto fail_page;
 	if (!tree->node_count)
 		goto fail_page;
diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index a9b9e87..9441cee 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -10,6 +10,7 @@
 
 #include <linux/slab.h>
 #include <linux/pagemap.h>
+#include <linux/log2.h>
 
 #include "hfsplus_fs.h"
 #include "hfsplus_raw.h"
@@ -69,7 +70,8 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	}
 
 	size = tree->node_size;
-	if (!size || size & (size - 1))
+	//if (!size || size & (size - 1))
+	if (!is_power_of_2(size))
 		goto fail_page;
 	if (!tree->node_count)
 		goto fail_page;
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index a28f6ce..61cb63d 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -3,7 +3,7 @@
  */
 
 #include <linux/mount.h>
-
+#include <linux/log2.h>
 struct nfs_string;
 struct nfs_mount_data;
 struct nfs4_mount_data;
@@ -171,7 +171,8 @@ static inline
 unsigned long nfs_block_bits(unsigned long bsize, unsigned char *nrbitsp)
 {
 	/* make sure blocksize is a power of two */
-	if ((bsize & (bsize - 1)) || nrbitsp) {
+	//if ((bsize & (bsize - 1)) || nrbitsp) {
+	if (!is_power_of_2(bsize) || nrbitsp) {
 		unsigned char	nrbits;
 
 		for (nrbits = 31; nrbits && !(bsize & (1 << nrbits)); nrbits--)
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index f8bf8da..aa2fa95 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -28,6 +28,7 @@
 #include <linux/quotaops.h>
 #include <linux/slab.h>
 #include <linux/smp_lock.h>
+#include <linux/log2.h>
 
 #include "aops.h"
 #include "attrib.h"
@@ -1575,7 +1576,8 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	ntfs_debug("Index collation rule is 0x%x.",
 			le32_to_cpu(ir->collation_rule));
 	ni->itype.index.block_size = le32_to_cpu(ir->index_block_size);
-	if (ni->itype.index.block_size & (ni->itype.index.block_size - 1)) {
+	//if (ni->itype.index.block_size & (ni->itype.index.block_size - 1)) {
+	if (!is_power_of_2(ni->itype.index.block_size)) {
 		ntfs_error(vi->i_sb, "Index block size (%u) is not a power of "
 				"two.", ni->itype.index.block_size);
 		goto unm_err_out;
diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index acfed32..dd0de00 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -26,6 +26,7 @@
 #include <linux/highmem.h>
 #include <linux/buffer_head.h>
 #include <linux/bitops.h>
+#include <linux/log2.h>
 
 #include "attrib.h"
 #include "aops.h"
@@ -65,7 +66,8 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 			logfile_log_page_size < NTFS_BLOCK_SIZE ||
 			logfile_system_page_size &
 			(logfile_system_page_size - 1) ||
-			logfile_log_page_size & (logfile_log_page_size - 1)) {
+			//logfile_log_page_size & (logfile_log_page_size - 1)) {
+		   !is_power_of_2(logfile_log_page_size)) {
 		ntfs_error(vi->i_sb, "$LogFile uses unsupported page size.");
 		return false;
 	}
diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 209be95..dc44e21 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -85,6 +85,7 @@
 #include <linux/smp_lock.h>
 #include <linux/buffer_head.h>
 #include <linux/vfs.h>
+#include <linux/log2.h>
 
 #include "swab.h"
 #include "util.h"
@@ -850,7 +851,8 @@ magic_found:
 	uspi->s_fmask = fs32_to_cpu(sb, usb1->fs_fmask);
 	uspi->s_fshift = fs32_to_cpu(sb, usb1->fs_fshift);
 
-	if (uspi->s_fsize & (uspi->s_fsize - 1)) {
+	//if (uspi->s_fsize & (uspi->s_fsize - 1)) {
+	if (!is_power_of_2(uspi->s_fsize)) {
 		printk(KERN_ERR "ufs_read_super: fragment size %u is not a power of 2\n",
 			uspi->s_fsize);
 			goto failed;
@@ -865,7 +867,8 @@ magic_found:
 			uspi->s_fsize);
 		goto failed;
 	}
-	if (uspi->s_bsize & (uspi->s_bsize - 1)) {
+	//if (uspi->s_bsize & (uspi->s_bsize - 1)) {
+	if (!isp_power_of_2(uspi->s_bsize)) {
 		printk(KERN_ERR "ufs_read_super: block size %u is not a power of 2\n",
 			uspi->s_bsize);
 		goto failed;
diff --git a/kernel/kfifo.c b/kernel/kfifo.c
index 5d1d907..d76844f 100644
--- a/kernel/kfifo.c
+++ b/kernel/kfifo.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/kfifo.h>
+#include <linux/log2.h>
 
 /**
  * kfifo_init - allocates a new FIFO using a preallocated buffer
@@ -41,7 +42,8 @@ struct kfifo *kfifo_init(unsigned char *buffer, unsigned int size,
 	struct kfifo *fifo;
 
 	/* size must be a power of 2 */
-	BUG_ON(size & (size - 1));
+	//BUG_ON(size & (size - 1));
+	BUG_ON(!is_power_of_2(size));
 
 	fifo = kmalloc(sizeof(struct kfifo), gfp_mask);
 	if (!fifo)
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 054d464..3e42d6f 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -34,6 +34,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/random.h>
 #include <linux/string.h>
+#include <linux/log2.h>
 
 #define NEIGH_DEBUG 1
 
@@ -310,7 +311,8 @@ static void neigh_hash_grow(struct neigh_table *tbl, unsigned long new_entries)
 
 	NEIGH_CACHE_STAT_INC(tbl, hash_grows);
 
-	BUG_ON(new_entries & (new_entries - 1));
+	//BUG_ON(new_entries & (new_entries - 1));
+	BUG_ON(!is_power_of_2(new_entries));
 	new_hash = neigh_hash_alloc(new_entries);
 	if (!new_hash)
 		return;
diff --git a/sound/core/rtctimer.c b/sound/core/rtctimer.c
index 9f7b32e..073cc94 100644
--- a/sound/core/rtctimer.c
+++ b/sound/core/rtctimer.c
@@ -24,6 +24,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/moduleparam.h>
+#include <linux/log2.h>
 #include <sound/core.h>
 #include <sound/timer.h>
 
@@ -129,7 +130,8 @@ static int __init rtctimer_init(void)
 	struct snd_timer *timer;
 
 	if (rtctimer_freq < 2 || rtctimer_freq > 8192 ||
-	    (rtctimer_freq & (rtctimer_freq - 1)) != 0) {
+//	    (rtctimer_freq & (rtctimer_freq - 1)) != 0) {
+		!is_power_of_2(rtctimer_freq)) {
 		snd_printk(KERN_ERR "rtctimer: invalid frequency %d\n",
 			   rtctimer_freq);
 		return -EINVAL;
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
