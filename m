From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:56:30 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 13/15] isdn/init: replace
Message-Id: <20040917175630.GN1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97370981894564057=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97370981894564057==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected. Also uses msecs_to_jiffies()
instead of removed macro milliseconds().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/sc/init.c	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/sc/init.c	2004-09-17 10:54:58.000000000 -0700
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 #include "includes.h"
 #include "hardware.h"
 #include "card.h"
@@ -167,8 +168,7 @@ static int __init sc_init(void)
 		if(do_reset) {
 			pr_debug("Doing a SAFE probe reset\n");
 			outb(0xFF, io[b] + RESET_OFFSET);
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(milliseconds(10000));
+			msleep_interruptible(msecs_to_jiffies(10000));
 		}
 		pr_debug("RAM Base for board %d is 0x%x, %s probe\n", b, ram[b],
 			ram[b] == 0 ? "will" : "won't");
@@ -500,8 +500,7 @@ int identify_board(unsigned long rambase
 	 * Try to identify a PRI card
 	 */
 	outb(PRI_BASEPG_VAL, pgport);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep_interruptible(1000);
 	sig = readl(rambase + SIG_OFFSET);
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)
@@ -511,8 +510,7 @@ int identify_board(unsigned long rambase
 	 * Try to identify a PRI card
 	 */
 	outb(BRI_BASEPG_VAL, pgport);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep_interruptible(1000);
 	sig = readl(rambase + SIG_OFFSET);
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)

--===============97370981894564057==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97370981894564057==--
