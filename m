From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:43:35 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/17] media/c-qcam: replace
Message-Id: <20040920214335.GG2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16885391006423056=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16885391006423056==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/c-qcam.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/c-qcam.c	2004-09-14 16:38:45.000000000 -0700
@@ -103,8 +103,7 @@ static unsigned int qcam_await_ready1(st
 	{
 		if (qcam_ready1(qcam) == value)
 			return 0;
-		current->state=TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 	}
 
 	/* Probably somebody pulled the plug out.  Not much we can do. */
@@ -129,8 +128,7 @@ static unsigned int qcam_await_ready2(st
 	{
 		if (qcam_ready2(qcam) == value)
 			return 0;
-		current->state=TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 	}
 
 	/* Probably somebody pulled the plug out.  Not much we can do. */

--===============16885391006423056==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16885391006423056==--
