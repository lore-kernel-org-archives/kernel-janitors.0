From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:19:18 +0000
Subject: [Kernel-janitors] [PATCH] irda/tekram-sir: replace
Message-Id: <20040727181918.GN2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29182589230739886=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29182589230739886==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/irda/tekram-sir.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/net/irda/tekram-sir.c	2004-07-03 01:27:46.000000000 +0000
@@ -210,8 +210,7 @@ static int tekram_reset(struct sir_dev *
 	sirdev_set_dtr_rts(dev, FALSE, TRUE); 
 
 	/* Should sleep 1 ms */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(1));
+	msleep(1);
 
 	/* Set DTR, Set RTS */
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);

--===============29182589230739886==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29182589230739886==--
