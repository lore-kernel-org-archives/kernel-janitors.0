From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:52 +0000
Subject: [KJ] [PATCH 22/72] arm: add KERN_ constants to
Message-Id: <20060908015852.10114.201.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/id.c b/arch/arm/mach-omap1/id.c
index da13c3e..e2d7f9f 100644
--- a/arch/arm/mach-omap1/id.c
+++ b/arch/arm/mach-omap1/id.c
@@ -121,19 +121,17 @@ void __init omap_check_revision(void)
 	die_rev = omap_get_die_rev();
 	omap_id = omap_readl(OMAP32_ID_0);
 
-#ifdef DEBUG
-	printk("OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));
-	printk("OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
+	pr_debug("OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));
+	pr_debug("OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
 		omap_readl(OMAP_DIE_ID_1),
-	       (omap_readl(OMAP_DIE_ID_1) >> 17) & 0xf);
-	printk("OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
-	printk("OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
+		(omap_readl(OMAP_DIE_ID_1) >> 17) & 0xf);
+	pr_debug("OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
+	pr_debug("OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
 		omap_readl(OMAP_PRODUCTION_ID_1),
 		omap_readl(OMAP_PRODUCTION_ID_1) & 0xffff);
-	printk("OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
-	printk("OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
-	printk("JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
-#endif
+	pr_debug("OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
+	pr_debug("OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
+	pr_debug("JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
 
 	system_serial_high = omap_readl(OMAP_DIE_ID_0);
 	system_serial_low = omap_readl(OMAP_DIE_ID_1);
@@ -183,10 +181,10 @@ #endif
 		system_rev |= 0x24;
 		break;
 	default:
-		printk("Unknown OMAP cpu type: 0x%02x\n", cpu_type);
+		pr_info("Unknown OMAP cpu type: 0x%02x\n", cpu_type);
 	}
 
-	printk("OMAP%04x", system_rev >> 16);
+	pr_info("OMAP%04x", system_rev >> 16);
 	if ((system_rev >> 8) & 0xff)
 		printk("%x", (system_rev >> 8) & 0xff);
 	printk(" revision %i handled as %02xxx id: %08x%08x\n",
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
