From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:29:03 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 10/15] isdn/hysdn_sched: replace
Message-Id: <20040917172903.GK1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70655536422093879=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70655536422093879==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/hysdn/hysdn_sched.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/hysdn/hysdn_sched.c	2004-09-17 10:27:07.000000000 -0700
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/ioport.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 
 #include "hysdn_defs.h"
@@ -160,8 +161,7 @@ hysdn_tx_cfgline(hysdn_card * card, ucha
 		if (card->debug_flags & LOG_SCHED_ASYN)
 			hysdn_addlog(card, "async tx-cfg delayed");
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((20 * HZ) / 1000);	/* Timeout 20ms */
+		msleep_interruptible(20);		/* Timeout 20ms */
 		if (!--cnt) {
 			restore_flags(flags);
 			return (-ERR_ASYNC_TIME);	/* timed out */
@@ -190,8 +190,7 @@ hysdn_tx_cfgline(hysdn_card * card, ucha
 		if (card->debug_flags & LOG_SCHED_ASYN)
 			hysdn_addlog(card, "async tx-cfg waiting for tx-ready");
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((20 * HZ) / 1000);	/* Timeout 20ms */
+		msleep_interruptible(20);		/* Timeout 20ms */
 		if (!--cnt) {
 			restore_flags(flags);
 			return (-ERR_ASYNC_TIME);	/* timed out */

--===============70655536422093879==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70655536422093879==--
