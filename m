From: Antoine Martin <antoine@nagafix.co.uk>
Date: Sat, 20 Jan 2007 20:31:45 +0000
Subject: [KJ] typos etc
Message-Id: <45B27C31.6070202@nagafix.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Sorry to bother, but where do I send patches for small typos, 
documentation and such?
ie:
--- linux-2.6.19.2/arch/x86_64/kernel/time.c    2006-11-29 
21:57:37.000000000 +0000
+++ fixed/arch/x86_64/kernel/time.c  2007-01-20 20:29:35.000000000 +0000
@@ -313,8 +313,8 @@

         if (lost_count = 1000 && !warned) {
                 printk(KERN_WARNING "warning: many lost ticks.\n"
-                      KERN_WARNING "Your time source seems to be 
instable or "
-                               "some driver is hogging interupts\n");
+                      KERN_WARNING "Your time source seems to be 
unstable or "
+                               "some driver is hogging interrupts\n");
                 print_symbol("rip %s\n", get_irq_regs()->rip);
                 if (vxtime.mode = VXTIME_TSC && vxtime.hpet_address) {
                         printk(KERN_WARNING "Falling back to HPET\n");

Thanks
Antoine
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
