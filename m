From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 07 Jan 2005 00:14:53 +0000
Subject: [KJ] [PATCH 5/28] net/cs89x0: replace schedule_timeout() with
Message-Id: <20050107001453.GF3055@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37416428417157066=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-net@vger.kernel.org, netdev@oss.sgi.com

--===============37416428417157066==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: The existing wait is in TASK_INTERRUPTIBLE, but does not check for
signals (especially problemtic for a 30 msec wait!) as being a cause for
schedule_timeout()s return. Use msleep() instead, to guarantee the task delays
as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/net/cs89x0.c	2004-12-24 13:35:24.000000000 -0800
+++ 2.6.10/drivers/net/cs89x0.c	2005-01-04 14:57:49.000000000 -0800
@@ -136,6 +136,7 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/bitops.h>
+#include <linux/delay.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -909,8 +910,7 @@ void  __init reset_chip(struct net_devic
 	writereg(dev, PP_SelfCTL, readreg(dev, PP_SelfCTL) | POWER_ON_RESET);
 
 	/* wait 30 ms */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(30*HZ/1000);
+	msleep(30);
 
 #ifndef CONFIG_ARCH_IXDP2X01
 	if (lp->chip_type != CS8900) {

--===============37416428417157066==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37416428417157066==--
