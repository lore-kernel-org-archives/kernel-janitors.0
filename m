From: vignesh babu <vignesh.babu@wipro.com>
Date: Thu, 07 Jun 2007 10:09:39 +0000
Subject: [KJ][PATCH]is_power_of_2-block/rd.c
Message-Id: <1181210259.11218.0.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@kernel.dk, page0588@sundance.sjsu.edu
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index a1512da..e57f729 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -56,6 +56,7 @@
 #include <linux/backing-dev.h>
 #include <linux/blkpg.h>
 #include <linux/writeback.h>
+#include <linux/log2.h>
 
 #include <asm/uaccess.h>
 
@@ -422,7 +423,7 @@ static int __init rd_init(void)
 	int err = -ENOMEM;
 
 	if (rd_blocksize > PAGE_SIZE || rd_blocksize < 512 ||
-			(rd_blocksize & (rd_blocksize-1))) {
+			!is_power_of_2(rd_blocksize)) {
 		printk("RAMDISK: wrong blocksize %d, reverting to defaults\n",
 		       rd_blocksize);
 		rd_blocksize = BLOCK_SIZE;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
