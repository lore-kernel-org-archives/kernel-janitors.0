From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:54 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 23/38] net/ma600-sir: replace
Message-Id: <20040923221354.GI13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27600274462667795=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27600274462667795==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/irda/ma600-sir.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/irda/ma600-sir.c	2004-09-14 17:20:00.000000000 -0700
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
 

--===============27600274462667795==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27600274462667795==--
