From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:29:00 +0000
Subject: [KJ] [PATCH 12/20] i2c/i2c-ite: remove
Message-Id: <20050202192900.GO2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============09789117486052179=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============09789117486052179==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Replace deprecated interruptible_sleep_on_timeout() with direct
wait-queue usage. Patch is compile-tested, sort of; the driver does not build in
vanilla kernel either, but I don't seem to add any warnings..

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/i2c/busses/i2c-ite.c	2005-01-24 09:28:30.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/i2c/busses/i2c-ite.c	2005-01-27 11:37:59.000000000 -0800
@@ -40,6 +40,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 
@@ -107,7 +108,7 @@ static int iic_ite_getclock(void *data)
  * IIC controller interrupts.
  */
 static void iic_ite_waitforpin(void) {
-
+   DEFINE_WAIT(wait);
    int timeout = 2;
    long flags;
 
@@ -121,13 +122,15 @@ static void iic_ite_waitforpin(void) {
 	spin_lock_irqsave(&lock, flags);
 	if (iic_pending == 0) {
 		spin_unlock_irqrestore(&lock, flags);
-		if (interruptible_sleep_on_timeout(&iic_wait, timeout*HZ)) {
+		prepare_to_wait(&iic_wait, &wait, TASK_INTERRUPTIBLE);
+		if (schedule_timeout(timeout*HZ)) {
 			spin_lock_irqsave(&lock, flags);
 			if (iic_pending == 1) {
 				iic_pending = 0;
 			}
 			spin_unlock_irqrestore(&lock, flags);
 		}
+		finish_wait(&iic_wait, &wait);
 	} else {
 		iic_pending = 0;
 		spin_unlock_irqrestore(&lock, flags);

--===============09789117486052179==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============09789117486052179==--
