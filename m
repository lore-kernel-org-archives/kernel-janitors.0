From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:24:24 +0000
Subject: [KJ] [PATCH] w1/dscore: replace schedule_timeout() with
Message-Id: <20041022232424.GB18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78903391882311968=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78903391882311968==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Uses msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/w1/dscore.c	2004-10-22 10:41:43.000000000 -0700
+++ 2.6.9-bk7/drivers/w1/dscore.c	2004-10-22 16:00:46.000000000 -0700
@@ -733,10 +733,8 @@ void ds_disconnect(struct usb_interface 
 	while (atomic_read(&dev->refcnt)) {
 		printk(KERN_INFO "Waiting for DS to become free: refcnt=%d.\n",
 				atomic_read(&dev->refcnt));
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ);
 
-		if (signal_pending(current))
+		if (msleep_interruptible(1000))
 			flush_signals(current);
 	}
 

--===============78903391882311968==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78903391882311968==--
