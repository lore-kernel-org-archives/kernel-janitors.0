From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 21:41:27 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 6/38] net/cs89x0: replace
Message-Id: <20040922214127.GE1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7651231377878891=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7651231377878891==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/cs89x0.c	2004-09-13 17:15:45.000000000 -0700
+++ 2.6.9-rc2/drivers/net/cs89x0.c	2004-09-21 14:12:36.000000000 -0700
@@ -93,6 +93,7 @@
    or override something. */
 #include <linux/config.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 
 /*
  * Set this to zero to disable DMA code
@@ -909,8 +910,7 @@ void  __init reset_chip(struct net_devic
 	writereg(dev, PP_SelfCTL, readreg(dev, PP_SelfCTL) | POWER_ON_RESET);
 
 	/* wait 30 ms */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(30*HZ/1000);
+	msleep_interruptible(30);
 
 #ifndef CONFIG_ARCH_IXDP2X01
 	if (lp->chip_type != CS8900) {

--===============7651231377878891==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7651231377878891==--
