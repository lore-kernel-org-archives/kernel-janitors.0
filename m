From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 19:00:41 +0000
Subject: [Kernel-janitors] [PATCH] net/sungem: replace schedule_timeout()
Message-Id: <20040727190041.GZ2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36768785553742855=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36768785553742855==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/sungem.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/net/sungem.c	2004-07-03 01:39:54.000000000 +0000
@@ -2020,8 +2020,7 @@ static void gem_stop_phy(struct gem *gp)
 	/* Let the chip settle down a bit, it seems that helps
 	 * for sleep mode on some models
 	 */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/100);
+	msleep(10);
 
 	/* Make sure we aren't polling PHY status change. We
 	 * don't currently use that feature though
@@ -2039,8 +2038,7 @@ static void gem_stop_phy(struct gem *gp)
 		 * dont wait a bit here, looks like the chip takes
 		 * some time to really shut down
 		 */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 	}
 
 	writel(0, gp->regs + MAC_TXCFG);

--===============36768785553742855==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36768785553742855==--
