From: acripps <acripps@gmail.com>
Date: Mon, 16 Jul 2007 14:06:03 +0000
Subject: [KJ] [third][PATCH 1/4][2.6 drivers/net/irda/actisys-sir.c:]replace
Message-Id: <20070716141803.30653.48505.sendpatchset@shcherbakov.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

this is a simple patch to remove the MAX_SPEEDS macro in favor of the more
generic ARRAY_SIZE(arr) macro defined in kernel.h

Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>

diff --git a/drivers/net/irda/actisys-sir.c b/drivers/net/irda/actisys-sir.c
index 9715ab5..cf47a46 100644
--- a/drivers/net/irda/actisys-sir.c
+++ b/drivers/net/irda/actisys-sir.c
@@ -43,6 +43,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/init.h>
+#include <linux/kernel.h>
 
 #include <net/irda/irda.h>
 
@@ -67,8 +68,6 @@ static int actisys_reset(struct sir_dev *);
 /* Note : the 220L doesn't support 38400, but we will fix that below */
 static unsigned baud_rates[] = { 9600, 19200, 57600, 115200, 38400 };
 
-#define MAX_SPEEDS (sizeof(baud_rates)/sizeof(baud_rates[0]))
-
 static struct dongle_driver act220l = {
 	.owner		= THIS_MODULE,
 	.driver_name	= "Actisys ACT-220L",
@@ -176,7 +175,7 @@ static int actisys_change_speed(struct sir_dev *dev, unsigned speed)
 	 * Now, we can set the speed requested. Send RTS pulses until we
          * reach the target speed 
 	 */
-	for (i = 0; i < MAX_SPEEDS; i++) {
+	for (i = 0; i < ARRAY_SIZE(baud_rates); i++) {
 		if (speed = baud_rates[i]) {
 			dev->speed = speed;
 			break;
@@ -191,7 +190,7 @@ static int actisys_change_speed(struct sir_dev *dev, unsigned speed)
 	}
 
 	/* Check if life is sweet... */
-	if (i >= MAX_SPEEDS) {
+	if (i >= ARRAY_SIZE(baud_rates)) {
 		actisys_reset(dev);
 		ret = -EINVAL;  /* This should not happen */
 	}
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
