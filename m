From: walter harms <wharms@bfs.de>
Date: Thu, 18 May 2006 11:52:27 +0000
Subject: [KJ] Fix: linux-2.6.16.16/drivers/mtd/maps/nettel.c compile error
Message-Id: <446C5FFB.6000905@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi list,
The attached patch add two missing includes that cause
a missing ROOT_DEV.
compile tested
found with: make randconfig

Signed-off-by: walter harms <wharms@bfs.de>

--- linux-2.6.16.16/drivers/mtd/maps/nettel.c.bak	2006-05-17 
23:03:27.000000000 +0200
+++ linux-2.6.16.16/drivers/mtd/maps/nettel.c	2006-05-17 
23:09:43.000000000 +0200
@@ -20,6 +20,11 @@
  #include <linux/mtd/partitions.h>
  #include <linux/mtd/cfi.h>
  #include <linux/reboot.h>
+#ifndef CONFIG_BLK_DEV_INITRD
+#include <linux/kdev_t.h>
+#include <linux/root_dev.h>
+#endif
+
  #include <asm/io.h>

 
/****************************************************************************/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
