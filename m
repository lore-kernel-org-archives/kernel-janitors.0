From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Tue, 20 Feb 2007 08:04:42 +0000
Subject: [KJ] [PATCH] is_power_of_2 in fs/block_dev.c
Message-Id: <1171957962.6127.67.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors List <kernel-janitors@lists.osdl.org>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org

Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2


Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/fs/block_dev.c b/fs/block_dev.c
index fc7028b..e8f2a2b 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -22,6 +22,7 @@
 #include <linux/mount.h>
 #include <linux/uio.h>
 #include <linux/namei.h>
+#include <linux/log2.h>
 #include <asm/uaccess.h>
 #include "internal.h"
 
@@ -65,7 +66,7 @@ static void kill_bdev(struct block_device *bdev)
 int set_blocksize(struct block_device *bdev, int size)
 {
 	/* Size must be a power of two, and between 512 and PAGE_SIZE */
-	if (size > PAGE_SIZE || size < 512 || (size & (size-1)))
+	if (size > PAGE_SIZE || size < 512 || !is_power_of_2(size))
 		return -EINVAL;
 
 	/* Size cannot be smaller than the size supported by the device */

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
