From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 21:40:07 +0000
Subject: [KJ] [PATCH 38/39] usb/usblp: use wait_event_interruptible_timeout()
Message-Id: <20050121214007.GS3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29630798242853906=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29630798242853906==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
now unused variables.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/usb/class/usblp.c	2005-01-15 16:55:42.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/usb/class/usblp.c	2005-01-21 13:39:06.000000000 -0800
@@ -54,6 +54,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/lp.h>
+#include <linux/wait.h>
 #undef DEBUG
 #include <linux/usb.h>
 
@@ -622,10 +623,10 @@ done:
 
 static ssize_t usblp_write(struct file *file, const char __user *buffer, size_t count, loff_t *ppos)
 {
-	DECLARE_WAITQUEUE(wait, current);
 	struct usblp *usblp = file->private_data;
-	int timeout, err = 0, transfer_length = 0;
+	int err = 0, transfer_length = 0;
 	size_t writecount = 0;
+	long ret;
 
 	while (writecount < count) {
 		if (!usblp->wcomplete) {
@@ -635,21 +636,10 @@ static ssize_t usblp_write(struct file *
 				return writecount ? writecount : -EAGAIN;
 			}
 
-			timeout = USBLP_WRITE_TIMEOUT;
-			add_wait_queue(&usblp->wait, &wait);
-			while (timeout) {
-				if (signal_pending(current)) {
-					remove_wait_queue(&usblp->wait, &wait);
-					return writecount ? writecount : -EINTR;
-				}
-				set_current_state(TASK_INTERRUPTIBLE);
-				if (usblp->wcomplete) {
-					set_current_state(TASK_RUNNING);
-					break;
-				}
-				timeout = schedule_timeout(timeout);
-			}
-			remove_wait_queue(&usblp->wait, &wait);
+			ret = wait_event_interruptible_timeout(usblp->wait,
+							usblp->complete, USBLP_WRITE_TIMEOUT);
+			if (ret == -ERESTARTSYS)
+				return writecount ? writecount : -EINTR;
 		}
 
 		down (&usblp->sem);

--===============29630798242853906==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29630798242853906==--
