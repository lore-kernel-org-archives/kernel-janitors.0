From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:59:00 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 14/16] isdn/isdn_tty: replace
Message-Id: <20040917175900.GO1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63749623445270576=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63749623445270576==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2. Also, there will be one more patch than I
expected (hence the total just went up by one in this series).

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/i4l/isdn_tty.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/i4l/isdn_tty.c	2004-09-17 10:57:47.000000000 -0700
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
+		msleep_interruptible(500);
 		wake_up_interruptible(&info->open_wait);
 	}
 	info->flags &= ~(ISDN_ASYNC_NORMAL_ACTIVE | ISDN_ASYNC_CLOSING);

--===============63749623445270576==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63749623445270576==--
