From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:13:31 +0000
Subject: [KJ] [PATCH 29/53] intelfb: Clean up printk()'s in
Message-Id: <20050125231330.10418.76514.97957@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19132057975892436=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19132057975892436==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/intelfb/intelfbhw.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/intelfb/intelfbhw.c linux-2.6.11-rc2-mm1/drivers/video/intelfb/intelfbhw.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/intelfb/intelfbhw.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/intelfb/intelfbhw.c	2005-01-24 19:07:03.375259503 -0500
@@ -529,10 +529,10 @@
 	if (!hw || !dinfo)
 		return;
 	/* Read in as much of the HW state as possible. */
-	printk("hw state dump start\n");
-	printk("	VGA0_DIVISOR:		0x%08x\n", hw->vga0_divisor);
-	printk("	VGA1_DIVISOR:		0x%08x\n", hw->vga1_divisor);
-	printk("	VGAPD: 			0x%08x\n", hw->vga_pd);
+	pr_info("hw state dump start\n");
+	pr_info("	VGA0_DIVISOR:		0x%08x\n", hw->vga0_divisor);
+	pr_info("	VGA1_DIVISOR:		0x%08x\n", hw->vga1_divisor);
+	pr_info("	VGAPD: 			0x%08x\n", hw->vga_pd);
 	n = (hw->vga0_divisor >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
 	m1 = (hw->vga0_divisor >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
 	m2 = (hw->vga0_divisor >> FP_M2_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
@@ -541,9 +541,9 @@
 	else
 		p1 = (hw->vga_pd >> VGAPD_0_P1_SHIFT) & DPLL_P1_MASK;
 	p2 = (hw->vga_pd >> VGAPD_0_P2_SHIFT) & DPLL_P2_MASK;
-	printk("	VGA0: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
+	pr_info("	VGA0: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
 		m1, m2, n, p1, p2);
-	printk("	VGA0: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
+	pr_info("	VGA0: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
 
 	n = (hw->vga1_divisor >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
 	m1 = (hw->vga1_divisor >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
@@ -553,16 +553,16 @@
 	else
 		p1 = (hw->vga_pd >> VGAPD_1_P1_SHIFT) & DPLL_P1_MASK;
 	p2 = (hw->vga_pd >> VGAPD_1_P2_SHIFT) & DPLL_P2_MASK;
-	printk("	VGA1: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
+	pr_info("	VGA1: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
 		m1, m2, n, p1, p2);
-	printk("	VGA1: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
+	pr_info("	VGA1: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
 
-	printk("	DPLL_A:			0x%08x\n", hw->dpll_a);
-	printk("	DPLL_B:			0x%08x\n", hw->dpll_b);
-	printk("	FPA0:			0x%08x\n", hw->fpa0);
-	printk("	FPA1:			0x%08x\n", hw->fpa1);
-	printk("	FPB0:			0x%08x\n", hw->fpb0);
-	printk("	FPB1:			0x%08x\n", hw->fpb1);
+	pr_info("	DPLL_A:			0x%08x\n", hw->dpll_a);
+	pr_info("	DPLL_B:			0x%08x\n", hw->dpll_b);
+	pr_info("	FPA0:			0x%08x\n", hw->fpa0);
+	pr_info("	FPA1:			0x%08x\n", hw->fpa1);
+	pr_info("	FPB0:			0x%08x\n", hw->fpb0);
+	pr_info("	FPB1:			0x%08x\n", hw->fpb1);
 
 	n = (hw->fpa0 >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
 	m1 = (hw->fpa0 >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
@@ -572,9 +572,9 @@
 	else
 		p1 = (hw->dpll_a >> DPLL_P1_SHIFT) & DPLL_P1_MASK;
 	p2 = (hw->dpll_a >> DPLL_P2_SHIFT) & DPLL_P2_MASK;
-	printk("	PLLA0: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
+	pr_info("	PLLA0: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
 		m1, m2, n, p1, p2);
-	printk("	PLLA0: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
+	pr_info("	PLLA0: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
 
 	n = (hw->fpa1 >> FP_N_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
 	m1 = (hw->fpa1 >> FP_M1_DIVISOR_SHIFT) & FP_DIVISOR_MASK;
@@ -584,62 +584,62 @@
 	else
 		p1 = (hw->dpll_a >> DPLL_P1_SHIFT) & DPLL_P1_MASK;
 	p2 = (hw->dpll_a >> DPLL_P2_SHIFT) & DPLL_P2_MASK;
-	printk("	PLLA1: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
+	pr_info("	PLLA1: (m1, m2, n, p1, p2) = (%d, %d, %d, %d, %d)\n",
 		m1, m2, n, p1, p2);
-	printk("	PLLA1: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
+	pr_info("	PLLA1: clock is %d\n", CALC_VCLOCK(m1, m2, n, p1, p2));
 
 #if 0
-	printk("	PALETTE_A:\n");
+	pr_info("	PALETTE_A:\n");
 	for (i = 0; i < PALETTE_8_ENTRIES)
-		printk("	%3d:	0x%08x\n", i, hw->palette_a[i];
-	printk("	PALETTE_B:\n");
+		pr_info("	%3d:	0x%08x\n", i, hw->palette_a[i];
+	pr_info("	PALETTE_B:\n");
 	for (i = 0; i < PALETTE_8_ENTRIES)
-		printk("	%3d:	0x%08x\n", i, hw->palette_b[i];
+		pr_info("	%3d:	0x%08x\n", i, hw->palette_b[i];
 #endif
 
-	printk("	HTOTAL_A:		0x%08x\n", hw->htotal_a);
-	printk("	HBLANK_A:		0x%08x\n", hw->hblank_a);
-	printk("	HSYNC_A:		0x%08x\n", hw->hsync_a);
-	printk("	VTOTAL_A:		0x%08x\n", hw->vtotal_a);
-	printk("	VBLANK_A:		0x%08x\n", hw->vblank_a);
-	printk("	VSYNC_A:		0x%08x\n", hw->vsync_a);
-	printk("	SRC_SIZE_A:		0x%08x\n", hw->src_size_a);
-	printk("	BCLRPAT_A:		0x%08x\n", hw->bclrpat_a);
-	printk("	HTOTAL_B:		0x%08x\n", hw->htotal_b);
-	printk("	HBLANK_B:		0x%08x\n", hw->hblank_b);
-	printk("	HSYNC_B:		0x%08x\n", hw->hsync_b);
-	printk("	VTOTAL_B:		0x%08x\n", hw->vtotal_b);
-	printk("	VBLANK_B:		0x%08x\n", hw->vblank_b);
-	printk("	VSYNC_B:		0x%08x\n", hw->vsync_b);
-	printk("	SRC_SIZE_B:		0x%08x\n", hw->src_size_b);
-	printk("	BCLRPAT_B:		0x%08x\n", hw->bclrpat_b);
-
-	printk("	ADPA:			0x%08x\n", hw->adpa);
-	printk("	DVOA:			0x%08x\n", hw->dvoa);
-	printk("	DVOB:			0x%08x\n", hw->dvob);
-	printk("	DVOC:			0x%08x\n", hw->dvoc);
-	printk("	DVOA_SRCDIM:		0x%08x\n", hw->dvoa_srcdim);
-	printk("	DVOB_SRCDIM:		0x%08x\n", hw->dvob_srcdim);
-	printk("	DVOC_SRCDIM:		0x%08x\n", hw->dvoc_srcdim);
-	printk("	LVDS:			0x%08x\n", hw->lvds);
-
-	printk("	PIPEACONF:		0x%08x\n", hw->pipe_a_conf);
-	printk("	PIPEBCONF:		0x%08x\n", hw->pipe_b_conf);
-	printk("	DISPARB:		0x%08x\n", hw->disp_arb);
-
-	printk("	CURSOR_A_CONTROL:	0x%08x\n", hw->cursor_a_control);
-	printk("	CURSOR_B_CONTROL:	0x%08x\n", hw->cursor_b_control);
-	printk("	CURSOR_A_BASEADDR:	0x%08x\n", hw->cursor_a_base);
-	printk("	CURSOR_B_BASEADDR:	0x%08x\n", hw->cursor_b_base);
+	pr_info("	HTOTAL_A:		0x%08x\n", hw->htotal_a);
+	pr_info("	HBLANK_A:		0x%08x\n", hw->hblank_a);
+	pr_info("	HSYNC_A:		0x%08x\n", hw->hsync_a);
+	pr_info("	VTOTAL_A:		0x%08x\n", hw->vtotal_a);
+	pr_info("	VBLANK_A:		0x%08x\n", hw->vblank_a);
+	pr_info("	VSYNC_A:		0x%08x\n", hw->vsync_a);
+	pr_info("	SRC_SIZE_A:		0x%08x\n", hw->src_size_a);
+	pr_info("	BCLRPAT_A:		0x%08x\n", hw->bclrpat_a);
+	pr_info("	HTOTAL_B:		0x%08x\n", hw->htotal_b);
+	pr_info("	HBLANK_B:		0x%08x\n", hw->hblank_b);
+	pr_info("	HSYNC_B:		0x%08x\n", hw->hsync_b);
+	pr_info("	VTOTAL_B:		0x%08x\n", hw->vtotal_b);
+	pr_info("	VBLANK_B:		0x%08x\n", hw->vblank_b);
+	pr_info("	VSYNC_B:		0x%08x\n", hw->vsync_b);
+	pr_info("	SRC_SIZE_B:		0x%08x\n", hw->src_size_b);
+	pr_info("	BCLRPAT_B:		0x%08x\n", hw->bclrpat_b);
+
+	pr_info("	ADPA:			0x%08x\n", hw->adpa);
+	pr_info("	DVOA:			0x%08x\n", hw->dvoa);
+	pr_info("	DVOB:			0x%08x\n", hw->dvob);
+	pr_info("	DVOC:			0x%08x\n", hw->dvoc);
+	pr_info("	DVOA_SRCDIM:		0x%08x\n", hw->dvoa_srcdim);
+	pr_info("	DVOB_SRCDIM:		0x%08x\n", hw->dvob_srcdim);
+	pr_info("	DVOC_SRCDIM:		0x%08x\n", hw->dvoc_srcdim);
+	pr_info("	LVDS:			0x%08x\n", hw->lvds);
+
+	pr_info("	PIPEACONF:		0x%08x\n", hw->pipe_a_conf);
+	pr_info("	PIPEBCONF:		0x%08x\n", hw->pipe_b_conf);
+	pr_info("	DISPARB:		0x%08x\n", hw->disp_arb);
+
+	pr_info("	CURSOR_A_CONTROL:	0x%08x\n", hw->cursor_a_control);
+	pr_info("	CURSOR_B_CONTROL:	0x%08x\n", hw->cursor_b_control);
+	pr_info("	CURSOR_A_BASEADDR:	0x%08x\n", hw->cursor_a_base);
+	pr_info("	CURSOR_B_BASEADDR:	0x%08x\n", hw->cursor_b_base);
 
-	printk("	CURSOR_A_PALETTE:	");
+	pr_info("	CURSOR_A_PALETTE:	");
 	for (i = 0; i < 4; i++) {
 		printk("0x%08x", hw->cursor_a_palette[i]);
 		if (i < 3)
 			printk(", ");
 	}
 	printk("\n");
-	printk("	CURSOR_B_PALETTE:	");
+	pr_info("	CURSOR_B_PALETTE:	");
 	for (i = 0; i < 4; i++) {
 		printk("0x%08x", hw->cursor_b_palette[i]);
 		if (i < 3)
@@ -647,40 +647,40 @@
 	}
 	printk("\n");
 
-	printk("	CURSOR_SIZE:		0x%08x\n", hw->cursor_size);
+	pr_info("	CURSOR_SIZE:		0x%08x\n", hw->cursor_size);
 
-	printk("	DSPACNTR:		0x%08x\n", hw->disp_a_ctrl);
-	printk("	DSPBCNTR:		0x%08x\n", hw->disp_b_ctrl);
-	printk("	DSPABASE:		0x%08x\n", hw->disp_a_base);
-	printk("	DSPBBASE:		0x%08x\n", hw->disp_b_base);
-	printk("	DSPASTRIDE:		0x%08x\n", hw->disp_a_stride);
-	printk("	DSPBSTRIDE:		0x%08x\n", hw->disp_b_stride);
+	pr_info("	DSPACNTR:		0x%08x\n", hw->disp_a_ctrl);
+	pr_info("	DSPBCNTR:		0x%08x\n", hw->disp_b_ctrl);
+	pr_info("	DSPABASE:		0x%08x\n", hw->disp_a_base);
+	pr_info("	DSPBBASE:		0x%08x\n", hw->disp_b_base);
+	pr_info("	DSPASTRIDE:		0x%08x\n", hw->disp_a_stride);
+	pr_info("	DSPBSTRIDE:		0x%08x\n", hw->disp_b_stride);
 
-	printk("	VGACNTRL:		0x%08x\n", hw->vgacntrl);
-	printk("	ADD_ID:			0x%08x\n", hw->add_id);
+	pr_info("	VGACNTRL:		0x%08x\n", hw->vgacntrl);
+	pr_info("	ADD_ID:			0x%08x\n", hw->add_id);
 
 	for (i = 0; i < 7; i++) {
-		printk("	SWF0%d			0x%08x\n", i,
+		pr_info("	SWF0%d			0x%08x\n", i,
 			hw->swf0x[i]);
 	}
 	for (i = 0; i < 7; i++) {
-		printk("	SWF1%d			0x%08x\n", i,
+		pr_info("	SWF1%d			0x%08x\n", i,
 			hw->swf1x[i]);
 	}
 	for (i = 0; i < 3; i++) {
-		printk("	SWF3%d			0x%08x\n", i,
+		pr_info("	SWF3%d			0x%08x\n", i,
 			hw->swf3x[i]);
 	}
 	for (i = 0; i < 8; i++)
-		printk("	FENCE%d			0x%08x\n", i,
+		pr_info("	FENCE%d			0x%08x\n", i,
 			hw->fence[i]);
 
-	printk("	INSTPM			0x%08x\n", hw->instpm);
-	printk("	MEM_MODE		0x%08x\n", hw->mem_mode);
-	printk("	FW_BLC_0		0x%08x\n", hw->fw_blc_0);
-	printk("	FW_BLC_1		0x%08x\n", hw->fw_blc_1);
+	pr_info("	INSTPM			0x%08x\n", hw->instpm);
+	pr_info("	MEM_MODE		0x%08x\n", hw->mem_mode);
+	pr_info("	FW_BLC_0		0x%08x\n", hw->fw_blc_0);
+	pr_info("	FW_BLC_1		0x%08x\n", hw->fw_blc_1);
 
-	printk("hw state dump end\n");
+	pr_info("hw state dump end\n");
 #endif
 }
 

--===============19132057975892436==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19132057975892436==--
