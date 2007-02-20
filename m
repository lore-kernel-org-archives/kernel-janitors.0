From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Tue, 20 Feb 2007 08:01:30 +0000
Subject: [KJ] [PATCH] is_power_of_2 in ext4
Message-Id: <1171957770.6127.64.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors List <kernel-janitors@lists.osdl.org>
Cc: sct@redhat.com, akpm@osdl.org, adilger@clusterfs.com, linux-ext4@vger.kernel.org

Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 486a641..e70172b 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -35,6 +35,7 @@
 #include <linux/namei.h>
 #include <linux/quotaops.h>
 #include <linux/seq_file.h>
+#include <linux/log2.h>
 
 #include <asm/uaccess.h>
 
@@ -1624,7 +1625,7 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT4_GOOD_OLD_INODE_SIZE) ||
-		    (sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+		    !is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
 				"EXT4-fs: unsupported inode size: %d\n",
@@ -1644,7 +1645,7 @@ static int ext4_fill_super (struct super_block *sb, void *data, int silent)
 	if (EXT4_HAS_INCOMPAT_FEATURE(sb, EXT4_FEATURE_INCOMPAT_64BIT)) {
 		if (sbi->s_desc_size < EXT4_MIN_DESC_SIZE_64BIT ||
 		    sbi->s_desc_size > EXT4_MAX_DESC_SIZE ||
-		    sbi->s_desc_size & (sbi->s_desc_size - 1)) {
+		    !is_power_of_2(sbi->s_desc_size)) {
 			printk(KERN_ERR
 			       "EXT4-fs: unsupported descriptor size %lu\n",
 			       sbi->s_desc_size);

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
