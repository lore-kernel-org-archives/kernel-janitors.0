From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 22:08:20 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 34/38] net/tekram-sir: replace
Message-Id: <20040924220820.GS1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49991499600782285=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49991499600782285==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/irda/tekram-sir.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/irda/tekram-sir.c	2004-09-14 17:21:31.000000000 -0700
@@ -210,8 +210,7 @@ static int tekram_reset(struct sir_dev *
 	sirdev_set_dtr_rts(dev, FALSE, TRUE); 
 
 	/* Should sleep 1 ms */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(1));
+	msleep(1);
 
 	/* Set DTR, Set RTS */
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);

--===============49991499600782285==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49991499600782285==--
