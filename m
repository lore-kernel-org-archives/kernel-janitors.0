From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 21 Sep 2004 21:57:58 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/40] net/act2001-sir: replace
Message-Id: <20040921215758.GF1946@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99270984041614951=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99270984041614951==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/irda/act200l-sir.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/irda/act200l-sir.c	2004-09-14 17:17:54.000000000 -0700
@@ -177,8 +177,7 @@ static int act200l_change_speed(struct s
 
 	/* Write control bytes */
 	sirdev_raw_write(dev, control, 3);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(5));
+	msleep(5);
 
 	/* Go back to normal mode */
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);

--===============99270984041614951==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99270984041614951==--
