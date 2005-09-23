From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 10:39:18 +0000
Subject: [KJ] [PATCH] printk : arch/alpha/kernel/smc37c669.c
Message-Id: <20050923103918.GJ10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56926694372927611=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============56926694372927611==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/smc37c669.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/smc37c669.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/smc37c669.c
@@ -1898,45 +1898,45 @@ static unsigned int __init SMC37c669_get
 void __init SMC37c669_display_device_info ( void )
 {
     if ( SMC37c669_is_device_enabled( SERIAL_0 ) ) {
-    	printk( "  Serial 0:    Enabled [ Port 0x%x, IRQ %d ]\n",
+    	printk(KERN_INFO "  Serial 0:    Enabled [ Port 0x%x, IRQ %d ]\n",
 		 local_config[ SERIAL_0 ].port1,
 		 local_config[ SERIAL_0 ].irq
 	);
     }
     else {
-    	printk( "  Serial 0:    Disabled\n" );
+    	printk(KERN_INFO "  Serial 0:    Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( SERIAL_1 ) ) {
-    	printk( "  Serial 1:    Enabled [ Port 0x%x, IRQ %d ]\n",
+    	printk(KERN_INFO "  Serial 1:    Enabled [ Port 0x%x, IRQ %d ]\n",
 		 local_config[ SERIAL_1 ].port1,
 		 local_config[ SERIAL_1 ].irq
 	);
     }
     else {
-    	printk( "  Serial 1:    Disabled\n" );
+    	printk(KERN_INFO "  Serial 1:    Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( PARALLEL_0 ) ) {
-    	printk( "  Parallel:    Enabled [ Port 0x%x, IRQ %d/%d ]\n",
+    	printk(KERN_INFO "  Parallel:    Enabled [ Port 0x%x, IRQ %d/%d ]\n",
 		 local_config[ PARALLEL_0 ].port1,
 		 local_config[ PARALLEL_0 ].irq,
 		 local_config[ PARALLEL_0 ].drq
 	);
     }
     else {
-    	printk( "  Parallel:    Disabled\n" );
+    	printk(KERN_INFO "  Parallel:    Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( FLOPPY_0 ) ) {
-    	printk( "  Floppy Ctrl: Enabled [ Port 0x%x, IRQ %d/%d ]\n",
+    	printk(KERN_INFO "  Floppy Ctrl: Enabled [ Port 0x%x, IRQ %d/%d ]\n",
 		 local_config[ FLOPPY_0 ].port1,
 		 local_config[ FLOPPY_0 ].irq,
 		 local_config[ FLOPPY_0 ].drq
 	);
     }
     else {
-    	printk( "  Floppy Ctrl: Disabled\n" );
+    	printk(KERN_INFO "  Floppy Ctrl: Disabled\n" );
     }
 
     if ( SMC37c669_is_device_enabled( IDE_0 ) ) {
@@ -1946,7 +1946,7 @@ void __init SMC37c669_display_device_inf
 	);
     }
     else {
-    	printk( "  IDE 0:       Disabled\n" );
+    	printk(KERN_INFO "  IDE 0:       Disabled\n" );
     }
 }
 
@@ -2452,7 +2452,7 @@ SMC37c669_dump_registers(void)
 {
   int i;
   for (i = 0; i <= 0x29; i++)
-    printk("-- CR%02x : %02x\n", i, SMC37c669_read_config(i));
+    printk(KERN_DEBUG "-- CR%02x : %02x\n", i, SMC37c669_read_config(i));
 }
 /*+
  * ============================================================================
@@ -2542,13 +2542,13 @@ void __init SMC669_Init ( int index )
         SMC37c669_display_device_info( );
 #endif
 	local_irq_restore(flags);
-        printk( "SMC37c669 Super I/O Controller found @ 0x%lx\n",
+        printk(KERN_INFO "SMC37c669 Super I/O Controller found @ 0x%lx\n",
 		(unsigned long) SMC_base );
     }
     else {
 	local_irq_restore(flags);
 #if SMC_DEBUG
-        printk( "No SMC37c669 Super I/O Controller found\n" );
+        printk(KERN_INFO "No SMC37c669 Super I/O Controller found\n" );
 #endif
     }
 }


--===============56926694372927611==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56926694372927611==--
