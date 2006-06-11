From: Matthew Martin <lihnucks@gmail.com>
Date: Sun, 11 Jun 2006 23:13:16 +0000
Subject: [KJ] [PATCH] Add KERN constants to arch/i386/kernel/cpu/rise.c
Message-Id: <448CA38C.1050602@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
    This adds KERN constants to arch/i386/kernel/cpu/rise.c

Signed-Off-By: Matthew Martin <lihnucks@gmail.com>
---


--- vanilla-linux-2.6.16/arch/i386/kernel/cpu/rise.c	2006-03-19 23:53:29.000000000 -0600
+++ linux-2.6.16/arch/i386/kernel/cpu/rise.c	2006-06-09 18:45:17.000000000 -0500
@@ -7,9 +7,9 @@
 
 static void __init init_rise(struct cpuinfo_x86 *c)
 {
-	printk("CPU: Rise iDragon");
+	printk(KERN_INFO "CPU: Rise iDragon");
 	if (c->x86_model > 2)
-		printk(" II");
+		printk(KERN_INFO " II");
 	printk("\n");
 
 	/* Unhide possibly hidden capability flags



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
