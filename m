From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:12:54 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 16/38] net/irtty-sir: replace
Message-Id: <20040923221254.GA13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32231593971264783=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32231593971264783==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/irda/irtty-sir.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/irda/irtty-sir.c	2004-09-21 14:21:37.000000000 -0700
@@ -32,6 +32,7 @@
 #include <linux/init.h>
 #include <asm/uaccess.h>
 #include <linux/smp_lock.h>
+#include <linux/delay.h>
 
 #include <net/irda/irda.h>
 #include <net/irda/irda_device.h>
@@ -97,8 +98,7 @@ static void irtty_wait_until_sent(struct
 		unlock_kernel();
 	}
 	else {
-		set_task_state(current, TASK_UNINTERRUPTIBLE);
-		schedule_timeout(msecs_to_jiffies(USBSERIAL_TX_DONE_DELAY));
+		msleep(USBSERIAL_TX_DONE_DELAY);
 	}
 }
 

--===============32231593971264783==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32231593971264783==--
