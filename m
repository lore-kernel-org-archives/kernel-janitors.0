From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 01:59:35 +0000
Subject: [KJ] [PATCH 51/53][RESEND] virgefb: Clean up printk()'s in
Message-Id: <20050126015934.10794.78303.75263@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53809646783312037=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53809646783312037==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/virgefb.c - resent since KDevelop munged the source file.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/virgefb.c linux-2.6.11-rc2-mm1/drivers/video/virgefb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/virgefb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/virgefb.c	2005-01-24 19:07:04.382256236 -0500
@@ -2157,7 +2157,7 @@
 		}
 	}
 	if (save == ~0UL)
-		printk("Can't compute clock PLL values for %ld Hz clock\n", freq);
+		printk(KERN_NOTICE "Can't compute clock PLL values for %ld Hz clock\n", freq);
 	DPRINTK("EXIT\n");
 	return(mnr);
 }
@@ -2435,20 +2435,20 @@
 	printk("\n");
 	for (i = 0; i <= 0x6f; i++) {
 		wb_mmio(CRT_ADDRESS, i);
-		printk("crt idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(CRT_ADDRESS_R));
+		pr_info("crt idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(CRT_ADDRESS_R));
 	}
 	for (i = 0; i <= 0x1c; i++) {
 		wb_mmio(SEQ_ADDRESS, i);
-		printk("seq idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(SEQ_ADDRESS_R));
+		pr_info("seq idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(SEQ_ADDRESS_R));
 	}
 	for (i = 0; i <= 8; i++) {
 		wb_mmio(GCT_ADDRESS, i);
-		printk("gfx idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(GCT_ADDRESS_R));
+		pr_info("gfx idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(GCT_ADDRESS_R));
 	}
 	for (i = 0; i <= 0x14; i++) {
 		c = rb_mmio(ACT_ADDRESS_RESET);
 		wb_mmio(ACT_ADDRESS_W, i);
-		printk("atr idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(ACT_ADDRESS_R));
+		pr_info("atr idx : 0x%2.2x : 0x%2.2x\n", i, rb_mmio(ACT_ADDRESS_R));
 	}
 
 	/* re-enable video access to palette */
@@ -2461,23 +2461,23 @@
 
 	/* general regs */
 
-	printk("0x3cc(w 0x3c2) : 0x%2.2x\n", rb_mmio(0x3cc));	/* GREG_MISC_OUTPUT READ */
-	printk("0x3c2(-------) : 0x%2.2x\n", rb_mmio(0x3c2));	/* GREG_INPUT_STATUS 0 READ */
-	printk("0x3c3(w 0x3c3) : 0x%2.2x\n", rb_vgaio(0x3c3));	/* GREG_VIDEO_SUBS_ENABLE */
-	printk("0x3ca(w 0x3da) : 0x%2.2x\n", rb_vgaio(0x3ca));	/* GREG_FEATURE_CONTROL read */
-	printk("0x3da(-------) : 0x%2.2x\n", rb_mmio(0x3da));	/* GREG_INPUT_STATUS 1 READ */
+	pr_info("0x3cc(w 0x3c2) : 0x%2.2x\n", rb_mmio(0x3cc));	/* GREG_MISC_OUTPUT READ */
+	pr_info("0x3c2(-------) : 0x%2.2x\n", rb_mmio(0x3c2));	/* GREG_INPUT_STATUS 0 READ */
+	pr_info("0x3c3(w 0x3c3) : 0x%2.2x\n", rb_vgaio(0x3c3));	/* GREG_VIDEO_SUBS_ENABLE */
+	pr_info("0x3ca(w 0x3da) : 0x%2.2x\n", rb_vgaio(0x3ca));	/* GREG_FEATURE_CONTROL read */
+	pr_info("0x3da(-------) : 0x%2.2x\n", rb_mmio(0x3da));	/* GREG_INPUT_STATUS 1 READ */
 
 	/* engine regs */
 
 	for (i = 0x8180; i <= 0x8200; i = i + 4)
-		printk("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
+		pr_info("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
 
 	i = 0x8504;
-	printk("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
+	pr_info("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
 	i = 0x850c;
-	printk("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
+	pr_info("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
 	for (i = 0xa4d4; i <= 0xa50c; i = i + 4)
-		printk("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
+		pr_info("0x%8.8x : 0x%8.8x\n", i, rl_mmio(i));
 
 	/* PCI regs */
 
@@ -2485,29 +2485,29 @@
 
 	for (c = 0; c < 0x08; c = c + 2) {
 		w = (*((u16 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)) ^ 2)));
-		printk("pci 0x%2.2x : 0x%4.4x\n", c, w);
+		pr_info("pci 0x%2.2x : 0x%4.4x\n", c, w);
 	}
 	c = 8;
 	l = (*((u32 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)))));
-	printk("pci 0x%2.2x : 0x%8.8x\n", c, l);
+	pr_info("pci 0x%2.2x : 0x%8.8x\n", c, l);
 	c = 0x0d;
 	b = (*((u8 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)) ^ 3)));
-	printk("pci 0x%2.2x : 0x%2.2x\n", c, b);
+	pr_info("pci 0x%2.2x : 0x%2.2x\n", c, b);
 	c = 0x10;
 	l = (*((u32 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)))));
-	printk("pci 0x%2.2x : 0x%8.8x\n", c, l);
+	pr_info("pci 0x%2.2x : 0x%8.8x\n", c, l);
 	c = 0x30;
 	l = (*((u32 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)))));
-	printk("pci 0x%2.2x : 0x%8.8x\n", c, l);
+	pr_info("pci 0x%2.2x : 0x%8.8x\n", c, l);
 	c = 0x3c;
 	b = (*((u8 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)) ^ 3)));
-	printk("pci 0x%2.2x : 0x%2.2x\n", c, b);
+	pr_info("pci 0x%2.2x : 0x%2.2x\n", c, b);
 	c = 0x3d;
 	b = (*((u8 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)) ^ 3)));
-	printk("pci 0x%2.2x : 0x%2.2x\n", c, b);
+	pr_info("pci 0x%2.2x : 0x%2.2x\n", c, b);
 	c = 0x3e;
 	w = (*((u16 *)((u32)(vgaio_regs + c + (on_zorro2 ? 0 : 0x000e0000)) ^ 2)));
-	printk("pci 0x%2.2x : 0x%4.4x\n", c, w);
+	pr_info("pci 0x%2.2x : 0x%4.4x\n", c, w);
 	SelectMMIO;
 }
 #endif

--===============53809646783312037==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53809646783312037==--
