From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 00:02:21 +0000
Subject: [Kernel-janitors] [PATCH] net/ewrk3: replace schedule_timeout()
Message-Id: <20040727000221.GL1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19357278022036484=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19357278022036484==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.


--- linux-vanilla/drivers/net/ewrk3.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/net/ewrk3.c	2004-07-03 01:21:15.000000000 +0000
@@ -1679,8 +1679,7 @@ static int ewrk3_ethtool_ioctl(struct ne
 
 			/* Wait a little while */
 			spin_unlock_irqrestore(&lp->hw_lock, flags);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ>>2);
+			msleep(250);
 			spin_lock_irqsave(&lp->hw_lock, flags);
 
 			/* Exit if we got a signal */

--===============19357278022036484==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19357278022036484==--
