From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:26:43 +0000
Subject: [KJ] [PATCH] net/ewrk3: replace schedule_timeout() with
Message-Id: <20041022232643.GC18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69534927727838625=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69534927727838625==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/net/ewrk3.c	2004-10-22 10:40:51.000000000 -0700
+++ 2.6.9-bk7/drivers/net/ewrk3.c	2004-10-22 14:56:19.000000000 -0700
@@ -1655,8 +1655,7 @@ static int ewrk3_phys_id(struct net_devi
 
 		/* Wait a little while */
 		spin_unlock_irqrestore(&lp->hw_lock, flags);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ>>2);
+		msleep(250);
 		spin_lock_irqsave(&lp->hw_lock, flags);
 
 		/* Exit if we got a signal */

--===============69534927727838625==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69534927727838625==--
