From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 22:55:48 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 9/9] usb/uss720: replace
Message-Id: <20040927225548.GQ1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39915142680778803=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39915142680778803==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/usb/misc/uss720.c	2004-09-13 17:15:54.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/misc/uss720.c	2004-09-27 15:54:53.000000000 -0700
@@ -44,6 +44,7 @@
 #include <linux/parport.h>
 #include <linux/init.h>
 #include <linux/usb.h>
+#include <linux/delay.h>
 
 /*
  * Version Information
@@ -159,8 +160,7 @@ static int change_mode(struct parport *p
 				if (time_after_eq (jiffies, expire))
 					/* The FIFO is stuck. */
 					return -EBUSY;
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout((HZ + 99) / 100);
+				msleep_interruptible(10);
 				if (signal_pending (current))
 					break;
 			}

--===============39915142680778803==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39915142680778803==--
