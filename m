From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 21:33:58 +0000
Subject: [KJ] [PATCH 34/39] usb/auerswald: use wait_event_timeout()
Message-Id: <20050121213358.GO3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46645233590184088=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46645233590184088==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of custom wait-queue code. There
might be a problem with returning without adding/removing to the waitqueue
before wait_event_timeout() is called. I am not sure if this is a problem or
not.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/usb/misc/auerswald.c	2005-01-15 16:55:42.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/usb/misc/auerswald.c	2005-01-21 13:32:01.000000000 -0800
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 #undef DEBUG   		/* include debug macros until it's done	*/
 #include <linux/usb.h>
 
@@ -605,7 +606,6 @@ static void auerchain_blocking_completio
 /* Starts chained urb and waits for completion or timeout */
 static int auerchain_start_wait_urb (pauerchain_t acp, struct urb *urb, int timeout, int* actual_length)
 {
-	DECLARE_WAITQUEUE (wait, current);
 	auerchain_chs_t chs;
 	int status;
 
@@ -613,26 +613,13 @@ static int auerchain_start_wait_urb (pau
 	init_waitqueue_head (&chs.wqh);
 	chs.done = 0;
 
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	add_wait_queue (&chs.wqh, &wait);
 	urb->context = &chs;
 	status = auerchain_submit_urb (acp, urb);
-	if (status) {
+	if (status)
 		/* something went wrong */
-		set_current_state (TASK_RUNNING);
-		remove_wait_queue (&chs.wqh, &wait);
 		return status;
-	}
-
-	while (timeout && !chs.done)
-	{
-		timeout = schedule_timeout (timeout);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		rmb();
-	}
 
-	set_current_state (TASK_RUNNING);
-	remove_wait_queue (&chs.wqh, &wait);
+	timeout = wait_event_timeout(chs.wqh, chs.done, timeout);
 
 	if (!timeout && !chs.done) {
 		if (urb->status != -EINPROGRESS) {	/* No callback?!! */

--===============46645233590184088==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46645233590184088==--
