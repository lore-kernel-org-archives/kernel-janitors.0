From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 01:17:55 +0000
Subject: [KJ] [PATCH 4/53][RESEND] atyfb: Clean up printk()'s in
Message-Id: <20050126011754.10655.97150.78698@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37674088397532302=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37674088397532302==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/aty/atyfb_base.c - resent, fixing a missing ";"

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/aty/atyfb_base.c linux-2.6.11-rc2-mm1/drivers/video/aty/atyfb_base.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/aty/atyfb_base.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/aty/atyfb_base.c	2005-01-25 20:13:55.241363721 -0500
@@ -1398,45 +1398,57 @@
 
 	/* CRTC registers */
 	base = 0x2000;
-	printk("debug atyfb: Mach64 non-shadow register values:");
+	printk(KERN_DEBUG "debug atyfb: Mach64 non-shadow register values:");
 	for (i = 0; i < 256; i = i+4) {
-		if(i%16 == 0) printk("\ndebug atyfb: 0x%04X: ", base + i);
+		if(i%16 == 0) {
+			printk("\n");
+			printk(KERN_DEBUG "debug atyfb: 0x%04X: ", base + i);
+		}
 		printk(" %08X", aty_ld_le32(i, par));
 	}
-	printk("\n\n");
+	printk("\n");
+	printk(KERN_DEBUG "---BREAK---\n");
 
 #ifdef CONFIG_FB_ATY_CT
 	/* PLL registers */
 	base = 0x00;
-	printk("debug atyfb: Mach64 PLL register values:");
+	printk(KERN_DEBUG "debug atyfb: Mach64 PLL register values:");
 	for (i = 0; i < 64; i++) {
-		if(i%16 == 0) printk("\ndebug atyfb: 0x%02X: ", base + i);
+		if(i%16 == 0) {
+			printk("\n");
+			printk(KERN_DEBUG "debug atyfb: 0x%02X: ", base + i);
+		}
 		if(i%4 == 0)  printk(" ");
 		printk("%02X", aty_ld_pll_ct(i, par));
 	}
-	printk("\n\n");
+	printk("\n");
+	printk(KERN_DEBUG "---BREAK---\n");
 #endif	/* CONFIG_FB_ATY_CT */
 
 #ifdef CONFIG_FB_ATY_GENERIC_LCD
 	if (par->lcd_table != 0) {
 		/* LCD registers */
 		base = 0x00;
-		printk("debug atyfb: LCD register values:");
+		printk(KERN_DEBUG "debug atyfb: LCD register values:");
 		if(M64_HAS(LT_LCD_REGS)) {
 		    for(i = 0; i <= POWER_MANAGEMENT; i++) {
 			if(i == EXT_VERT_STRETCH)
 			    continue;
-			printk("\ndebug atyfb: 0x%04X: ", lt_lcd_regs[i]);
+			printk("\n");
+			printk(KERN_DEBUG "debug atyfb: 0x%04X: ", lt_lcd_regs[i]);
 			printk(" %08X", aty_ld_lcd(i, par));
 		    }
 
 		} else {
 		    for (i = 0; i < 64; i++) {
-			if(i%4 == 0) printk("\ndebug atyfb: 0x%02X: ", base + i);
+			if(i%4 == 0) {
+				printk("\n");
+				printk(KERN_DEBUG "debug atyfb: 0x%02X: ", base + i);
+			}
 			printk(" %08X", aty_ld_lcd(i, par));
 		    }
 		}
-		printk("\n\n");
+		printk("\n");
 	}
 #endif /* CONFIG_FB_ATY_GENERIC_LCD */
 }
@@ -1555,7 +1567,7 @@
 		spin_lock_irq(&par->int_lock);
 		int_cntl = aty_ld_le32(CRTC_INT_CNTL, par) & CRTC_INT_EN_MASK;
 		if (!(int_cntl & CRTC_VBLANK_INT_EN)) {
-			printk("atyfb: someone disabled IRQ [%08x]\n", int_cntl);
+			printk(KERN_NOTICE "atyfb: someone disabled IRQ [%08x]\n", int_cntl);
 			/* re-enable interrupt */
 			aty_st_le32(CRTC_INT_CNTL, int_cntl | CRTC_VBLANK_INT_EN, par );
 		}
@@ -2410,14 +2422,14 @@
 #if defined(DEBUG) && defined(CONFIG_ATY_CT)
 	if (M64_HAS(INTEGRATED)) {
 		int i;
-		printk("debug atyfb: BUS_CNTL DAC_CNTL MEM_CNTL EXT_MEM_CNTL CRTC_GEN_CNTL "
-		       "DSP_CONFIG DSP_ON_OFF CLOCK_CNTL\n"
-		       "debug atyfb: %08x %08x %08x %08x     %08x      %08x   %08x   %08x\n"
-		       "debug atyfb: PLL",
+		pr_debug("debug atyfb: BUS_CNTL DAC_CNTL MEM_CNTL EXT_MEM_CNTL CRTC_GEN_CNTL "
+			"DSP_CONFIG DSP_ON_OFF CLOCK_CNTL\n");
+		pr_debug("debug atyfb: %08x %08x %08x %08x     %08x      %08x   %08x   %08x\n",
 			aty_ld_le32(BUS_CNTL, par), aty_ld_le32(DAC_CNTL, par),
 			aty_ld_le32(MEM_CNTL, par), aty_ld_le32(EXT_MEM_CNTL, par),
 			aty_ld_le32(CRTC_GEN_CNTL, par), aty_ld_le32(DSP_CONFIG, par),
 			aty_ld_le32(DSP_ON_OFF, par), aty_ld_le32(CLOCK_CNTL, par));
+		pr_debug("debug atyfb: PLL");
 		for (i = 0; i < 40; i++)
 			printk(" %02x", aty_ld_pll_ct(i, par));
 		printk("\n");

--===============37674088397532302==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37674088397532302==--
