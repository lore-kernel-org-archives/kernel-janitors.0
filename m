From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Tue, 20 Feb 2007 08:01:16 +0000
Subject: [KJ] [PATCH] is_power_of_2 in ext3
Message-Id: <1171957756.6127.63.camel@wriver-t81fb058.linuxcoe>
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
diff --git a/fs/ext3/super.c b/fs/ext3/super.c
index b348867..6a86e98 100644
--- a/fs/ext3/super.c
+++ b/fs/ext3/super.c
@@ -35,6 +35,7 @@
 #include <linux/namei.h>
 #include <linux/quotaops.h>
 #include <linux/seq_file.h>
+#include <linux/log2.h>
 
 #include <asm/uaccess.h>
 
@@ -1565,7 +1566,7 @@ static int ext3_fill_super (struct super_block *sb, void *data, int silent)
 		sbi->s_inode_size = le16_to_cpu(es->s_inode_size);
 		sbi->s_first_ino = le32_to_cpu(es->s_first_ino);
 		if ((sbi->s_inode_size < EXT3_GOOD_OLD_INODE_SIZE) ||
-		    (sbi->s_inode_size & (sbi->s_inode_size - 1)) ||
+		    !is_power_of_2(sbi->s_inode_size) ||
 		    (sbi->s_inode_size > blocksize)) {
 			printk (KERN_ERR
 				"EXT3-fs: unsupported inode size: %d\n",

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
