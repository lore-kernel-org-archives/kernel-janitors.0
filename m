From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:30:00 +0000
Subject: [Kernel-janitors] [PATCH] net/ns83820: replace schedule_timeout()
Message-Id: <20040727183000.GR2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============084679162845040512=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============084679162845040512==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/ns83820.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/net/ns83820.c	2004-07-08 20:58:27.000000000 +0000
@@ -1959,7 +1959,7 @@ static int __devinit ns83820_init_one(st
 		printk(KERN_INFO "%s: resetting phy\n", ndev->name);
 		writel(dev->CFG_cache | CFG_PHY_RST, dev->base + CFG);
 		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((HZ+99)/100);
+		schedule_timeout(10);
 		writel(dev->CFG_cache, dev->base + CFG);
 	}
 

--===============084679162845040512==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============084679162845040512==--
