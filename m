From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 18:00:49 +0000
Subject: [KJ] [PATCH 2/20] char/ite_gpio: remove
Message-Id: <20050202180049.GC2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99407176924485663=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99407176924485663==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Replace deprecated interruptible_sleep_on_timeout() function calls
with direct wait-queue usage. Patch is compile-tested, in a sense; it introduces
no warnings (driver is currently broken).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/char/ite_gpio.c	2005-01-24 09:28:32.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/char/ite_gpio.c	2005-02-01 11:26:57.000000000 -0800
@@ -43,6 +43,7 @@
 #include <asm/it8172/it8172_int.h>
 #include <linux/sched.h>
 #include <linux/ite_gpio.h>
+#include <linux/wait.h>
 
 #define ite_gpio_base 0x14013800
 
@@ -192,6 +193,7 @@ int ite_gpio_int_wait (__u32 device, __u
 {
 	int i,line=0, ret=0;
 	unsigned long flags;
+	DEFINE_WAIT(wait);
 
 	switch (device) {
 	case ITE_GPIO_PORTA:
@@ -221,7 +223,9 @@ int ite_gpio_int_wait (__u32 device, __u
 	save_flags (flags);
 	cli();
 	ite_gpio_irq_pending[i] = 1;
-	ret = interruptible_sleep_on_timeout(&ite_gpio_wait[i], 3*HZ);
+	prepare_to_wait(&ite_gpio_wait[i], &wait, TASK_INTERRUPTIBLE);
+	ret = schedule_timeout(3*HZ);
+	finish_wait(&ite_gpio_wait[i], &wait);
 	restore_flags (flags);
 	ite_gpio_irq_pending[i] = 0;
 

--===============99407176924485663==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99407176924485663==--
