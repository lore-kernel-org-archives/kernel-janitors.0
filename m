From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 22:48:55 +0000
Subject: [KJ] [PATCH 10/21] char/sonypi: replace schedule_timeout() with
Message-Id: <20050117224855.GP24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7294438485739847=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7294438485739847==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. In many cases, drivers sleep on a number of jiffies (1 in
this case), which varies in real time units (milliseconds, for instance) with
HZ's value. Using msleep() prevents this variance. I have assumed in this patch
that the old value of HZ (100) was assumed, hence schedule_timeout(1) would
delay for 10 msecs (equivalent therefore to msleep(10)).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/char/sonypi.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/char/sonypi.c	2005-01-16 23:44:12.000000000 -0800
@@ -286,17 +286,14 @@ static void sonypi_camera_on(void)
 
 	for (j = 5; j > 0; j--) {
 
-		while (sonypi_call2(0x91, 0x1)) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(1);
-		}
+		while (sonypi_call2(0x91, 0x1))
+			msleep(10);
 		sonypi_call1(0x93);
 
 		for (i = 400; i > 0; i--) {
 			if (sonypi_camera_ready())
 				break;
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(1);
+			msleep(10);
 		}
 		if (i)
 			break;

--===============7294438485739847==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7294438485739847==--
