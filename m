From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 06 Jan 2005 23:29:41 +0000
Subject: [KJ] [PATCH 2/28] net/act200l-sir: replace schedule_timeout() with
Message-Id: <20050106232941.GC3055@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85710147454898356=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85710147454898356==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. There aren't any waitqueue events in the area, so I believe
an absolute sleep should be ok.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.10-v/drivers/net/irda/act200l-sir.c	2004-12-24 13:34:30.000000000 -0800
+++ 2.6.10/drivers/net/irda/act200l-sir.c	2005-01-04 14:57:49.000000000 -0800
@@ -177,8 +177,7 @@ static int act200l_change_speed(struct s
 
 	/* Write control bytes */
 	sirdev_raw_write(dev, control, 3);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(5));
+	msleep(5);
 
 	/* Go back to normal mode */
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);

--===============85710147454898356==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85710147454898356==--
