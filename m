From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 22:52:43 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 7/9] usb/mdc800: cleanup
Message-Id: <20040927225243.GO1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94332925723478633=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94332925723478633==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: This patch cleans up the wait queue usage in this driver.
The state is no longer set until just before the task sleeps, which
removes a few set_current_state()s. Correspondingly, the state doesn't
need to be set back to TASK_RUNNING outside of the while-loops, as
schedule_timeout() takes care of it.

--- 2.6.9-rc2-vanilla/drivers/usb/image/mdc800.c	2004-09-13 17:15:54.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/image/mdc800.c	2004-09-27 15:48:54.000000000 -0700
@@ -317,7 +317,6 @@ static int mdc800_usb_waitForIRQ (int mo
 	mdc800->camera_request_ready=1+mode;
 
 	add_wait_queue(&mdc800->irq_wait, &wait);
-	set_current_state(TASK_INTERRUPTIBLE);
 	timeout = msec*HZ/1000;
 	while (!mdc800->irq_woken && timeout)
 	{
@@ -325,7 +324,6 @@ static int mdc800_usb_waitForIRQ (int mo
 		timeout = schedule_timeout (timeout);
 	}
         remove_wait_queue(&mdc800->irq_wait, &wait);
-	set_current_state(TASK_RUNNING);
 	mdc800->irq_woken = 0;
 
 	if (mdc800->camera_request_ready>0)
@@ -725,7 +723,6 @@ static ssize_t mdc800_device_read (struc
 					set_current_state(TASK_UNINTERRUPTIBLE);
 					timeout = schedule_timeout (timeout);
 				}
-				set_current_state(TASK_RUNNING);
 				remove_wait_queue(&mdc800->download_wait, &wait);
 				mdc800->downloaded = 0;
 				if (mdc800->download_urb->status != 0)
@@ -851,7 +848,6 @@ static ssize_t mdc800_device_write (stru
 				set_current_state(TASK_UNINTERRUPTIBLE);
 				timeout = schedule_timeout (timeout);
 			}
-                        set_current_state(TASK_RUNNING);
 			remove_wait_queue(&mdc800->write_wait, &wait);
 			mdc800->written = 0;
 			if (mdc800->state == WORKING)

--===============94332925723478633==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94332925723478633==--
