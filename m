From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 17:12:13 +0000
Subject: [Kernel-janitors] [PATCH] irda/ma600-sir: replace
Message-Id: <20040727171213.GJ2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3819681514701867=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3819681514701867==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/irda/ma600-sir.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/net/irda/ma600-sir.c	2004-07-03 01:27:22.000000000 +0000
@@ -191,8 +191,7 @@ static int ma600_change_speed(struct sir
 	sirdev_raw_write(dev, &byte, sizeof(byte));
 
 	/* Wait at least 10ms: fake wait_until_sent - 10 bits at 9600 baud*/
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(15));		/* old ma600 uses 15ms */
+	msleep(15);					/* old ma600 uses 15ms */
 
 #if 1
 	/* read-back of the control byte. ma600 is the first dongle driver
@@ -215,8 +214,7 @@ static int ma600_change_speed(struct sir
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);
 
 	/* Wait at least 10ms */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(10));
+	msleep(10);
 
 	/* dongle is now switched to the new speed */
 	dev->speed = speed;
@@ -245,13 +243,11 @@ int ma600_reset(struct sir_dev *dev)
 
 	/* Reset the dongle : set DTR low for 10 ms */
 	sirdev_set_dtr_rts(dev, FALSE, TRUE);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(10));
+	msleep(10);
 
 	/* Go back to normal mode */
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(10));
+	msleep(10);
 
 	dev->speed = 9600;      /* That's the dongle-default */
 

--===============3819681514701867==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3819681514701867==--
