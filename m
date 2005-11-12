From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 12 Nov 2005 14:55:35 +0000
Subject: [KJ]
Message-Id: <20051112145535.GA18165@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93425433651754108=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106245529.15916.12.camel@base.torri.org>
In-Reply-To: <1106245529.15916.12.camel@base.torri.org>
To: kernel-janitors@vger.kernel.org

--===============93425433651754108==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Marcelo Feitoza Parisi

They deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi
Signed-off-by: Alexey Dobriyan

Index: linux-kj/drivers/block/floppy.c
===================================================================
--- linux-kj.orig/drivers/block/floppy.c	2005-11-12 15:37:30.000000000 +0300
+++ linux-kj/drivers/block/floppy.c	2005-11-12 17:52:12.000000000 +0300
@@ -179,6 +179,7 @@ static int print_unex = 1;
 #include <linux/devfs_fs_kernel.h>
 #include <linux/platform_device.h>
 #include <linux/buffer_head.h>	/* for invalidate_buffers() */
+#include <linux/jiffies.h>
 
 /*
  * PS/2 floppies have much slower step rates than regular floppies.
@@ -736,7 +737,7 @@ static int disk_change(int drive)
 {
 	int fdc = FDC(drive);
 #ifdef FLOPPY_SANITY_CHECK
-	if (jiffies - UDRS->select_date < UDP->select_delay)
+	if (time_before(jiffies, UDRS->select_date + UDP->select_delay))
 		DPRINT("WARNING disk change called early\n");
 	if (!(FDCS->dor & (0x10 << UNIT(drive))) ||
 	    (FDCS->dor & 3) != UNIT(drive) || fdc != FDC(drive)) {
@@ -1064,7 +1065,7 @@ static int fd_wait_for_completion(unsign
 		return 1;
 	}
 
-	if ((signed)(jiffies - delay) < 0) {
+	if (time_before(jiffies, delay)) {
 		del_timer(&fd_timer);
 		fd_timer.function = function;
 		fd_timer.expires = delay;
@@ -1524,7 +1525,7 @@ static void setup_rw_floppy(void)
 		 * again just before spinup completion. Beware that
 		 * after scandrives, we must again wait for selection.
 		 */
-		if ((signed)(ready_date - jiffies) > DP->select_delay) {
+		if (time_after(ready_date, jiffies + DP->select_delay)) {
 			ready_date -= DP->select_delay;
 			function = (timeout_fn) floppy_start;
 		} else
@@ -3818,7 +3819,7 @@ static int check_floppy_change(struct ge
 	if (UTESTF(FD_DISK_CHANGED) || UTESTF(FD_VERIFY))
 		return 1;
 
-	if (UDP->checkfreq < (int)(jiffies - UDRS->last_checked)) {
+	if (time_after(jiffies, UDRS->last_checked + UDP->checkfreq)) {
 		if (floppy_grab_irq_and_dma()) {
 			return 1;
 		}


--===============93425433651754108==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93425433651754108==--
