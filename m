From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:46:42 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/17] media/cpia: replace
Message-Id: <20040920214642.GH2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8261149365611693=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8261149365611693==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/cpia.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/cpia.c	2004-09-20 14:45:39.000000000 -0700
@@ -37,6 +37,7 @@
 #include <linux/proc_fs.h>
 #include <linux/ctype.h>
 #include <linux/pagemap.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 #include <asm/semaphore.h>
 
@@ -2886,9 +2887,7 @@ static int fetch_frame(void *data)
 				cond_resched();
 
 				/* sleep for 10 ms, hopefully ;) */
-				current->state = TASK_INTERRUPTIBLE;
-
-				schedule_timeout(10*HZ/1000);
+				msleep_interruptible(10);
 				if (signal_pending(current))
 					return -EINTR;
 
@@ -2951,8 +2950,7 @@ static int fetch_frame(void *data)
 		        		   CPIA_GRAB_SINGLE, 0, 0, 0);
 				/* FIXME: Trial & error - need up to 70ms for
 				   the grab mode change to complete ? */
-				current->state = TASK_INTERRUPTIBLE;
-				schedule_timeout(70*HZ / 1000);
+				msleep_interruptible(70);
 				if (signal_pending(current))
 					return -EINTR;
 			}
@@ -3003,8 +3001,7 @@ static int goto_high_power(struct cam_da
 {
 	if (do_command(cam, CPIA_COMMAND_GotoHiPower, 0, 0, 0, 0))
 		return -EIO;
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(40*HZ/1000);	/* windows driver does it too */
+	msleep_interruptible(40);	/* windows driver does it too */
 	if(signal_pending(current))
 		return -EINTR;
 	if (do_command(cam, CPIA_COMMAND_GetCameraStatus, 0, 0, 0, 0))
@@ -3074,10 +3071,8 @@ static int set_camera_state(struct cam_d
 	
 	/* Wait 6 frames for the sensor to get all settings and
 	   AEC/ACB to settle */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout((6*(cam->params.sensorFps.baserate ? 33 : 40) *
-	                    (1 << cam->params.sensorFps.divisor) + 10) *
-			 HZ / 1000);
+	msleep_interruptible(6*(cam->params.sensorFps.baserate ? 33 : 40) *
+			       (1 << cam->params.sensorFps.divisor) + 10);
 
 	if(signal_pending(current))
 		return -EINTR;

--===============8261149365611693==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8261149365611693==--
