From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 21:48:54 +0000
Subject: [Kernel-janitors] [PATCH] macintosh/mediabay: replace
Message-Id: <20040723214854.GO2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76756147921422291=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76756147921422291==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/macintosh/mediabay.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/macintosh/mediabay.c	2004-07-12 18:46:56.000000000 +0000
@@ -686,15 +685,13 @@ static int __devinit media_bay_attach(st
 
 	/* Force an immediate detect */
 	set_mb_power(bay, 0);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(MS_TO_HZ(MB_POWER_DELAY));
+	msleep(MB_POWER_DELAY);
 	bay->content_id = MB_NO;
 	bay->last_value = bay->ops->content(bay);
 	bay->value_count = MS_TO_HZ(MB_STABLE_DELAY);
 	bay->state = mb_empty;
 	do {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(MS_TO_HZ(MB_POLL_DELAY));
+		msleep(MB_POLL_DELAY);
 		media_bay_step(i);
 	} while((bay->state != mb_empty) &&
 		(bay->state != mb_up));
@@ -719,8 +716,7 @@ static int __pmac media_bay_suspend(stru
 		bay->sleeping = 1;
 		set_mb_power(bay, 0);
 		up(&bay->lock);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(MS_TO_HZ(MB_POLL_DELAY));
+		msleep(MB_POLL_DELAY);
 		mdev->ofdev.dev.power_state = state;
 	}
 	return 0;
@@ -740,8 +736,7 @@ static int __pmac media_bay_resume(struc
 	       	/* Force MB power to 0 */
 		down(&bay->lock);
 	       	set_mb_power(bay, 0);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(MS_TO_HZ(MB_POWER_DELAY));
+		msleep(MB_POWER_DELAY);
 	       	if (bay->ops->content(bay) != bay->content_id) {
 			printk("mediabay%d: content changed during sleep...\n", bay->index);
 			up(&bay->lock);
@@ -755,8 +750,7 @@ static int __pmac media_bay_resume(struc
 	       	bay->cd_retry = 0;
 #endif
 	       	do {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(MS_TO_HZ(MB_POLL_DELAY));
+			msleep(MB_POLL_DELAY);
 	       		media_bay_step(bay->index);
 	       	} while((bay->state != mb_empty) &&
 	       		(bay->state != mb_up));

--===============76756147921422291==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76756147921422291==--
