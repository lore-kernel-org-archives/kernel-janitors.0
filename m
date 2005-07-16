From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:13:27 +0000
Subject: [KJ] [PATCH] drivers/block/floppy.c : Use of the time_after() and
Message-Id: <42D8B397.6000600@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040805070401070206030905"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040805070401070206030905
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------040805070401070206030905
Content-Type: text/x-patch;
 name="floppy.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="floppy.patch"

Use of the time_after() and time_before()  macros, defined at linux/jiffies.h,
which deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/block/floppy.c	2005-07-13 17:53:25.000000000 -0300
+++ linux-kj/drivers/block/floppy.c	2005-07-14 01:24:16.816575504 -0300
@@ -179,6 +179,7 @@
 #include <linux/devfs_fs_kernel.h>
 #include <linux/device.h>
 #include <linux/buffer_head.h>	/* for invalidate_buffers() */
+#include <linux/jiffies.h>	/* for time_before() */
 
 /*
  * PS/2 floppies have much slower step rates than regular floppies.
@@ -733,7 +734,7 @@
 {
 	int fdc = FDC(drive);
 #ifdef FLOPPY_SANITY_CHECK
-	if (jiffies - UDRS->select_date < UDP->select_delay)
+	if (time_before(jiffies, UDRS->select_date + UDP->select_delay))
 		DPRINT("WARNING disk change called early\n");
 	if (!(FDCS->dor & (0x10 << UNIT(drive))) ||
 	    (FDCS->dor & 3) != UNIT(drive) || fdc != FDC(drive)) {
@@ -1061,7 +1062,7 @@
 		return 1;
 	}
 
-	if ((signed)(jiffies - delay) < 0) {
+	if (time_before(jiffies, delay)) {
 		del_timer(&fd_timer);
 		fd_timer.function = function;
 		fd_timer.expires = delay;
@@ -1521,7 +1522,7 @@
 		 * again just before spinup completion. Beware that
 		 * after scandrives, we must again wait for selection.
 		 */
-		if ((signed)(ready_date - jiffies) > DP->select_delay) {
+		if (time_after(ready_date, jiffies + DP->select_delay)) {
 			ready_date -= DP->select_delay;
 			function = (timeout_fn) floppy_start;
 		} else

--------------040805070401070206030905
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040805070401070206030905--
