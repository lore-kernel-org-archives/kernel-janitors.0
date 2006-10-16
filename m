From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 16 Oct 2006 07:40:52 +0000
Subject: [KJ] [PATCH] drivers/serial/dz.c:
Message-Id: <1160983732.19143.420.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>

Replaced save_flags()/cli()/restore_flags() pair with spin_lock
alternatives.

For this case, I believe spin lock plays no role but I also do not have
a better way.

Tested compile only.

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
--- linux-2.6.19-rc1-orig/drivers/serial/dz.c	2006-09-21 10:15:41.000000000 +0530
+++ linux-2.6.19-rc1/drivers/serial/dz.c	2006-10-16 12:48:31.000000000 +0530
@@ -778,13 +778,13 @@ int __init dz_init(void)
 {
 	unsigned long flags;
 	int ret, i;
+	spinlock_t dz_lock = SPIN_LOCK_UNLOCKED;
 
 	printk("%s%s\n", dz_name, dz_version);
 
 	dz_init_ports();
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&dz_lock,flags);
 
 #ifndef CONFIG_SERIAL_DZ_CONSOLE
 	/* reset the chip */
@@ -794,7 +794,7 @@ int __init dz_init(void)
 	/* order matters here... the trick is that flags
 	   is updated... in request_irq - to immediatedly obliterate
 	   it is unwise. */
-	restore_flags(flags);
+	spin_unlock_irqrestore(&dz_lock,flags);
 
 	if (request_irq(dz_ports[0].port.irq, dz_interrupt,
 			IRQF_DISABLED, "DZ", &dz_ports[0]))


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
