From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:03:09 +0000
Subject: [KJ] [PATCH 6/20] usb/digi_acceleport: remove
Message-Id: <20050202190309.GH2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70550050386003105=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70550050386003105==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Replace deprecated interruptible_sleep_on_timeout() with direct
wait-queue usage. Also replace some rather odd wait-queue usage with the
existent macros. Also adjusted the wake_up_interruptible() call appropriately,
as I changed all the states to TASK_UNINTERRUPTIBLE (signals were not be checked
in the current code). Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/usb/serial/digi_acceleport.c	2005-01-24 09:28:33.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/serial/digi_acceleport.c	2005-02-01 13:23:12.000000000 -0800
@@ -13,6 +13,9 @@
 *
 *  Peter Berger (pberger@brimson.com)
 *  Al Borchers (borchers@steinerpoint.com)
+*
+* (2/1/2005) nacc
+* 	removed interruptible_sleep_on_timeout() usage [deprecated]
 * 
 * (12/03/2001) gkh
 *	switched to using port->open_count instead of private version.
@@ -246,6 +249,7 @@
 #include <linux/workqueue.h>
 #include <asm/uaccess.h>
 #include <linux/usb.h>
+#include <linux/wait.h>
 #include "usb-serial.h"
 
 /* Defines */
@@ -573,23 +577,14 @@ static inline long cond_wait_interruptib
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
+	prepare_to_wait(q, &wait, TASK_UNINTERRUPTIBLE);
+	spin_unlock_irqrestore(lock, flags);
 	timeout = schedule_timeout(timeout);
+	finish_wait(q, &wait);
 
-	remove_wait_queue( q, &wait );
-
-	return( timeout );
+	return timeout;
 
 }
 
@@ -1528,7 +1523,7 @@ dbg( "digi_open: TOP: port=%d, open_coun
 
 static void digi_close( struct usb_serial_port *port, struct file *filp )
 {
-
+	DEFINE_WAIT(wait);
 	int ret;
 	unsigned char buf[32];
 	struct tty_struct *tty = port->tty;
@@ -1604,8 +1599,9 @@ dbg( "digi_close: TOP: port=%d, open_cou
 			dbg( "digi_close: write oob failed, ret=%d", ret );
 
 		/* wait for final commands on oob port to complete */
-		interruptible_sleep_on_timeout( &priv->dp_flush_wait,
-			DIGI_CLOSE_TIMEOUT );
+		prepare_to_wait(&priv->dp_flush_wait, &wait, TASK_UNINTERRUPTIBLE);
+		schedule_timeout(DIGI_CLOSE_TIMEOUT);
+		finish_wait(&priv->dp_flush_wait, &wait);
 
 		/* shutdown any outstanding bulk writes */
 		usb_kill_urb(port->write_urb);
@@ -2002,7 +1998,7 @@ opcode, line, status, val );
 
 		} else if( opcode == DIGI_CMD_IFLUSH_FIFO ) {
 
-			wake_up_interruptible( &priv->dp_flush_wait );
+			wake_up( &priv->dp_flush_wait );
 
 		}
 

--===============70550050386003105==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70550050386003105==--
