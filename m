From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:10 +0000
Subject: [KJ] [PATCH] 24/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214810.15055.3346.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index fd467b2..15d17c0 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -1898,55 +1898,55 @@ #endif
 void __init SMC37c669_display_device_info ( void )
 {
     if ( SMC37c669_is_device_enabled( SERIAL_0 ) ) {
-    	printk( "  Serial 0:    Enabled [ Port 0x%x, IRQ %d ]\n",
+    	pr_info("  Serial 0:    Enabled [ Port 0x%x, IRQ %d ]\n",
 		 local_config[ SERIAL_0 ].port1,
 		 local_config[ SERIAL_0 ].irq
 	);
     }
     else {
-    	printk( "  Serial 0:    Disabled\n" );
+    	pr_info( "  Serial 0:    Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( SERIAL_1 ) ) {
-    	printk( "  Serial 1:    Enabled [ Port 0x%x, IRQ %d ]\n",
+    	pr_info("  Serial 1:    Enabled [ Port 0x%x, IRQ %d ]\n",
 		 local_config[ SERIAL_1 ].port1,
 		 local_config[ SERIAL_1 ].irq
 	);
     }
     else {
-    	printk( "  Serial 1:    Disabled\n" );
+    	pr_info("  Serial 1:    Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( PARALLEL_0 ) ) {
-    	printk( "  Parallel:    Enabled [ Port 0x%x, IRQ %d/%d ]\n",
+    	pr_info("  Parallel:    Enabled [ Port 0x%x, IRQ %d/%d ]\n",
 		 local_config[ PARALLEL_0 ].port1,
 		 local_config[ PARALLEL_0 ].irq,
 		 local_config[ PARALLEL_0 ].drq
 	);
     }
     else {
-    	printk( "  Parallel:    Disabled\n" );
+    	pr_info("  Parallel:    Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( FLOPPY_0 ) ) {
-    	printk( "  Floppy Ctrl: Enabled [ Port 0x%x, IRQ %d/%d ]\n",
+    	pr_info("  Floppy Ctrl: Enabled [ Port 0x%x, IRQ %d/%d ]\n",
 		 local_config[ FLOPPY_0 ].port1,
 		 local_config[ FLOPPY_0 ].irq,
 		 local_config[ FLOPPY_0 ].drq
 	);
     }
     else {
-    	printk( "  Floppy Ctrl: Disabled\n" );
+    	pr_info("  Floppy Ctrl: Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( IDE_0 ) ) {
-    	printk( "  IDE 0:       Enabled [ Port 0x%x, IRQ %d ]\n",
+    	pr_info("  IDE 0:       Enabled [ Port 0x%x, IRQ %d ]\n",
 		 local_config[ IDE_0 ].port1,
 		 local_config[ IDE_0 ].irq
 	);
     }
     else {
-    	printk( "  IDE 0:       Disabled\n" );
+    	pr_info("  IDE 0:       Disabled\n" );
     }
 }
 
@@ -2452,7 +2452,7 @@ SMC37c669_dump_registers(void)
 {
   int i;
   for (i = 0; i <= 0x29; i++)
-    printk("-- CR%02x : %02x\n", i, SMC37c669_read_config(i));
+    pr_info("-- CR%02x : %02x\n", i, SMC37c669_read_config(i));
 }
 /*+
  * ======================================
@@ -2542,13 +2542,13 @@ #if SMC_DEBUG
         SMC37c669_display_device_info( );
 #endif
 	local_irq_restore(flags);
-        printk( "SMC37c669 Super I/O Controller found @ 0x%lx\n",
+        pr_info("SMC37c669 Super I/O Controller found @ 0x%lx\n",
 		(unsigned long) SMC_base );
     }
     else {
 	local_irq_restore(flags);
 #if SMC_DEBUG
-        printk( "No SMC37c669 Super I/O Controller found\n" );
+        printk(KERN_DEBUG "No SMC37c669 Super I/O Controller found\n" );
 #endif
     }
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
