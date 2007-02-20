From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Tue, 20 Feb 2007 08:02:09 +0000
Subject: [KJ] [PATCH] is_power_of_2 in fs/hfs
Message-Id: <1171957809.6127.66.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors List <kernel-janitors@lists.osdl.org>
Cc: zippel@linux-m68k.org, linux-kernel@vger.kernel.org

Replacing (n & (n-1)) in the context of power of 2 checks 
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
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
index a9b9e87..90ebab7 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -10,6 +10,7 @@
 
 #include <linux/slab.h>
 #include <linux/pagemap.h>
+#include <linux/log2.h>
 
 #include "hfsplus_fs.h"
 #include "hfsplus_raw.h"
@@ -69,7 +70,7 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 	}
 
 	size = tree->node_size;
-	if (!size || size & (size - 1))
+	if (!is_power_of_2(size))
 		goto fail_page;
 	if (!tree->node_count)
 		goto fail_page;

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
