From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 16:50:11 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/5] pcmcia/sa1100_h3600:
Message-Id: <20040927165011.GF1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29676822101389089=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29676822101389089==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/pcmcia/sa1100_h3600.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/pcmcia/sa1100_h3600.c	2004-09-27 09:49:07.000000000 -0700
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #include <asm/hardware.h>
 #include <asm/irq.h>
@@ -96,8 +97,7 @@ static void h3600_pcmcia_socket_init(str
 	set_h3600_egpio(IPAQ_EGPIO_OPT_ON);
 	clr_h3600_egpio(IPAQ_EGPIO_OPT_RESET);
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(10*HZ / 1000);
+	msleep(10);
 
 	soc_pcmcia_enable_irqs(skt, irqs, ARRAY_SIZE(irqs));
 }

--===============29676822101389089==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29676822101389089==--
