From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:18:02 +0000
Subject: [KJ] [PATCH] 4/34: block/acsi_slm: replace interruptible_sleep_on()
Message-Id: <20050125221802.GE2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92551469682148424=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92551469682148424==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The sleep_on() call later in the same function is
replaced with inline wait-queue code which achieves the same. This required
adding a local wait-queue, though.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/block/acsi_slm.c	2005-01-24 09:28:38.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/acsi_slm.c	2005-01-25 14:15:17.000000000 -0800
@@ -67,6 +67,7 @@ not be guaranteed. There are several way
 #include <linux/slab.h>
 #include <linux/devfs_fs_kernel.h>
 #include <linux/smp_lock.h>
+#include <linux/wait.h>
 
 #include <asm/pgtable.h>
 #include <asm/system.h>
@@ -625,12 +626,10 @@ static ssize_t slm_write( struct file *f
 	int		device = iminor(node);
 	int		n, filled, w, h;
 
-	while( SLMState == PRINTING ||
-		   (SLMState == FILLING && SLMBufOwner != device) ) {
-		interruptible_sleep_on( &slm_wait );
-		if (signal_pending(current))
-			return( -ERESTARTSYS );
-	}
+	wait_event_interruptible(slm_wait, (SLMState != PRINTING &&
+				(SLMState != FILLING || SLMBufOwner == device)));
+	if (signal_pending(current))
+		return -ERESTARTSYS;
 	if (SLMState == IDLE) {
 		/* first data of page: get current page size  */
 		if (slm_get_pagesize( device, &w, &h ))
@@ -654,6 +653,7 @@ static ssize_t slm_write( struct file *f
 	filled += n;
 
 	if (filled == BufferSize) {
+		DEFINE_WAIT(wait);
 		/* Check the paper size again! The user may have switched it in the
 		 * time between starting the data and finishing them. Would end up in
 		 * a trashy page... */
@@ -672,7 +672,9 @@ static ssize_t slm_write( struct file *f
 #endif
 		
 		start_print( device );
-		sleep_on( &print_wait );
+		prepare_to_wait(&print_wait, &wait, TASK_UNINTERRUPTIBLE);
+		schedule();
+		finish_wait(&print_wait, &wait);
 		if (SLMError && IS_REAL_ERROR(SLMError)) {
 			printk( KERN_ERR "slm%d: %s\n", device, slm_errstr(SLMError) );
 			n = -EIO;

--===============92551469682148424==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92551469682148424==--
