From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 23:40:41 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 12/38] net/ewrk3: replace
Message-Id: <20040922234041.GL1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86424278134945398=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86424278134945398==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/ewrk3.c	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/net/ewrk3.c	2004-09-14 17:16:30.000000000 -0700
@@ -1681,8 +1681,7 @@ static int ewrk3_ethtool_ioctl(struct ne
 
 			/* Wait a little while */
 			spin_unlock_irqrestore(&lp->hw_lock, flags);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ>>2);
+			msleep(250);
 			spin_lock_irqsave(&lp->hw_lock, flags);
 
 			/* Exit if we got a signal */

--===============86424278134945398==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86424278134945398==--
