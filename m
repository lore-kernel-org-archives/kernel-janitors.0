From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 18:05:59 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 21/33] char/riscom8: replace
Message-Id: <20040916180558.GN1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79808885271434615=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79808885271434615==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/riscom8.c	2004-09-13 17:15:49.000000000 -0700
+++ 2.6.9-rc2/drivers/char/riscom8.c	2004-09-16 11:04:02.000000000 -0700
@@ -45,6 +45,7 @@
 #include <linux/fcntl.h>
 #include <linux/major.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #include <asm/uaccess.h>
 
@@ -1114,8 +1115,7 @@ static void rc_close(struct tty_struct *
 		 */
 		timeout = jiffies+HZ;
 		while(port->IER & IER_TXEMPTY)  {
-			current->state = TASK_INTERRUPTIBLE;
- 			schedule_timeout(port->timeout);
+			msleep_interruptible(jiffies_to_msecs(port->timeout));
 			if (time_after(jiffies, timeout))
 				break;
 		}
@@ -1130,8 +1130,7 @@ static void rc_close(struct tty_struct *
 	port->tty = NULL;
 	if (port->blocked_open) {
 		if (port->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(port->close_delay);
+			msleep_interruptible(jiffies_to_msecs(port->close_delay));
 		}
 		wake_up_interruptible(&port->open_wait);
 	}

--===============79808885271434615==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79808885271434615==--
