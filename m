From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 21:55:28 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 33/38] net/stir4200: replace
Message-Id: <20040924215528.GR1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20337726537067957=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20337726537067957==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/irda/stir4200.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/irda/stir4200.c	2004-09-14 17:21:02.000000000 -0700
@@ -684,7 +684,7 @@ static void turnaround_delay(const struc
 
 	ticks = us / (1000000 / HZ);
 	if (ticks > 0) {
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1 + ticks);
 	} else
 		udelay(us);

--===============20337726537067957==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20337726537067957==--
