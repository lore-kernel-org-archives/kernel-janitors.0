From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:18:48 +0000
Subject: [Kernel-janitors] [PATCH] video/sa1100fb: replace
Message-Id: <20040727231848.GQ4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52380106165452411=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52380106165452411==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/video/sa1100fb.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/video/sa1100fb.c	2004-07-06 01:16:24.000000000 +0000
@@ -1291,8 +1291,7 @@ static void sa1100fb_enable_controller(s
 #error Where is GPIO24 set as an output?  Can we fit this in somewhere else?
 	if (machine_is_graphicsclient()) {
 		// From ADS doc again...same as disable
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(20 * HZ / 1000);
+		msleep(20);
 		GPSR |= GPIO_GPIO24;
 	}
 #endif
@@ -1327,8 +1326,7 @@ static void sa1100fb_disable_controller(
 		 * We'll wait 20msec.
 		 */
 		GPCR |= GPIO_GPIO24;
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(20 * HZ / 1000);
+		msleep(20);
 	}
 #endif
 #ifdef CONFIG_SA1100_HUW_WEBPANEL

--===============52380106165452411==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52380106165452411==--
