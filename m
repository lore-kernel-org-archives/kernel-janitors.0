From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 21:31:27 +0000
Subject: [KJ] [PATCH 33/39] usb/ati_remote: use wait_event_timeout()
Message-Id: <20050121213127.GN3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22509403171721565=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22509403171721565==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of custom wait-queue code. The
current code uses TASK_INTERRUPTIBLE but doesn't seem to care about signals
so TASK_UNINTERRUPTIBLE should be ok.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/usb/input/ati_remote.c	2005-01-15 16:55:42.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/usb/input/ati_remote.c	2005-01-17 19:36:44.000000000 -0800
@@ -94,6 +94,7 @@
 #include <linux/moduleparam.h>
 #include <linux/input.h>
 #include <linux/usb.h>
+#include <linux/wait.h>
 
 /*
  * Module and Version Information, Module Parameters
@@ -396,8 +397,6 @@ static void ati_remote_irq_out(struct ur
  */
 static int ati_remote_sendpacket(struct ati_remote *ati_remote, u16 cmd, unsigned char *data)
 {
-	DECLARE_WAITQUEUE(wait, current);
-	int timeout = HZ;	/* 1 second */
 	int retval = 0;
 	
 	/* Set up out_urb */
@@ -415,18 +414,10 @@ static int ati_remote_sendpacket(struct 
 		return retval;
 	}
 
-	set_current_state(TASK_INTERRUPTIBLE);
-	add_wait_queue(&ati_remote->wait, &wait);
-
-	while (timeout && (ati_remote->out_urb->status == -EINPROGRESS) 
-	       && !(ati_remote->send_flags & SEND_FLAG_COMPLETE)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		timeout = schedule_timeout(timeout);
-		rmb();
-	}
-
-	set_current_state(TASK_RUNNING);
-	remove_wait_queue(&ati_remote->wait, &wait);
+	wait_event_timeout(ati_remote->wait,
+		((ati_remote->out_urb->status != -EINPROGRESS) ||
+		 	(ati_remote->send_flags & SEND_FLAG_COMPLETE)),
+		HZ);
 	usb_kill_urb(ati_remote->out_urb);
 	
 	return retval;

--===============22509403171721565==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22509403171721565==--
