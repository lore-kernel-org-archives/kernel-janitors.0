From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 24 Jan 2005 16:34:17 +0000
Subject: [KJ] [UPDATE PATCH] input/iforce-packets: use
Message-Id: <20050124163417.GB2685@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21218625700454363=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050122235426.GB22170@nd47.coderock.org> <20050123091849.GB3196@stusta.de>
In-Reply-To: <20050123091849.GB3196@stusta.de>
To: Adrian Bunk <bunk@stusta.de>
Cc: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============21218625700454363==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 23, 2005 at 10:18:49AM +0100, Adrian Bunk wrote:
> On Sun, Jan 23, 2005 at 12:54:26AM +0100, Domen Puncer wrote:
> >...
> > new in this release:
> > --------------------
> >...
> > wait_event_int_t-drivers_input_joystick_iforce_iforce.h.patch
> >   From: Nishanth Aravamudan <nacc@us.ibm.com>
> >   Subject: [KJ] [PATCH 13/39] input/iforce-packets: use 	wait_event_interruptible_timeout()
> >...
> 
> This patch causes two compile errors:
> 
> #ifdef CONFIG_JOYSTICK_IFORCE_USB:
> - semicolon instead of opening bracket in line 265
> 
> #ifdef CONFIG_JOYSTICK_IFORCE_232:
> - typo 'wait_event_interrutible_timeout'

Thanks for catching this, Adrian. Should be fixed below:

Description:  Use wait_event_interruptible_timeout() instead of custom
wait-queue code. The main controversy of this patch is that I do not add
to the wait-queue before checking usb_submit_urb(). I am not sure if this
will cause problems. Otherwise the code is effectively identical. Remove
the now unnecessary declaration of the waitqueue and timeout. Add the
appropriate #include to iforce.h as well.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/input/joystick/iforce/iforce-packets.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/input/joystick/iforce/iforce-packets.c	2005-01-23 15:45:03.000000000 -0800
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
+					(iforce->ctrl->status != -EINPROGRESS), HZ)) {
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
+		if (!wait_event_interruptible_timeout(iforce->wait,
+					(!iforce->expect_packet), HZ)) { 
 			iforce->expect_packet = 0;
 			return -1;
 		}

--===============21218625700454363==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21218625700454363==--
