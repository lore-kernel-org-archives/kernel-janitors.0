From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:50:02 +0000
Subject: [Kernel-janitors] [PATCH] video/c-qcam: replace schedule_timeout()
Message-Id: <20040726225002.GO1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38161154995099977=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38161154995099977==
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


--- linux-vanilla/drivers/media/video/c-qcam.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/media/video/c-qcam.c	2004-07-12 18:50:24.000000000 +0000
@@ -103,8 +103,7 @@ static unsigned int qcam_await_ready1(st
 	{
 		if (qcam_ready1(qcam) == value)
 			return 0;
-		current->state=TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
 
 	/* Probably somebody pulled the plug out.  Not much we can do. */
@@ -129,8 +128,7 @@ static unsigned int qcam_await_ready2(st
 	{
 		if (qcam_ready2(qcam) == value)
 			return 0;
-		current->state=TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
 
 	/* Probably somebody pulled the plug out.  Not much we can do. */

--===============38161154995099977==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38161154995099977==--
