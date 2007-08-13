From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:10:47 +0000
Subject: [kj] is_power_of_2 in ntfs
Message-Id: <1187009927.7273.13.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aia21@cantab.net
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index b532a73..8152f79 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -27,6 +27,7 @@
 #include <linux/pagemap.h>
 #include <linux/quotaops.h>
 #include <linux/slab.h>
+#include <linux/log2.h>
 
 #include "aops.h"
 #include "attrib.h"
@@ -1574,7 +1575,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 	ntfs_debug("Index collation rule is 0x%x.",
 			le32_to_cpu(ir->collation_rule));
 	ni->itype.index.block_size = le32_to_cpu(ir->index_block_size);
-	if (ni->itype.index.block_size & (ni->itype.index.block_size - 1)) {
+	if (!is_power_of_2(ni->itype.index.block_size)) {
 		ntfs_error(vi->i_sb, "Index block size (%u) is not a power of "
 				"two.", ni->itype.index.block_size);
 		goto unm_err_out;
diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index acfed32..00b2d02 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -26,6 +26,7 @@
 #include <linux/highmem.h>
 #include <linux/buffer_head.h>
 #include <linux/bitops.h>
+#include <linux/log2.h>
 
 #include "attrib.h"
 #include "aops.h"
@@ -63,9 +64,8 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 	logfile_log_page_size = le32_to_cpu(rp->log_page_size);
 	if (logfile_system_page_size < NTFS_BLOCK_SIZE ||
 			logfile_log_page_size < NTFS_BLOCK_SIZE ||
-			logfile_system_page_size &
-			(logfile_system_page_size - 1) ||
-			logfile_log_page_size & (logfile_log_page_size - 1)) {
+			!is_power_of_2(logfile_system_page_size) ||
+			!is_power_of_2(logfile_log_page_size)) {
 		ntfs_error(vi->i_sb, "$LogFile uses unsupported page size.");
 		return false;
 	}

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
