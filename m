From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:54:47 +0000
Subject: [Kernel-janitors] [PATCH] isdn/hysdn_sched: replace
Message-Id: <20040723205447.GI2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71659350099724684=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71659350099724684==
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

--- linux-vanilla/drivers/isdn/hysdn/hysdn_sched.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/isdn/hysdn/hysdn_sched.c	2004-07-12 18:08:12.000000000 +0000
@@ -160,8 +160,7 @@ hysdn_tx_cfgline(hysdn_card * card, ucha
 		if (card->debug_flags & LOG_SCHED_ASYN)
 			hysdn_addlog(card, "async tx-cfg delayed");
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((20 * HZ) / 1000);	/* Timeout 20ms */
+		msleep(20);
 		if (!--cnt) {
 			restore_flags(flags);
 			return (-ERR_ASYNC_TIME);	/* timed out */
@@ -190,8 +189,7 @@ hysdn_tx_cfgline(hysdn_card * card, ucha
 		if (card->debug_flags & LOG_SCHED_ASYN)
 			hysdn_addlog(card, "async tx-cfg waiting for tx-ready");
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((20 * HZ) / 1000);	/* Timeout 20ms */
+		msleep(20);
 		if (!--cnt) {
 			restore_flags(flags);
 			return (-ERR_ASYNC_TIME);	/* timed out */

--===============71659350099724684==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71659350099724684==--
