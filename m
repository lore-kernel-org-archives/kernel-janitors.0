From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:55:53 +0000
Subject: [Kernel-janitors] [PATCH] isdn/isdn_tty: replace schedule_timeout()
Message-Id: <20040723205553.GJ2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84203346640030596=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84203346640030596==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/i4l/isdn_tty.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/isdn/i4l/isdn_tty.c	2004-07-21 16:56:16.000000000 +0000
@@ -13,6 +13,7 @@
 
 #include <linux/config.h>
 #include <linux/isdn.h>
+#include <linux/delay.h>
 #include "isdn_common.h"
 #include "isdn_tty.h"
 #ifdef CONFIG_ISDN_AUDIO
@@ -1756,8 +1757,7 @@ isdn_tty_close(struct tty_struct *tty, s
 	tty->closing = 0;
 	module_put(info->owner);
 	if (info->blocked_open) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/2);
+		msleep(500);
 		wake_up_interruptible(&info->open_wait);
 	}
 	info->flags &= ~(ISDN_ASYNC_NORMAL_ACTIVE | ISDN_ASYNC_CLOSING);

--===============84203346640030596==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84203346640030596==--
