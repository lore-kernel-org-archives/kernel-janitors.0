From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:25:16 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/6] serial/mcfserial: replace
Message-Id: <20040927212516.GE1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19722970812824192=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19722970812824192==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected. Use set_current_state() instead
of direct assignment of current->state.

--- 2.6.9-rc2-vanilla/drivers/serial/mcfserial.c	2004-09-13 17:15:52.000000000 -0700
+++ 2.6.9-rc2/drivers/serial/mcfserial.c	2004-09-27 14:23:12.000000000 -0700
@@ -34,6 +34,7 @@
 #include <linux/serialP.h>
 #include <linux/console.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -997,7 +998,7 @@ static void send_break(	struct mcf_seria
 
 	if (!info->addr)
 		return;
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	uartp = info->addr;
 
 	local_irq_save(flags);
@@ -1247,8 +1248,7 @@ static void mcfrs_close(struct tty_struc
 	}
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -1313,8 +1313,7 @@ mcfrs_wait_until_sent(struct tty_struct 
 			fifo_cnt++;
 		if (fifo_cnt == 0)
 			break;
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(char_time);
+		msleep_interruptible(jiffies_to_msecs(char_time));
 		if (signal_pending(current))
 			break;
 		if (timeout && time_after(jiffies, orig_jiffies + timeout))

--===============19722970812824192==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19722970812824192==--
