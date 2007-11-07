From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 07 Nov 2007 08:10:23 +0000
Subject: [PATCH] BLOCK: Use "is_power_of_2()" macro in drivers/block/rd.c.
Message-Id: <Pine.LNX.4.64.0711070308330.12199@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  compile-tested on i386.


diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index 47f8ac6..6b12467 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -56,6 +56,7 @@
 #include <linux/backing-dev.h>
 #include <linux/blkpg.h>
 #include <linux/writeback.h>
+#include <linux/log2.h>

 #include <asm/uaccess.h>

@@ -437,7 +438,7 @@ static int __init rd_init(void)
 	err = -ENOMEM;

 	if (rd_blocksize > PAGE_SIZE || rd_blocksize < 512 ||
-			(rd_blocksize & (rd_blocksize-1))) {
+			!is_power_of_2(rd_blocksize)) {
 		printk("RAMDISK: wrong blocksize %d, reverting to defaults\n",
 		       rd_blocksize);
 		rd_blocksize = BLOCK_SIZE;
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
