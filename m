From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 04 Apr 2005 18:10:53 +0000
Subject: [KJ] [UPDATE PATCH] usb/digi_acceleport: remove
Message-Id: <20050404181053.GB3082@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6218314828776399=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6218314828776399==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 02, 2005 at 11:03:09AM -0800, Nishanth Aravamudan wrote:
> Hello,
> 
> Description: Replace deprecated interruptible_sleep_on_timeout() with direct
> wait-queue usage. Also replace some rather odd wait-queue usage with the
> existent macros. Also adjusted the wake_up_interruptible() call appropriately,
> as I changed all the states to TASK_UNINTERRUPTIBLE (signals were not be checked
> in the current code). Patch is compile-tested.

Patch was broken in various ways. Fixed-up below (ends up being fewer
changes). Please drop previous patch and apply the attached.

Description: Replace deprecated interruptible_sleep_on_timeout() with
direct wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.12-rc1-v/drivers/usb/serial/digi_acceleport.c	2005-03-01 23:38:08.000000000 -0800
+++ 2.6.12-rc1-kj/drivers/usb/serial/digi_acceleport.c	2005-04-04 11:10:00.000000000 -0700
@@ -14,6 +14,9 @@
 *  Peter Berger (pberger@brimson.com)
 *  Al Borchers (borchers@steinerpoint.com)
 * 
+* (04/04/2005) nacc
+* 	removed interruptible_sleep_on_timeout() usage [deprecated]
+*
 * (12/03/2001) gkh
 *	switched to using port->open_count instead of private version.
 *	Removed port->active
@@ -244,6 +247,7 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
+#include <linux/wait.h>
 #include <asm/uaccess.h>
 #include <linux/usb.h>
 #include "usb-serial.h"
@@ -567,27 +571,21 @@ static struct usb_serial_device_type dig
 *  and the sleep.  In other words, spin_unlock_irqrestore and
 *  interruptible_sleep_on_timeout are "atomic" with respect to
 *  wake ups.  This is used to implement condition variables.
+*
+*  interruptible_sleep_on_timeout is deprecated and has been replaced
+*  with the equivalent code.
 */
 
 static inline long cond_wait_interruptible_timeout_irqrestore(
 	wait_queue_head_t *q, long timeout,
 	spinlock_t *lock, unsigned long flags )
 {
+	DEFINE_WAIT(wait);
 
-	wait_queue_t wait;
-
-
-	init_waitqueue_entry( &wait, current );
-
-	set_current_state( TASK_INTERRUPTIBLE );
-
-	add_wait_queue( q, &wait );
-
-	spin_unlock_irqrestore( lock, flags );
-
+	prepare_to_wait(q, &wait, TASK_INTERRUPTIBLE);
+	spin_unlock_irqrestore(lock, flags);
 	timeout = schedule_timeout(timeout);
-
-	remove_wait_queue( q, &wait );
+	finish_wait(q, &wait);
 
 	return( timeout );
 
@@ -1528,7 +1526,7 @@ dbg( "digi_open: TOP: port=%d, open_coun
 
 static void digi_close( struct usb_serial_port *port, struct file *filp )
 {
-
+	DEFINE_WAIT(wait);
 	int ret;
 	unsigned char buf[32];
 	struct tty_struct *tty = port->tty;
@@ -1604,8 +1602,9 @@ dbg( "digi_close: TOP: port=%d, open_cou
 			dbg( "digi_close: write oob failed, ret=%d", ret );
 
 		/* wait for final commands on oob port to complete */
-		interruptible_sleep_on_timeout( &priv->dp_flush_wait,
-			DIGI_CLOSE_TIMEOUT );
+		prepare_to_wait(&priv->dp_flush_wait, &wait, TASK_INTERRUPTIBLE);
+		schedule_timeout(DIGI_CLOSE_TIMEOUT);
+		finish_wait(&priv->dp_flush_wait, &wait);
 
 		/* shutdown any outstanding bulk writes */
 		usb_kill_urb(port->write_urb);

--===============6218314828776399==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6218314828776399==--
