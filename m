From: vignesh babu <vignesh.babu@wipro.com>
Date: Wed, 13 Jun 2007 04:15:13 +0000
Subject: [KJ] [PATCH]is_power_of_2-hfs/mdb.c
Message-Id: <1181707393.13391.29.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zippel@linux-m68k.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/fs/hfs/mdb.c b/fs/hfs/mdb.c
index b4651e1..8bda11d 100644
--- a/fs/hfs/mdb.c
+++ b/fs/hfs/mdb.c
@@ -11,6 +11,7 @@
 #include <linux/cdrom.h>
 #include <linux/genhd.h>
 #include <linux/nls.h>
+#include <linux/log2.h>
 
 #include "hfs_fs.h"
 #include "btree.h"
@@ -106,7 +107,7 @@ int hfs_mdb_get(struct super_block *sb)
 
 	size = min(HFS_SB(sb)->alloc_blksz, (u32)PAGE_SIZE);
 	/* size must be a multiple of 512 */
-	while (size & (size - 1))
+	while (!is_power_of_2(size))
 		size -= HFS_SECTOR_SIZE;
 	sect = be16_to_cpu(mdb->drAlBlSt) + part_start;
 	/* align block size to first sector */

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
