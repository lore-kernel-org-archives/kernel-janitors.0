From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:06:08 +0000
Subject: [KJ] [PATCH 8/20] usb/usb-midi: remove
Message-Id: <20050202190608.GJ2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25605982069291855=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25605982069291855==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Replace direct wait-queue usage with wait_event_timeout(). Removed
some local variables which help determine loop time, but which are now
compressed into the wait_event_timeout() macro. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/usb/class/usb-midi.c	2005-01-24 09:34:13.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/class/usb-midi.c	2005-02-01 14:02:39.000000000 -0800
@@ -37,6 +37,7 @@
 #include <linux/poll.h>
 #include <linux/sound.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 #include <asm/semaphore.h>
 
 #include "usb-midi.h"
@@ -317,9 +318,7 @@ static int usb_write( struct midi_out_en
 	int pipe;
 	int ret = 0;
 	int status;
-	int maxretry = 50;
 	
-	DECLARE_WAITQUEUE(wait,current);
 	init_waitqueue_head(&ep->wait);
 
 	d = ep->usbdev;
@@ -335,19 +334,10 @@ static int usb_write( struct midi_out_en
 		goto error;
 	}
 
-	add_wait_queue( &ep->wait, &wait );
-	set_current_state( TASK_INTERRUPTIBLE );
-
-	while( ep->urb->status == -EINPROGRESS ) {
-		if ( maxretry-- < 0 ) {
-			printk(KERN_ERR "usbmidi: usb_bulk_msg timed out\n");
-			ret = -ETIME;
-			break;
-		}
-		interruptible_sleep_on_timeout( &ep->wait, 10 );
+	if (!wait_event_timeout(ep->wait, (ep->urb->status != -EINPROGRESS), 500)) {
+		printk(KERN_ERR "usbmidi: usb_bulk_msg timed out\n");
+		ret = -ETIME;
 	}
-	set_current_state( TASK_RUNNING );
-	remove_wait_queue( &ep->wait, &wait );
 
 error:
 	return ret;

--===============25605982069291855==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25605982069291855==--
