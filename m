From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:04:14 +0000
Subject: [Kernel-janitors] [PATCH] serial/serial_core: replace
Message-Id: <20040727230414.GH4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9814511950332574=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9814511950332574==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/serial/serial_core.c	2004-06-15 22:19:01.000000000 -0700
+++ linux-dev/drivers/serial/serial_core.c	2004-07-27 16:03:24.000000000 -0700
@@ -32,6 +32,7 @@
 #include <linux/smp_lock.h>
 #include <linux/device.h>
 #include <linux/serial.h> /* for serial_state and serial_icounter_struct */
+#include <linux/delay.h>
 
 #include <asm/irq.h>
 #include <asm/uaccess.h>
@@ -1910,11 +1911,8 @@ int uart_suspend_port(struct uart_driver
 		/*
 		 * Wait for the transmitter to empty.
 		 */
-		while (!ops->tx_empty(port)) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(10*HZ/1000);
-		}
-		set_current_state(TASK_RUNNING);
+		while (!ops->tx_empty(port))
+			msleep(10);
 
 		ops->shutdown(port);
 	}

--===============9814511950332574==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9814511950332574==--
