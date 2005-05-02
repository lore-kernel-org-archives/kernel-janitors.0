From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 02 May 2005 06:29:13 +0000
Subject: [KJ] [PATCH] parport/ieee1284: use human-time in sleeping logic
Message-Id: <20050502062913.GE10173@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24573405801617598=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24573405801617598==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Be a little more precise with the conversions between milliseconds and
jiffies. Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.12-rc3/drivers/parport/ieee1284.c	2005-04-29 11:03:05.000000000 -0700
+++ 2.6.12-rc3-dev/drivers/parport/ieee1284.c	2005-05-01 21:28:35.000000000 -0700
@@ -196,7 +196,7 @@ int parport_wait_peripheral(struct parpo
 		return 1;
 
 	/* 40ms of slow polling. */
-	deadline = jiffies + (HZ + 24) / 25;
+	deadline = jiffies + msecs_to_jiffies(40);
 	while (time_before (jiffies, deadline)) {
 		int ret;
 
@@ -212,13 +212,11 @@ int parport_wait_peripheral(struct parpo
 		if ((status & mask) == result)
 			return 0;
 
-		if (!ret) {
+		if (!ret)
 			/* parport_wait_event didn't time out, but the
 			 * peripheral wasn't actually ready either.
 			 * Wait for another 10ms. */
-			__set_current_state (TASK_INTERRUPTIBLE);
-			schedule_timeout ((HZ+ 99) / 100);
-		}
+			msleep_interruptible(10);
 	}
 
 	return 1;

--===============24573405801617598==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24573405801617598==--
