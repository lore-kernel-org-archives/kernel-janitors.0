From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:28:09 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 6/6] serial/serial_core: replace
Message-Id: <20040927212809.GG1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============042313112534564823=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============042313112534564823==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep()/msleep_interruptible() [as appropriate]
instead of schedule_timeout() to guarantee the task delays
as expected.

--- 2.6.9-rc2-vanilla/drivers/serial/serial_core.c	2004-09-13 17:15:52.000000000 -0700
+++ 2.6.9-rc2/drivers/serial/serial_core.c	2004-09-14 10:19:22.000000000 -0700
@@ -32,6 +32,7 @@
 #include <linux/smp_lock.h>
 #include <linux/device.h>
 #include <linux/serial.h> /* for serial_state and serial_icounter_struct */
+#include <linux/delay.h>
 
 #include <asm/irq.h>
 #include <asm/uaccess.h>
@@ -1287,8 +1288,7 @@ static void uart_close(struct tty_struct
 
 	if (state->info->blocked_open) {
 		if (state->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(state->close_delay);
+			msleep_interruptible(jiffies_to_msecs(state->close_delay));
 		}
 	} else if (!uart_console(port)) {
 		uart_change_pm(state, 3);
@@ -1353,8 +1353,7 @@ static void uart_wait_until_sent(struct 
 	 * we wait.
 	 */
 	while (!port->ops->tx_empty(port)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(char_time);
+		msleep_interruptible(jiffies_to_msecs(char_time));
 		if (signal_pending(current))
 			break;
 		if (time_after(jiffies, expire))
@@ -1911,10 +1910,8 @@ int uart_suspend_port(struct uart_driver
 		 * Wait for the transmitter to empty.
 		 */
 		while (!ops->tx_empty(port)) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(10*HZ/1000);
+			msleep(10);
 		}
-		set_current_state(TASK_RUNNING);
 
 		ops->shutdown(port);
 	}

--===============042313112534564823==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============042313112534564823==--
