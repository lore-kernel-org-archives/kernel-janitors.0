From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 17:15:22 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 18/33] char/mxser: replace
Message-Id: <20040916171522.GK1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98873287525020315=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98873287525020315==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/mxser.c	2004-09-13 17:15:50.000000000 -0700
+++ 2.6.9-rc2/drivers/char/mxser.c	2004-09-16 10:14:40.000000000 -0700
@@ -59,6 +59,7 @@
 #include <linux/smp_lock.h>
 #include <linux/pci.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -820,8 +821,7 @@ static void mxser_close(struct tty_struc
 	info->tty = NULL;
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}

--===============98873287525020315==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98873287525020315==--
