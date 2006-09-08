From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:58 +0000
Subject: [KJ] [PATCH 14/72] arm: add KERN_ constants to
Message-Id: <20060908015758.10114.53902.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-lh7a40x/ssp-cpld.c b/arch/arm/mach-lh7a40x/ssp-cpld.c
index a108301..90f722c 100644
--- a/arch/arm/mach-lh7a40x/ssp-cpld.c
+++ b/arch/arm/mach-lh7a40x/ssp-cpld.c
@@ -50,13 +50,8 @@ #include <asm/hardware.h>
 
 #include <asm/arch/ssp.h>
 
-//#define TALK
-
-#if defined (TALK)
-#define PRINTK(f...)		printk (f)
-#else
-#define PRINTK(f...)		do {} while (0)
-#endif
+#undef DEBUG
+#define DPRINTK(fmt, args...)		pr_debug(fmt, ## args)
 
 #if defined (CONFIG_ARCH_LH7A400)
 # define CPLD_SPID		__REGP16(CPLD06_VIRT) /* SPI data */
@@ -167,14 +162,14 @@ #if defined (CONFIG_MACH_LPD7A400)
 	    || ssp_configuration.device = DEVICE_TOUCH) {
 		int select = 0;
 
-		PRINTK ("spi(%d %d.%d) 0x%04x",
+		DPRINTK ("spi(%d %d.%d) 0x%04x",
 			ssp_configuration.device, cwrite, cread,
 			v);
-#if defined (TALK)
+#if defined (DEBUG)
 		if (ssp_configuration.device = DEVICE_CODEC)
-			PRINTK (" 0x%03x -> %2d", v & 0x1ff, (v >> 9) & 0x7f);
+			DPRINTK (" 0x%03x -> %2d", v & 0x1ff, (v >> 9) & 0x7f);
 #endif
-		PRINTK ("\n");
+		DPRINTK ("\n");
 
 		if (ssp_configuration.device = DEVICE_CODEC)
 			select = CPLD_SPIC_CS_CODEC;
@@ -211,7 +206,7 @@ #endif
 	}
 #endif
 
-	PRINTK ("spi(%d) 0x%04x -> 0x%x\r\n", ssp_configuration.device,
+	DPRINTK ("spi(%d) 0x%04x -> 0x%x\r\n", ssp_configuration.device,
 		v & 0x1ff, (v >> 9) & 0x7f);
 
 	enable_cs ();
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
