From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 01 Feb 2005 19:43:08 +0000
Subject: [KJ] [UPDATE PATCH 33/33] usb/io_edgeport: remove
Message-Id: <20050201194308.GB2575@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22091585972626504=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22091585972626504==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 31, 2005 at 10:57:49AM -0800, Greg KH wrote:
> On Tue, Jan 25, 2005 at 04:49:18PM -0800, Nishanth Aravamudan wrote:
> > Hi,
> > 
> > Please consider applying.
> > 
> > Description: Use wait_event_timeout() instead of deprecated
> > interruptible_sleep_on_timeout(). Signals are not checked in the current code,
> > so interruptible should not be necessary. Patch is compile-tested.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> Applied, thanks.

Greg,

This should fix the behavior of the previous patch (probably not noticed yet).
The wake_up*() was not matched properly in the first patch (fixed below). Please
consider reverting the previous patch and applying this one instead.

Thanks,
Nish

Description: Use wait_event_timeout() instead of deprecated
interruptible_sleep_on_timeout() in one place. Directly use wait-queues in
other locations to remove remaining callers of interruptible_sleep_on_timeout().
Signals are not checked in the current code, so interruptible should not be
necessary. Thus, the wake_up*() calls were modified to match the wait_event*()
ones. There were some naming conflicts, which I tried to resolve appropriately.
The final replacement is within a #if 0 / #endif section of code, but in case
that code is ever used again, I would prefer it had the correct interface :) 
Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/usb/serial/io_edgeport.c	2005-01-24 09:34:15.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/serial/io_edgeport.c	2005-02-01 11:40:43.000000000 -0800
@@ -261,6 +261,7 @@
 #include <linux/spinlock.h>
 #include <linux/serial.h>
 #include <linux/ioctl.h>
+#include <linux/wait.h>
 #include <asm/uaccess.h>
 #include <linux/usb.h>
 #include "usb-serial.h"
@@ -991,7 +992,6 @@ static int edge_open (struct usb_serial_
 	struct usb_serial *serial;
 	struct edgeport_serial *edge_serial;
 	int response;
-	int timeout;
 
 	dbg("%s - port %d", __FUNCTION__, port->number);
 
@@ -1073,10 +1073,7 @@ static int edge_open (struct usb_serial_
 	}
 
 	/* now wait for the port to be completely opened */
-	timeout = OPEN_TIMEOUT;
-	while (timeout && edge_port->openPending == TRUE) {
-		timeout = interruptible_sleep_on_timeout (&edge_port->wait_open, timeout);
-	}
+	wait_event_timeout(edge_port->wait_open, (edge_port->openPending != TRUE), OPEN_TIMEOUT);
 
 	if (edge_port->open == FALSE) {
 		/* open timed out */
@@ -1128,9 +1125,10 @@ static int edge_open (struct usb_serial_
  ************************************************************************/
 static void block_until_chase_response(struct edgeport_port *edge_port)
 {
+	DEFINE_WAIT(wait);
 	__u16 lastCredits;
 	int timeout = 1*HZ;
-	int wait = 10;
+	int loop = 10;
 
 	while (1) {
 		// Save Last credits
@@ -1148,12 +1146,14 @@ static void block_until_chase_response(s
 		}
 
 		// Block the thread for a while
-		interruptible_sleep_on_timeout (&edge_port->wait_chase, timeout);
+		prepare_to_wait(&edge_port->wait_chase, &wait, TASK_UNINTERRUPTIBLE);
+		schedule_timeout(timeout);
+		finish_wait(&edge_port->wait_chase, &wait);
 
 		if (lastCredits == edge_port->txCredits) {
 			// No activity.. count down.
-			wait--;
-			if (wait == 0) {
+			loop--;
+			if (loop == 0) {
 				edge_port->chaseResponsePending = FALSE;
 				dbg("%s - Chase TIMEOUT", __FUNCTION__);
 				return;
@@ -1161,7 +1161,7 @@ static void block_until_chase_response(s
 		} else {
 			// Reset timout value back to 10 seconds
 			dbg("%s - Last %d, Current %d", __FUNCTION__, lastCredits, edge_port->txCredits);
-			wait = 10;
+			loop = 10;
 		}
 	}
 }
@@ -1179,10 +1179,11 @@ static void block_until_chase_response(s
  ************************************************************************/
 static void block_until_tx_empty (struct edgeport_port *edge_port)
 {
+	DEFINE_WAIT(wait);
 	struct TxFifo *fifo = &edge_port->txfifo;
 	__u32 lastCount;
 	int timeout = HZ/10;
-	int wait = 30;
+	int loop = 30;
 
 	while (1) {
 		// Save Last count
@@ -1195,20 +1196,22 @@ static void block_until_tx_empty (struct
 		}
 
 		// Block the thread for a while
-		interruptible_sleep_on_timeout (&edge_port->wait_chase, timeout);
+		prepare_to_wait (&edge_port->wait_chase, &wait, TASK_UNINTERRUPTIBLE);
+		schedule_timeout(timeout);
+		finish_wait(&edge_port->wait_chase, &wait);
 
 		dbg("%s wait", __FUNCTION__);
 
 		if (lastCount == fifo->count) {
 			// No activity.. count down.
-			wait--;
-			if (wait == 0) {
+			loop--;
+			if (loop == 0) {
 				dbg("%s - TIMEOUT", __FUNCTION__);
 				return;
 			}
 		} else {
 			// Reset timout value back to seconds
-			wait = 30;
+			loop = 30;
 		}
 	}
 }
@@ -2108,7 +2111,7 @@ static void process_rcvd_status (struct 
 				// We could choose to do something else when Byte3 says Timeout on Chase from Edgeport,
 				// like wait longer in block_until_chase_response, but for now we don't. 
 				edge_port->chaseResponsePending = FALSE;
-				wake_up_interruptible (&edge_port->wait_chase);
+				wake_up (&edge_port->wait_chase);
 				return;
 
 			case IOSP_EXT_STATUS_RX_CHECK_RSP:
@@ -2131,7 +2134,7 @@ static void process_rcvd_status (struct 
 		/* we have completed the open */
 		edge_port->openPending = FALSE;
 		edge_port->open = TRUE;
-		wake_up_interruptible(&edge_port->wait_open);
+		wake_up(&edge_port->wait_open);
 		return;
 	}
 
@@ -2500,9 +2503,7 @@ static int write_cmd_usb (struct edgepor
 	// wait for command to finish
 	timeout = COMMAND_TIMEOUT;
 #if 0
-	while (timeout && edge_port->commandPending == TRUE) {
-		timeout = interruptible_sleep_on_timeout (&edge_port->wait_command, timeout);
-	}
+	wait_event (&edge_port->wait_command, (edge_port->commandPending == FALSE));
 
 	if (edge_port->commandPending == TRUE) {
 		/* command timed out */

--===============22091585972626504==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22091585972626504==--
