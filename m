From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:43:06 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/17] media/bw-qcam: replace
Message-Id: <20040920214306.GF2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28068527231850982=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28068527231850982==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/bw-qcam.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/bw-qcam.c	2004-09-14 16:38:24.000000000 -0700
@@ -249,8 +249,7 @@ static int qc_waithand(struct qcam_devic
 			   
 			if(runs++>maxpoll)
 			{
-				current->state=TASK_INTERRUPTIBLE;
-				schedule_timeout(HZ/200);
+				msleep_interruptible(5);
 			}
 			if(runs>(maxpoll+1000)) /* 5 seconds */
 				return -1;
@@ -269,8 +268,7 @@ static int qc_waithand(struct qcam_devic
 			   
 			if(runs++>maxpoll)
 			{
-				current->state=TASK_INTERRUPTIBLE;
-				schedule_timeout(HZ/200);
+				msleep_interruptible(5);
 			}
 			if(runs++>(maxpoll+1000)) /* 5 seconds */
 				return -1;
@@ -302,8 +300,7 @@ static unsigned int qc_waithand2(struct 
 		   
 		if(runs++>maxpoll)
 		{
-			current->state=TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ/200);
+			msleep_interruptible(5);
 		}
 		if(runs++>(maxpoll+1000)) /* 5 seconds */
 			return 0;
@@ -669,8 +666,7 @@ long qc_capture(struct qcam_device * q, 
 		   time will be 240 / 200 = 1.2 seconds. The compile-time
 		   default is to yield every 4 lines. */
 		if (i >= yield) {
-			current->state=TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ/200);
+			msleep_interruptible(5);
 			yield = i + yieldlines;
 		}
 	}

--===============28068527231850982==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28068527231850982==--
