From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 17:09:56 +0000
Subject: [Kernel-janitors] [PATCH] irda/act200l-sir: replace
Message-Id: <20040727170956.GH2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1089413497942644=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1089413497942644==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/irda/act200l-sir.c	2004-06-16 05:19:11.000000000 +0000
+++ linux-dev/drivers/net/irda/act200l-sir.c	2004-07-03 01:25:49.000000000 +0000
@@ -177,8 +177,7 @@ static int act200l_change_speed(struct s
 
 	/* Write control bytes */
 	sirdev_raw_write(dev, control, 3);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(5));
+	msleep(5);
 
 	/* Go back to normal mode */
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);

--===============1089413497942644==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1089413497942644==--
