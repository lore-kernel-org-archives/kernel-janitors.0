From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 21:37:39 +0000
Subject: [KJ] [PATCH 37/39] usb/mdc800: use wait_event_timeout()
Message-Id: <20050121213739.GR3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26539027894868839=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26539027894868839==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
now unused variables.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/usb/image/mdc800.c	2005-01-15 16:55:42.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/usb/image/mdc800.c	2005-01-17 19:40:40.000000000 -0800
@@ -95,6 +95,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/smp_lock.h>
+#include <linux/wait.h>
 
 #include <linux/usb.h>
 #include <linux/fs.h>
@@ -346,19 +347,9 @@ static void mdc800_usb_irq (struct urb *
  */
 static int mdc800_usb_waitForIRQ (int mode, int msec)
 {
-        DECLARE_WAITQUEUE(wait, current);
-	long timeout;
-
 	mdc800->camera_request_ready=1+mode;
 
-	add_wait_queue(&mdc800->irq_wait, &wait);
-	timeout = msec*HZ/1000;
-	while (!mdc800->irq_woken && timeout)
-	{
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		timeout = schedule_timeout (timeout);
-	}
-        remove_wait_queue(&mdc800->irq_wait, &wait);
+	wait_event_timeout(mdc800->irq_wait, mdc800->irq_woken, msec*HZ/1000);
 	mdc800->irq_woken = 0;
 
 	if (mdc800->camera_request_ready>0)
@@ -704,8 +695,6 @@ static ssize_t mdc800_device_read (struc
 {
 	size_t left=len, sts=len; /* single transfer size */
 	char __user *ptr = buf;
-	long timeout;
-	DECLARE_WAITQUEUE(wait, current);
 
 	down (&mdc800->io_lock);
 	if (mdc800->state == NOT_CONNECTED)
@@ -751,14 +740,8 @@ static ssize_t mdc800_device_read (struc
 					up (&mdc800->io_lock);
 					return len-left;
 				}
-				add_wait_queue(&mdc800->download_wait, &wait);
-				timeout = TO_DOWNLOAD_GET_READY*HZ/1000;
-				while (!mdc800->downloaded && timeout)
-				{
-					set_current_state(TASK_UNINTERRUPTIBLE);
-					timeout = schedule_timeout (timeout);
-				}
-				remove_wait_queue(&mdc800->download_wait, &wait);
+				wait_event_timeout(mdc800->download_wait, mdc800->downloaded,
+										TO_DOWNLOAD_GET_READY*HZ/1000);
 				mdc800->downloaded = 0;
 				if (mdc800->download_urb->status != 0)
 				{
@@ -802,7 +785,6 @@ static ssize_t mdc800_device_read (struc
 static ssize_t mdc800_device_write (struct file *file, const char __user *buf, size_t len, loff_t *pos)
 {
 	size_t i=0;
-	DECLARE_WAITQUEUE(wait, current);
 
 	down (&mdc800->io_lock);
 	if (mdc800->state != READY)
@@ -856,7 +838,6 @@ static ssize_t mdc800_device_write (stru
 		if (mdc800->in_count == 8)
 		{
 			int answersize;
-			long timeout;
 
 			if (mdc800_usb_waitForIRQ (0,TO_GET_READY))
 			{
@@ -876,14 +857,7 @@ static ssize_t mdc800_device_write (stru
 				up (&mdc800->io_lock);
 				return -EIO;
 			}
-			add_wait_queue(&mdc800->write_wait, &wait);
-			timeout = TO_WRITE_GET_READY*HZ/1000;
-			while (!mdc800->written && timeout)
-			{
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				timeout = schedule_timeout (timeout);
-			}
-			remove_wait_queue(&mdc800->write_wait, &wait);
+			wait_event_timeout(mdc800->write_wait, mdc800->written, TO_WRITE_GET_READY*HZ/1000);
 			mdc800->written = 0;
 			if (mdc800->state == WORKING)
 			{

--===============26539027894868839==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26539027894868839==--
