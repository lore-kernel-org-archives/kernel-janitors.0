From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:12:57 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/6] serial/68328serial: replace
Message-Id: <20040927211257.GA1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27880517826848839=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27880517826848839==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/serial/68328serial.c	2004-09-13 17:15:52.000000000 -0700
+++ 2.6.9-rc2/drivers/serial/68328serial.c	2004-09-27 14:10:54.000000000 -0700
@@ -34,6 +34,7 @@
 #include <linux/keyboard.h>
 #include <linux/init.h>
 #include <linux/pm.h>
+#include <linux/delay.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -1011,7 +1012,7 @@ static void send_break(	struct m68k_seri
         unsigned long flags;
         if (!info->port)
                 return;
-        current->state = TASK_INTERRUPTIBLE;
+        set_current_state(TASK_INTERRUPTIBLE);
         save_flags(flags);
         cli();
 #ifdef USE_INTS	
@@ -1200,8 +1201,7 @@ static void rs_close(struct tty_struct *
 	}
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}

--===============27880517826848839==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27880517826848839==--
