From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:57:24 +0000
Subject: [Kernel-janitors] [PATCH] net/slip: replace schedule_timeout() with
Message-Id: <20040727185724.GX2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34569414405483201=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34569414405483201==
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


--- linux-vanilla/drivers/net/slip.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/net/slip.c	2004-07-12 21:43:43.000000000 +0000
@@ -1390,10 +1390,8 @@ static void __exit slip_exit(void)
 	/* First of all: check for active disciplines and hangup them.
 	 */
 	do {
-		if (busy) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ / 10);
-		}
+		if (busy)
+			msleep(100);
 
 		busy = 0;
 		for (i = 0; i < slip_maxdev; i++) {

--===============34569414405483201==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34569414405483201==--
