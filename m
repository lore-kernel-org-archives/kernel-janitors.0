From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 18:02:30 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 15/16] isdn/isdnloop: add
Message-Id: <20040917180230.GP1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92401964831015826=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92401964831015826==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use set_current_state() before schedule_timeout() so that
the task delays as expected. Without the change, schedule_timeout()
returns immediately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/isdnloop/isdnloop.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/isdnloop/isdnloop.c	2004-09-17 11:00:58.000000000 -0700
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/sched.h>
 #include "isdnloop.h"
 
 static char *revision = "$Revision: 1.11.6.7 $";
@@ -1161,8 +1162,10 @@ isdnloop_command(isdn_ctrl * c, isdnloop
 						if (!card->leased) {
 							card->leased = 1;
 							while (card->ptype == ISDN_PTYPE_UNKNOWN) {
+								set_current_state(TASK_INTERRUPTIBLE);
 								schedule_timeout(10);
 							}
+							set_current_state(TASK_INTERRUPTIBLE);
 							schedule_timeout(10);
 							sprintf(cbuf, "00;FV2ON\n01;EAZ1\n02;EAZ2\n");
 							i = isdnloop_writecmd(cbuf, strlen(cbuf), 0, card);

--===============92401964831015826==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92401964831015826==--
