From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 19:35:18 +0000
Subject: [KJ] [PATCH] drivers/scsi/osst.c : User of time_after_eq macro
Message-Id: <42CED576.1020709@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090407060408000606090102"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090407060408000606090102
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Use of time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

--------------090407060408000606090102
Content-Type: text/x-patch;
 name="osst.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="osst.patch"

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/scsi/osst.c	2005-07-07 19:11:54.000000000 -0300
+++ linux-kj/drivers/scsi/osst.c	2005-07-07 22:38:27.090949880 -0300
@@ -50,6 +50,7 @@
 #include <linux/moduleparam.h>
 #include <linux/devfs_fs_kernel.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <asm/uaccess.h>
 #include <asm/dma.h>
 #include <asm/system.h>
@@ -803,7 +804,7 @@
 		    ) && result >= 0)
 		{
 #if DEBUG			
-			if (debugging || jiffies - startwait >= 2*HZ/OSST_POLL_PER_SEC)
+			if (debugging || time_after_eq(jiffies, startwait + 2*HZ/OSST_POLL_PER_SEC))
 				printk (OSST_DEB_MSG
 					"%s:D: Succ wait f fr %i (>%i): %i-%i %i (%i): %3li.%li s\n",
 					name, curr, curr+minlast, STp->first_frame_position,
@@ -814,7 +815,7 @@
 			return 0;
 		}
 #if DEBUG
-		if (jiffies - startwait >= 2*HZ/OSST_POLL_PER_SEC && notyetprinted)
+		if (time_after_eq(jiffies, startwait + 2*HZ/OSST_POLL_PER_SEC) && notyetprinted)
 		{
 			printk (OSST_DEB_MSG "%s:D: Wait for frame %i (>%i): %i-%i %i (%i)\n",
 				name, curr, curr+minlast, STp->first_frame_position,

--------------090407060408000606090102
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090407060408000606090102--
