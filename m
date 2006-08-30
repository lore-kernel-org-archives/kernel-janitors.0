From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:16 +0000
Subject: [KJ] [PATCH] 25/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214816.15055.71546.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/smc37c93x.c b/arch/alpha/kernel/smc37c93x.c
index 2636cc0..9f7d766 100644
--- a/arch/alpha/kernel/smc37c93x.c
+++ b/arch/alpha/kernel/smc37c93x.c
@@ -14,11 +14,12 @@ #include <asm/io.h>
 #include <asm/segment.h>
 
 #define SMC_DEBUG 0
+#define PFX "37c93x: "
 
 #if SMC_DEBUG
-# define DBG_DEVS(args)         printk args
+# define DBG_DEVS(fmt, args...) printk(KERN_DEBUG PFX "%s: " fmt, __FUNCTION__ , ## args)
 #else
-# define DBG_DEVS(args)
+# define DBG_DEVS(fmt, args...)
 #endif
 
 #define KB              1024
@@ -220,20 +221,18 @@ static void __init SMCReportDeviceStatus
 	outb(POWER_CONTROL, indexPort);
 	currentControl = inb(dataPort);
 
-	printk(currentControl & (1 << FDC)
+	printk(KERN_DEBUG PFX currentControl & (1 << FDC)
 	       ? "\t+FDC Enabled\n" : "\t-FDC Disabled\n");
-	printk(currentControl & (1 << IDE1)
+	printk(KERN_DEBUG PFX currentControl & (1 << IDE1)
 	       ? "\t+IDE1 Enabled\n" : "\t-IDE1 Disabled\n");
-	printk(currentControl & (1 << IDE2)
+	printk(KERN_DEBUG PFX currentControl & (1 << IDE2)
 	       ? "\t+IDE2 Enabled\n" : "\t-IDE2 Disabled\n");
-	printk(currentControl & (1 << PARP)
+	printk(KERN_DEBUG PFX currentControl & (1 << PARP)
 	       ? "\t+PARP Enabled\n" : "\t-PARP Disabled\n");
-	printk(currentControl & (1 << SER1)
+	printk(KERN_DEBUG PFX currentControl & (1 << SER1)
 	       ? "\t+SER1 Enabled\n" : "\t-SER1 Disabled\n");
-	printk(currentControl & (1 << SER2)
+	printk(KERN_DEBUG PFX currentControl & (1 << SER2)
 	       ? "\t+SER2 Enabled\n" : "\t-SER2 Disabled\n");
-
-	printk( "\n" );
 }
 #endif
 
@@ -248,29 +247,29 @@ #if SMC_DEBUG
 		SMCReportDeviceStatus(SMCUltraBase);
 #endif
 		SMCEnableDevice(SMCUltraBase, SER1, COM1_BASE, COM1_INTERRUPT);
-		DBG_DEVS(("SMC FDC37C93X: SER1 done\n"));
+		DBG_DEVS("SER1 done\n");
 		SMCEnableDevice(SMCUltraBase, SER2, COM2_BASE, COM2_INTERRUPT);
-		DBG_DEVS(("SMC FDC37C93X: SER2 done\n"));
+		DBG_DEVS("SER2 done\n");
 		SMCEnableDevice(SMCUltraBase, PARP, PARP_BASE, PARP_INTERRUPT);
-		DBG_DEVS(("SMC FDC37C93X: PARP done\n"));
+		DBG_DEVS("PARP done\n");
 		/* On PC164, IDE on the SMC is not enabled;
 		   CMD646 (PCI) on MB */
 		SMCEnableKYBD(SMCUltraBase);
-		DBG_DEVS(("SMC FDC37C93X: KYB done\n"));
+		DBG_DEVS("KYB done\n");
 		SMCEnableFDC(SMCUltraBase);
-		DBG_DEVS(("SMC FDC37C93X: FDC done\n"));
+		DBG_DEVS("FDC done\n");
 #if SMC_DEBUG
 		SMCReportDeviceStatus(SMCUltraBase);
 #endif
 		SMCRunState(SMCUltraBase);
 		local_irq_restore(flags);
-		printk("SMC FDC37C93X Ultra I/O Controller found @ 0x%lx\n",
+		pr_info(PFX "Ultra I/O Controller found @ 0x%lx\n",
 		       SMCUltraBase);
 		return 1;
 	}
 	else {
 		local_irq_restore(flags);
-		DBG_DEVS(("No SMC FDC37C93X Ultra I/O Controller found\n"));
+		DBG_DEVS("No Ultra I/O Controller found\n");
 		return 0;
 	}
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
