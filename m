From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:35:28 +0000
Subject: [Kernel-janitors] [PATCH] ieee/sbp2: replace schedule_timeout() with
Message-Id: <20040722223527.GV2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============045396909191215418=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============045396909191215418==
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

Description: Use msleep() instead of schedule_timeout() to guarantee
desired timeout.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/ieee1394/sbp2.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/ieee1394/sbp2.c	2004-07-12 18:07:08.000000000 +0000
@@ -903,8 +903,7 @@ alloc_fail:
 	 * connected to the sbp2 device being removed. That host would
 	 * have a certain amount of time to relogin before the sbp2 device
 	 * allows someone else to login instead. One second makes sense. */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 
 	/*
 	 * Login to the sbp-2 device

--===============045396909191215418==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============045396909191215418==--
