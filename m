From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 22:58:55 +0000
Subject: [KJ] [PATCH 19/20] bluetooth/bluecard_cs: remove
Message-Id: <20050202225855.GY2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79348783814502277=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79348783814502277==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Remove deprecated interruptible_sleep_on_timeout() function calls
and replace with direct wait-queue usage. Some naming conflicts occurred, which
I tried to resolve appropriately. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/bluetooth/bluecard_cs.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/bluetooth/bluecard_cs.c	2005-02-02 14:57:24.000000000 -0800
@@ -35,6 +35,7 @@
 #include <linux/ioport.h>
 #include <linux/spinlock.h>
 #include <linux/moduleparam.h>
+#include <linux/wait.h>
 
 #include <linux/skbuff.h>
 #include <asm/io.h>
@@ -289,8 +290,8 @@ static void bluecard_write_wakeup(blueca
 		clear_bit(ready_bit, &(info->tx_state));
 
 		if (skb->pkt_type & 0x80) {
-
-			wait_queue_head_t wait;
+			DEFINE_WAIT(wait);
+			wait_queue_head_t wq;
 			unsigned char baud_reg;
 
 			switch (skb->pkt_type) {
@@ -311,8 +312,9 @@ static void bluecard_write_wakeup(blueca
 			}
 
 			/* Wait until the command reaches the baseband */
-			init_waitqueue_head(&wait);
-			interruptible_sleep_on_timeout(&wait, HZ / 10);
+			prepare_to_wait(&wq, &wait, TASK_INTERRUPTIBLE);
+			schedule_timeout(HZ/10);
+			finish_wait(&wq, &wait);
 
 			/* Set baud on baseband */
 			info->ctrl_reg &= ~0x03;
@@ -324,8 +326,9 @@ static void bluecard_write_wakeup(blueca
 			outb(info->ctrl_reg, iobase + REG_CONTROL);
 
 			/* Wait before the next HCI packet can be send */
-			interruptible_sleep_on_timeout(&wait, HZ);
-
+			prepare_to_wait(&wq, &wait, TASK_INTERRUPTIBLE);
+			schedule_timeout(HZ);
+			finish_wait(&wq, &wait);
 		}
 
 		if (len == skb->len) {

--===============79348783814502277==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79348783814502277==--
