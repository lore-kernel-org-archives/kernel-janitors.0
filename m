From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 06:05:50 +0000
Subject: [KJ] [PATCH 5/5] moving to is_power_of_2
Message-Id: <1171605230.27506.82.camel@wriver-t81fb058.linuxcoe>
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
 drivers/net/pcmcia/pcnet_cs.c  |    2 +-
 fs/ext2/super.c                |    2 +-
 fs/ext3/super.c                |    2 +-
 fs/ext4/super.c                |    4 ++--
 sound/core/rtctimer.c          |    2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index e6c01f5..32b489b 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -423,7 +423,7 @@ static int __init rd_init(void)
 	int err = -ENOMEM;
 
 	if (rd_blocksize > PAGE_SIZE || rd_blocksize < 512 ||
-					(!is_power_of_2(rd_blocksize))) {
+			(!is_power_of_2(rd_blocksize))) {
 		printk("RAMDISK: wrong blocksize %d, reverting to defaults\n",
 		       rd_blocksize);
 		rd_blocksize = BLOCK_SIZE;
diff --git a/drivers/net/cxgb3/cxgb3_main.c b/drivers/net/cxgb3/cxgb3_main.c
index 9d513ec..26ac0bb 100644
--- a/drivers/net/cxgb3/cxgb3_main.c
+++ b/drivers/net/cxgb3/cxgb3_main.c
@@ -1794,7 +1794,7 @@ static int cxgb_extension_ioctl(struct net_device *dev, void __user *useraddr)
 		if (copy_from_user(&m, useraddr, sizeof(m)))
 			return -EFAULT;
 		if (!is_power_of_2(m.rx_pg_sz) ||
-				!is_power_of_2(m.tx_pg_sz))
+			!is_power_of_2(m.tx_pg_sz))
 			return -EINVAL;	/* not power of 2 */
 		if (!(m.rx_pg_sz & 0x14000))
 			return -EINVAL;	/* not 16KB or 64KB */
diff --git a/drivers/net/pcmcia/pcnet_cs.c b/drivers/net/pcmcia/pcnet_cs.c
index fde3389..3966b02 100644
--- a/drivers/net/pcmcia/pcnet_cs.c
+++ b/drivers/net/pcmcia/pcnet_cs.c
@@ -1484,7 +1484,7 @@ static int setup_shmem_window(struct pcmcia_device *link, int start_pg,
 	window_size = 32 * 1024;
 
     /* Make sure it's a power of two.  */
-	while (!is_power_of_2(window_size))
+    while (!is_power_of_2(window_size))
 	window_size += window_size & ~(window_size - 1);
 
     /* Allocate a memory window */
diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 7585408..9f71032 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -803,7 +803,7 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT2_GOOD_OLD_INODE_SIZE) ||
-			!is_power_of_2(sbi->s_inode_size) ||
+		    !is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk ("EXT2-fs: unsupported inode size: %d\n",
 				sbi->s_inode_size);
diff --git a/fs/ext3/super.c b/fs/ext3/super.c
index 3f4d52c..6a86e98 100644
--- a/fs/ext3/super.c
+++ b/fs/ext3/super.c
@@ -1566,7 +1566,7 @@ static int ext3_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT3_GOOD_OLD_INODE_SIZE) ||
-			!is_power_of_2(sbi->s_inode_size) ||
+		    !is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
 				"EXT3-fs: unsupported inode size: %d\n",
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index ccf9cfb..e70172b 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1625,7 +1625,7 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT4_GOOD_OLD_INODE_SIZE) ||
-			!is_power_of_2(sbi->s_inode_size) ||
+		    !is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
 				"EXT4-fs: unsupported inode size: %d\n",
@@ -1645,7 +1645,7 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 	if (EXT4_HAS_INCOMPAT_FEATURE(sb, EXT4_FEATURE_INCOMPAT_64BIT)) {
 		if (sbi->s_desc_size < EXT4_MIN_DESC_SIZE_64BIT ||
 		    sbi->s_desc_size > EXT4_MAX_DESC_SIZE ||
-			!is_power_of_2(sbi->s_desc_size)) {
+		    !is_power_of_2(sbi->s_desc_size)) {
 			printk(KERN_ERR
 			       "EXT4-fs: unsupported descriptor size %lu\n",
 			       sbi->s_desc_size);
diff --git a/sound/core/rtctimer.c b/sound/core/rtctimer.c
index 302c21a..7cd5e8f 100644
--- a/sound/core/rtctimer.c
+++ b/sound/core/rtctimer.c
@@ -130,7 +130,7 @@ static int __init rtctimer_init(void)
 	struct snd_timer *timer;
 
 	if (rtctimer_freq < 2 || rtctimer_freq > 8192 ||
-		!is_power_of_2(rtctimer_freq)) {
+	    !is_power_of_2(rtctimer_freq)) {
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
