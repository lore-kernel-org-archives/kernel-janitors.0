From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 22:35:43 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 6/33] char/esp: replace
Message-Id: <20040915223543.GK5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97685396003683911=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97685396003683911==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/esp.c	2004-09-13 17:15:48.000000000 -0700
+++ 2.6.9-rc2/drivers/char/esp.c	2004-09-15 15:32:51.000000000 -0700
@@ -57,6 +57,7 @@
 #include <linux/ioport.h>
 #include <linux/mm.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -2073,8 +2074,7 @@ static void rs_close(struct tty_struct *
 
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -2105,8 +2105,7 @@ static void rs_wait_until_sent(struct tt
 
 	while ((serial_in(info, UART_ESI_STAT1) != 0x03) ||
 		(serial_in(info, UART_ESI_STAT2) != 0xff)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(char_time);
+		msleep_interruptible(jiffies_to_msecs(char_time));
 
 		if (signal_pending(current))
 			break;

--===============97685396003683911==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97685396003683911==--
