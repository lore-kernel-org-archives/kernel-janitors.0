From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 18:03:58 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 16/16] isdn/kcapi: replace
Message-Id: <20040917180358.GQ1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27742701842563711=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27742701842563711==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/isdn/capi/kcapi.c	2004-09-09 23:05:53.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/isdn/capi/kcapi.c	2004-09-13 14:11:14.000000000 -0700
@@ -24,6 +24,7 @@
 #include <linux/capi.h>
 #include <linux/kernelcapi.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 #include <linux/isdn/capicmd.h>
 #include <linux/isdn/capiutil.h>
@@ -831,8 +832,7 @@ static int old_capi_manufacturer(unsigne
 
 		while (card->cardstate != CARD_RUNNING) {
 
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ/10);	/* 0.1 sec */
+			msleep_interruptible(100);	/* 0.1 sec */
 
 			if (signal_pending(current)) {
 				capi_ctr_put(card);
@@ -856,8 +856,7 @@ static int old_capi_manufacturer(unsigne
 
 		while (card->cardstate > CARD_DETECTED) {
 
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ/10);	/* 0.1 sec */
+			msleep_interruptible(100);	/* 0.1 sec */
 
 			if (signal_pending(current))
 				return -EINTR;

--===============27742701842563711==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27742701842563711==--
