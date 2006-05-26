From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 26 May 2006 10:35:17 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-omap1/id.c
Message-Id: <20060526103517.GW2083@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060515121824.GM12726@rotomalug.org>
In-Reply-To: <20060515121824.GM12726@rotomalug.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-omap1/id.c
=================================--- linux-2.6.16.16.orig/arch/arm/mach-omap1/id.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-omap1/id.c	2006-05-24 17:35:22.000000000 +0200
@@ -123,17 +123,17 @@
 	omap_id = omap_readl(OMAP32_ID_0);
 
 #ifdef DEBUG
-	printk("OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));
-	printk("OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
+	printk(KERN_DEBUG "OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));
+	printk(KERN_DEBUG "OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
 		omap_readl(OMAP_DIE_ID_1),
 	       (omap_readl(OMAP_DIE_ID_1) >> 17) & 0xf);
-	printk("OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
-	printk("OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
+	printk(KERN_DEBUG "OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
+	printk(KERN_DEBUG "OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
 		omap_readl(OMAP_PRODUCTION_ID_1),
 		omap_readl(OMAP_PRODUCTION_ID_1) & 0xffff);
-	printk("OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
-	printk("OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
-	printk("JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
+	printk(KERN_DEBUG "OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
+	printk(KERN_DEBUG "OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
+	printk(KERN_DEBUG "JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
 #endif
 
 	system_serial_high = omap_readl(OMAP_DIE_ID_0);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
