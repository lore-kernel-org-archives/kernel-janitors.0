From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 21:54:22 +0000
Subject: [Kernel-janitors] [PATCH] md: replace schedule_timeout() with
Message-Id: <20040723215422.GP2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22022284371439294=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22022284371439294==
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

Description: Use schedule_timeout() instead of msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/md/md.c	2004-06-16 05:19:03.000000000 +0000
+++ linux-dev/drivers/md/md.c	2004-07-12 18:47:53.000000000 +0000
@@ -3438,8 +3438,7 @@ static void md_do_sync(mddev_t *mddev)
 		if (currspeed > sysctl_speed_limit_min) {
 			if ((currspeed > sysctl_speed_limit_max) ||
 					!is_mddev_idle(mddev)) {
-				current->state = TASK_INTERRUPTIBLE;
-				schedule_timeout(HZ/4);
+				msleep(250);
 				goto repeat;
 			}
 		}

--===============22022284371439294==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22022284371439294==--
