From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 06:05:49 +0000
Subject: [KJ] [PATCH 4/5] moving to is_power_of_2
Message-Id: <1171605229.27506.80.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing instances of (n&(n-1)) for power of 2 
check with is_power_of_2 from linux/log.h.



Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
 drivers/block/rd.c             |    2 +-
 drivers/net/cxgb3/cxgb3_main.c |    2 +-
 drivers/rtc/rtc-s3c.c          |    1 +
 fs/ext4/super.c                |    2 +-
 fs/ntfs/logfile.c              |    2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index e830250..e6c01f5 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -423,7 +423,7 @@ static int __init rd_init(void)
 	int err = -ENOMEM;
 
 	if (rd_blocksize > PAGE_SIZE || rd_blocksize < 512 ||
-		   (!is_power_of_2(rd_blocksize))) {
+					(!is_power_of_2(rd_blocksize))) {
 		printk("RAMDISK: wrong blocksize %d, reverting to defaults\n",
 		       rd_blocksize);
 		rd_blocksize = BLOCK_SIZE;
diff --git a/drivers/net/cxgb3/cxgb3_main.c b/drivers/net/cxgb3/cxgb3_main.c
index 7f9ac8d..9d513ec 100644
--- a/drivers/net/cxgb3/cxgb3_main.c
+++ b/drivers/net/cxgb3/cxgb3_main.c
@@ -1794,7 +1794,7 @@ static int cxgb_extension_ioctl(struct net_device *dev, void __user *useraddr)
 		if (copy_from_user(&m, useraddr, sizeof(m)))
 			return -EFAULT;
 		if (!is_power_of_2(m.rx_pg_sz) ||
-					!is_power_of_2(m.tx_pg_sz))
+				!is_power_of_2(m.tx_pg_sz))
 			return -EINVAL;	/* not power of 2 */
 		if (!(m.rx_pg_sz & 0x14000))
 			return -EINVAL;	/* not 16KB or 64KB */
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index c49e6b3..b316a71 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -311,6 +311,7 @@ static int s3c_rtc_ioctl(struct device *dev,
 
 	case RTC_IRQP_SET:
 		/* check for power of 2 */
+		
 		if (!arg || !is_power_of_2(arg)) {
 			ret = -EINVAL;
 			goto exit;
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 857f341..ccf9cfb 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1645,7 +1645,7 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 	if (EXT4_HAS_INCOMPAT_FEATURE(sb, EXT4_FEATURE_INCOMPAT_64BIT)) {
 		if (sbi->s_desc_size < EXT4_MIN_DESC_SIZE_64BIT ||
 		    sbi->s_desc_size > EXT4_MAX_DESC_SIZE ||
-				  !is_power_of_2(sbi->s_desc_size)) {
+			!is_power_of_2(sbi->s_desc_size)) {
 			printk(KERN_ERR
 			       "EXT4-fs: unsupported descriptor size %lu\n",
 			       sbi->s_desc_size);
diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index ce23992..464f7a6 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -66,7 +66,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 			logfile_log_page_size < NTFS_BLOCK_SIZE ||
 			logfile_system_page_size &
 			(logfile_system_page_size - 1) ||
-		   !is_power_of_2(logfile_log_page_size)) {
+			!is_power_of_2(logfile_log_page_size)) {
 		ntfs_error(vi->i_sb, "$LogFile uses unsupported page size.");
 		return false;
 	}
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
