From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:49:10 +0000
Subject: [Kernel-janitors] [PATCH] video/bw-qcam: replace schedule_timeout()
Message-Id: <20040726224910.GN1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37091050227398803=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37091050227398803==
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


--- linux-vanilla/drivers/media/video/bw-qcam.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/media/video/bw-qcam.c	2004-07-12 18:50:05.000000000 +0000
@@ -248,10 +248,7 @@ static int qc_waithand(struct qcam_devic
 			   response. */
 			   
 			if(runs++>maxpoll)
-			{
-				current->state=TASK_INTERRUPTIBLE;
-				schedule_timeout(HZ/200);
-			}
+				msleep(5);
 			if(runs>(maxpoll+1000)) /* 5 seconds */
 				return -1;
 		}
@@ -268,10 +265,7 @@ static int qc_waithand(struct qcam_devic
 			   response. */
 			   
 			if(runs++>maxpoll)
-			{
-				current->state=TASK_INTERRUPTIBLE;
-				schedule_timeout(HZ/200);
-			}
+				msleep(5);
 			if(runs++>(maxpoll+1000)) /* 5 seconds */
 				return -1;
 		}
@@ -301,10 +295,7 @@ static unsigned int qc_waithand2(struct 
 		   response. */
 		   
 		if(runs++>maxpoll)
-		{
-			current->state=TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ/200);
-		}
+			msleep(5);
 		if(runs++>(maxpoll+1000)) /* 5 seconds */
 			return 0;
 	}
@@ -669,8 +660,7 @@ long qc_capture(struct qcam_device * q, 
 		   time will be 240 / 200 = 1.2 seconds. The compile-time
 		   default is to yield every 4 lines. */
 		if (i >= yield) {
-			current->state=TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ/200);
+			msleep(5);
 			yield = i + yieldlines;
 		}
 	}

--===============37091050227398803==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37091050227398803==--
