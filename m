From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 22:54:42 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 9/33] char/generic_serial:
Message-Id: <20040915225442.GP5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24112010565932351=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24112010565932351==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/generic_serial.c	2004-09-13 17:15:49.000000000 -0700
+++ 2.6.9-rc2/drivers/char/generic_serial.c	2004-09-15 15:49:27.000000000 -0700
@@ -26,6 +26,7 @@
 #include <linux/mm.h>
 #include <linux/generic_serial.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 #include <asm/semaphore.h>
 #include <asm/uaccess.h>
 
@@ -399,8 +400,7 @@ static int gs_wait_tx_flushed (void * pt
 		gs_dprintk (GS_DEBUG_FLUSH, "Expect to finish in %d jiffies "
 			    "(%d chars).\n", jiffies_to_transmit, charsleft); 
 
-		set_current_state (TASK_INTERRUPTIBLE);
-		schedule_timeout(jiffies_to_transmit);
+		msleep_interruptible(jiffies_to_msecs(jiffies_to_transmit));
 		if (signal_pending (current)) {
 			gs_dprintk (GS_DEBUG_FLUSH, "Signal pending. Bombing out: "); 
 			rv = -EINTR;
@@ -771,8 +771,7 @@ void gs_close(struct tty_struct * tty, s
 
 	if (port->blocked_open) {
 		if (port->close_delay) {
-			set_current_state (TASK_INTERRUPTIBLE);
-			schedule_timeout(port->close_delay);
+			msleep_interruptible(jiffies_to_msecs(port->close_delay));
 		}
 		wake_up_interruptible(&port->open_wait);
 	}

--===============24112010565932351==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24112010565932351==--
