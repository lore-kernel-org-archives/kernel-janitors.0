From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 21:49:58 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 31/38] net/sir_dev: replace
Message-Id: <20040924214958.GO1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89292428959306325=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89292428959306325==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/irda/sir_dev.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/irda/sir_dev.c	2004-09-21 14:08:30.000000000 -0700
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/smp_lock.h>
+#include <linux/delay.h>
 
 #include <net/irda/irda.h>
 #include <net/irda/wrapper.h>
@@ -73,8 +74,7 @@ int sirdev_raw_write(struct sir_dev *dev
 	spin_lock_irqsave(&dev->tx_lock, flags);	/* serialize with other tx operations */
 	while (dev->tx_buff.len > 0) {			/* wait until tx idle */
 		spin_unlock_irqrestore(&dev->tx_lock, flags);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(msecs_to_jiffies(10));
+		msleep(10);
 		spin_lock_irqsave(&dev->tx_lock, flags);
 	}
 

--===============89292428959306325==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89292428959306325==--
