From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 21:54:06 +0000
Subject: [Kernel-janitors] [PATCH] pcwd: replace schedule_timeout() with
Message-Id: <20040722215406.GK2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27330967206830969=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27330967206830969==
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

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/watchdog/pcwd.c	2004-06-16 05:18:57.000000000 +0000
+++ linux-dev/drivers/char/watchdog/pcwd.c	2004-07-12 18:06:13.000000000 +0000
@@ -867,8 +867,7 @@ static int __init pcwd_checkcard(int bas
 		/* Not an 'ff' from a floating bus, so must be a card! */
 		for (i = 0; i < 4; ++i) {
 
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ / 2);
+			msleep(500);
 
 			last_port0 = port0;
 			last_port1 = port1;

--===============27330967206830969==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27330967206830969==--
