From: Matthew Martin <lihnucks@gmail.com>
Date: Mon, 12 Jun 2006 14:11:08 +0000
Subject: [KJ] [PATCH] Add KERN constant in arch/i386/kernel/cpu/rise.c
Message-Id: <448D75FC.30200@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
    This adds a KERN constant in the file arch/i386/kernel/cpu/rise.c

Signed-off-by: Matthew Martin <lihnucks@gmail.com>
---

--- vanilla-linux-2.6.16/arch/i386/kernel/cpu/rise.c	2006-03-19 23:53:29.000000000 -0600
+++ linux-2.6.16/arch/i386/kernel/cpu/rise.c	2006-06-12 09:00:16.000000000 -0500
@@ -7,7 +7,7 @@
 
 static void __init init_rise(struct cpuinfo_x86 *c)
 {
-	printk("CPU: Rise iDragon");
+	printk(KERN_INFO "CPU: Rise iDragon");
 	if (c->x86_model > 2)
 		printk(" II");
 	printk("\n");


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
