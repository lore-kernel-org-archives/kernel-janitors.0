From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 23:02:42 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 10/33] char/hvc_console: replace
Message-Id: <20040915230242.GS5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26603817209885694=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26603817209885694==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/hvc_console.c	2004-09-13 17:15:50.000000000 -0700
+++ 2.6.9-rc2/drivers/char/hvc_console.c	2004-09-15 15:57:41.000000000 -0700
@@ -37,6 +37,7 @@
 #include <linux/tty_flip.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 #include <asm/hvconsole.h>
 #include <asm/vio.h>
@@ -44,7 +45,7 @@
 #define HVC_MAJOR	229
 #define HVC_MINOR	0
 
-#define TIMEOUT		((HZ + 99) / 100)
+#define TIMEOUT		(10)
 
 /*
  * Wait this long per iteration while trying to push buffered data to the
@@ -601,7 +602,7 @@ int khvcd(void *unused)
 			if (poll_mask == 0)
 				schedule();
 			else
-				schedule_timeout(TIMEOUT);
+				msleep_interruptible(TIMEOUT);
 		}
 		__set_current_state(TASK_RUNNING);
 	} while (!kthread_should_stop());

--===============26603817209885694==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26603817209885694==--
