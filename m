From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 21:50:22 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 31/33] char/tpqic02: replace
Message-Id: <20040916215021.GY1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19367406999353176=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19367406999353176==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/tpqic02.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/tpqic02.c	2004-09-10 11:34:17.000000000 -0700
@@ -554,10 +554,9 @@ static int wait_for_ready(time_t timeout
 	    /* not ready and no exception && timeout not expired yet */
 	while (((stat = inb_p(QIC02_STAT_PORT) & QIC02_STAT_MASK) == QIC02_STAT_MASK) && time_before(jiffies, spin_t)) {
 		/* be `nice` to other processes on long operations... */
-		current->state = TASK_INTERRUPTIBLE;
 		/* nap 0.30 sec between checks, */
 		/* but could be woken up earlier by signals... */
-		schedule_timeout(3 * HZ / 10);
+		msleep_interruptible(300);
 	}
 
 	/* don't use jiffies for this test because it may have changed by now */

--===============19367406999353176==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19367406999353176==--
