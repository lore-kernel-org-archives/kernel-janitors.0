From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 18 Jan 2005 00:27:03 +0000
Subject: [KJ] [PATCH 21/21] usb/cypress_m8: replace schedule_timeout() with
Message-Id: <20050118002703.GD24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52056824984745664=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52056824984745664==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code is not incorrect. Using msleep(), though,
encourages specifying time delays in human time-units and consistency across the
kernel.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/usb/serial/cypress_m8.c	2005-01-15 16:55:42.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/usb/serial/cypress_m8.c	2005-01-17 00:17:27.000000000 -0800
@@ -49,9 +49,10 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
-#include <asm/uaccess.h>
 #include <linux/usb.h>
 #include <linux/serial.h>
+#include <linux/delay.h>
+#include <asm/uaccess.h>
 
 #ifdef CONFIG_USB_SERIAL_DEBUG
 	static int debug = 1;
@@ -916,8 +917,7 @@ static void cypress_set_termios (struct 
 	cypress_serial_control(port, baud_mask, data_bits, stop_bits, parity_enable,
 			       parity_type, 0, CYPRESS_SET_CONFIG);
 
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(50*HZ/1000); /* give some time between change and read (50ms) */ 
+	msleep(50);			/* give some time between change and read (50ms) */
 
 	/* we perform a CYPRESS_GET_CONFIG so that the current settings are filled into the private structure
          * this should confirm that all is working if it returns what we just set */

--===============52056824984745664==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52056824984745664==--
