From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 17:11:30 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 16/33] char/lcd: replace
Message-Id: <20040916171130.GI1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80042899733113027=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80042899733113027==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/lcd.c	2004-09-13 17:15:49.000000000 -0700
+++ 2.6.9-rc2/drivers/char/lcd.c	2004-09-16 10:08:09.000000000 -0700
@@ -24,6 +24,7 @@
 #include <linux/mc146818rtc.h>
 #include <linux/netdevice.h>
 #include <linux/sched.h>
+#include <linux/delay.h>
 
 #include <asm/io.h>
 #include <asm/uaccess.h>
@@ -583,8 +584,7 @@ static long lcd_read(struct inode *inode
 	lcd_waiters++;
 	while (((buttons_now = (long) button_pressed()) == 0) &&
 	       !(signal_pending(current))) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(2 * HZ);
+		msleep_interruptible(2000);
 	}
 	lcd_waiters--;
 

--===============80042899733113027==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80042899733113027==--
