From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:49:11 +0000
Subject: [KJ] [PATCH] 33/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214911.15055.44828.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index a654014..e8d07b2 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -88,7 +88,7 @@ #if defined(ALPHA_RESTORE_SRM_SETUP)
 	/* First, read and save the original setting. */
 	pci_bus_read_config_dword(pci_isa_hose->bus, PCI_DEVFN(7, 0), 0x60,
 				  &saved_config.orig_route_tab);
-	printk("%s: PIRQ original 0x%x new 0x%x\n", __FUNCTION__,
+	pr_info("%s: PIRQ original 0x%x new 0x%x\n", __FUNCTION__,
 	       saved_config.orig_route_tab, alpha_mv.sys.sio.route_tab);
 #endif
 
@@ -239,7 +239,7 @@ alphabook1_init_pci(void)
 			io_port = dev->resource[0].start;
 			ctest4 = inb(io_port+0x21);
 			if (!(ctest4 & 0x80)) {
-				printk("AlphaBook1 NCR init: setting"
+				pr_info("AlphaBook1 NCR init: setting"
 				       " burst disable\n");
 				outb(ctest4 | 0x80, io_port+0x21);
 			}
@@ -254,7 +254,7 @@ alphabook1_init_pci(void)
 	outb(0x0f, 0x3ce); outb(0x05, 0x3cf);   /* unlock PR0-4 */
 	outb(0x0b, 0x3ce); config = inb(0x3cf); /* read PR1 */
 	if ((config & 0xc0) != 0xc0) {
-		printk("AlphaBook1 VGA init: setting 1Mb memory\n");
+		pr_info("AlphaBook1 VGA init: setting 1Mb memory\n");
 		config |= 0xc0;
 		outb(0x0b, 0x3ce); outb(config, 0x3cf); /* write PR1 */
 	}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
