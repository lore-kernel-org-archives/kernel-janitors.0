From: james4765@verizon.net
Date: Sat, 30 Oct 2004 13:42:46 +0000
Subject: [KJ] [PATCH] floppy: change MODULE_PARM to module_param in
Message-Id: <20041030134246.23710.45693.84191@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13052579749371063=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org
Cc: james4765@verizon.net

--===============13052579749371063==

Replace MODULE_PARM with module_param in drivers/block/floppy.c.  Compile tested.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.9-original/drivers/block/floppy.c linux-2.6.9/drivers/block/floppy.c
--- linux-2.6.9-original/drivers/block/floppy.c	2004-10-18 17:53:22.000000000 -0400
+++ linux-2.6.9/drivers/block/floppy.c	2004-10-30 09:16:04.856720081 -0400
@@ -180,6 +180,7 @@
 #include <linux/devfs_fs_kernel.h>
 #include <linux/device.h>
 #include <linux/buffer_head.h>	/* for invalidate_buffers() */
+#include <linux/moduleparam.h>
 
 /*
  * PS/2 floppies have much slower step rates than regular floppies.
@@ -4623,9 +4624,9 @@
 	wait_for_completion(&device_release);
 }
 
-MODULE_PARM(floppy, "s");
-MODULE_PARM(FLOPPY_IRQ, "i");
-MODULE_PARM(FLOPPY_DMA, "i");
+module_param(floppy, charp, 0);
+module_param(FLOPPY_IRQ, int, 0);
+module_param(FLOPPY_DMA, int, 0);
 MODULE_AUTHOR("Alain L. Knaff");
 MODULE_SUPPORTED_DEVICE("fd");
 MODULE_LICENSE("GPL");

--===============13052579749371063==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13052579749371063==--
