From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:18:36 +0000
Subject: [Kernel-janitors] [PATCH] irda/sir_dev: replace schedule_timeout()
Message-Id: <20040727181836.GM2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============098155744205554729=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============098155744205554729==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/irda/sir_dev.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/net/irda/sir_dev.c	2004-07-21 17:27:21.000000000 +0000
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
 

--===============098155744205554729==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============098155744205554729==--
