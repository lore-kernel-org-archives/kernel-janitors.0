From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:23:39 +0000
Subject: [KJ] [PATCH 13/39] input/iforce-packets: use
Message-Id: <20050120192339.GN5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3681287431159368=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3681287431159368==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible_timeout() instead of custom wait-queue
code. The main controversy of this patch is that I do not add to the wait-queue
before checking usb_submit_urb(). I am not sure if this will cause problems.
Otherwise the code is effectively identical. Remove the now unnecessary
declaration of the waitqueue and timeout. Add the appropriate #include to
iforce.h as well.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc1-kj-v/drivers/input/joystick/iforce/iforce.h	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/input/joystick/iforce/iforce.h	2005-01-20 11:19:15.000000000 -0800
@@ -37,6 +37,7 @@
 #include <linux/serio.h>
 #include <linux/config.h>
 #include <linux/circ_buf.h>
+#include <linux/wait.h>
 #include <asm/semaphore.h>
 
 /* This module provides arbitrary resource management routines.
--- 2.6.11-rc1-kj-v/drivers/input/joystick/iforce/iforce-packets.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/input/joystick/iforce/iforce-packets.c	2005-01-20 11:19:34.000000000 -0800
@@ -249,9 +249,6 @@ void iforce_process_packet(struct iforce
 
 int iforce_get_id_packet(struct iforce *iforce, char *packet)
 {
-	DECLARE_WAITQUEUE(wait, current);
-	int timeout = HZ; /* 1 second */
-
 	switch (iforce->bus) {
 
 	case IFORCE_USB:
@@ -260,24 +257,12 @@ int iforce_get_id_packet(struct iforce *
 		iforce->cr.bRequest = packet[0];
 		iforce->ctrl->dev = iforce->usbdev;
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		add_wait_queue(&iforce->wait, &wait);
-
 		if (usb_submit_urb(iforce->ctrl, GFP_ATOMIC)) {
-			set_current_state(TASK_RUNNING);
-			remove_wait_queue(&iforce->wait, &wait);
 			return -1;
 		}
-
-		while (timeout && iforce->ctrl->status == -EINPROGRESS) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			timeout = schedule_timeout(timeout);
-		}
-
-		set_current_state(TASK_RUNNING);
-		remove_wait_queue(&iforce->wait, &wait);
-
-		if (!timeout) {
+		
+		if (!wait_event_interruptible_timeout(iforce->wait,
+					(iforce->ctrl->status != -EINPROGRESS), HZ));
 			usb_unlink_urb(iforce->ctrl);
 			return -1;
 		}
@@ -292,18 +277,8 @@ int iforce_get_id_packet(struct iforce *
 		iforce->expect_packet = FF_CMD_QUERY;
 		iforce_send_packet(iforce, FF_CMD_QUERY, packet);
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		add_wait_queue(&iforce->wait, &wait);
-
-		while (timeout && iforce->expect_packet) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			timeout = schedule_timeout(timeout);
-		}
-
-		set_current_state(TASK_RUNNING);
-		remove_wait_queue(&iforce->wait, &wait);
-
-		if (!timeout) {
+		if (!wait_event_interrutible_timeout(iforce->wait,
+					(!iforce->expect_packet), HZ)) { 
 			iforce->expect_packet = 0;
 			return -1;
 		}

--===============3681287431159368==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3681287431159368==--
