From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 22:40:50 +0000
Subject: [KJ] [PATCH 17/20] media/zoran_card: remove
Message-Id: <20050202224050.GW2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92787309660794004=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92787309660794004==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Remove deprecated interruptible_sleep_on_timeout() function calls
and replace with direct wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/media/video/zoran_card.c	2005-01-24 09:34:08.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/media/video/zoran_card.c	2005-01-27 11:39:11.000000000 -0800
@@ -41,6 +41,7 @@
 #include <linux/spinlock.h>
 #include <linux/sem.h>
 #include <linux/kmod.h>
+#include <linux/wait.h>
 
 #include <linux/pci.h>
 #include <linux/interrupt.h>
@@ -968,6 +969,7 @@ zoran_open_init_params (struct zoran *zr
 static void __devinit
 test_interrupts (struct zoran *zr)
 {
+	DEFINE_WAIT(wait);
 	int timeout, icr;
 
 	clear_interrupt_counters(zr);
@@ -975,7 +977,9 @@ test_interrupts (struct zoran *zr)
 	zr->testing = 1;
 	icr = btread(ZR36057_ICR);
 	btwrite(0x78000000 | ZR36057_ICR_IntPinEn, ZR36057_ICR);
-	timeout = interruptible_sleep_on_timeout(&zr->test_q, 1 * HZ);
+	prepare_to_wait(&zr->test_q, &wait, TASK_INTERRUPTIBLE);
+	timeout = schedule_timeout(HZ);
+	finish_wait(&zr->test_q, &wait);
 	btwrite(0, ZR36057_ICR);
 	btwrite(0x78000000, ZR36057_ISR);
 	zr->testing = 0;

--===============92787309660794004==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92787309660794004==--
