From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:49:09 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/9] usb/file_storage: replace
Message-Id: <20040927214909.GL1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60819239845400819=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60819239845400819==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
so that the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/usb/gadget/file_storage.c	2004-09-13 17:15:52.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/gadget/file_storage.c	2004-09-27 14:47:54.000000000 -0700
@@ -217,6 +217,7 @@
 #include <linux/compiler.h>
 #include <linux/completion.h>
 #include <linux/dcache.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/fcntl.h>
 #include <linux/file.h>
@@ -2280,8 +2281,7 @@ static int halt_bulk_in_endpoint(struct 
 		}
 
 		/* Wait for a short time and then try again */
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (schedule_timeout(HZ / 10) != 0)
+		if (msleep_interruptible(100) != 0)
 			return -EINTR;
 		rc = usb_ep_set_halt(fsg->bulk_in);
 	}

--===============60819239845400819==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60819239845400819==--
