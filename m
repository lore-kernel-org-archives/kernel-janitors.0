From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:34 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 24/38] net/mac89x0: replace
Message-Id: <20040923221334.GH13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047664039970011007=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============047664039970011007==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/mac89x0.c	2004-09-13 17:15:45.000000000 -0700
+++ 2.6.9-rc2/drivers/net/mac89x0.c	2004-09-23 14:49:25.000000000 -0700
@@ -98,6 +98,7 @@ static char *version =
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
+#include <linux/delay.h>
 
 #include <asm/system.h>
 #include <asm/bitops.h>
@@ -308,8 +309,7 @@ void __init reset_chip(struct net_device
 	writereg(dev, PP_SelfCTL, readreg(dev, PP_SelfCTL) | POWER_ON_RESET);
 
 	/* wait 30 ms */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(30*HZ/1000);
+	msleep_interruptible(30);
 
 	/* Wait until the chip is reset */
 	reset_start_time = jiffies;

--===============047664039970011007==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047664039970011007==--
