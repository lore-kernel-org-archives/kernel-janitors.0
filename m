From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 20 Mar 2006 20:47:13 +0000
Subject: [KJ] [PATCH] drivers/video: Use ARRAY_SIZE macro
Message-Id: <20060320204713.GA1120@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============013094182050450653=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============013094182050450653==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove duplicates of
ARRAY_SIZE. Some coding style and trailing whitespaces are also fixed.

Compile-tested where possible (some are other arch or BROKEN)

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/video/acornfb.c               |    8 ++++----
 drivers/video/asiliantfb.c            |   14 ++++++--------
 drivers/video/aty/aty128fb.c          |    4 ++--
 drivers/video/aty/atyfb_base.c        |    8 ++++----
 drivers/video/aty/mach64_gx.c         |    3 +--
 drivers/video/chipsfb.c               |   14 ++++++--------
 drivers/video/console/fonts.c         |    2 +-
 drivers/video/imsttfb.c               |   24 +++++++++++++++---------
 drivers/video/macmodes.c              |    2 +-
 drivers/video/matrox/matroxfb_g450.c  |    2 +-
 drivers/video/matrox/matroxfb_maven.c |    6 +++---
 drivers/video/modedb.c                |    2 +-
 drivers/video/neofb.c                 |    8 ++++----
 drivers/video/pmagb-b-fb.c            |    2 +-
 drivers/video/radeonfb.c              |    2 +-
 drivers/video/sstfb.c                 |   11 ++++++-----
 drivers/video/virgefb.c               |    3 +--
 17 files changed, 58 insertions(+), 57 deletions(-)

diff -urpN -X dontdiff linux-2.6.16/drivers/video/acornfb.c linux-2.6.16~array_size/drivers/video/acornfb.c
--- linux-2.6.16/drivers/video/acornfb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/acornfb.c	2006-03-20 20:44:30.000000000 +0100
@@ -1308,7 +1308,7 @@ static int __init acornfb_probe(struct p
 	/*
 	 * Try to select a suitable default mode
 	 */
-	for (i = 0; i < sizeof(modedb) / sizeof(*modedb); i++) {
+	for (i = 0; i < ARRAY_SIZE(modedb); i++) {
 		unsigned long hs;
 
 		hs = modedb[i].refresh *
@@ -1380,7 +1380,7 @@ static int __init acornfb_probe(struct p
 	 */
 	free_unused_pages(PAGE_OFFSET + size, PAGE_OFFSET + MAX_SIZE);
 #endif
-	
+
 	fb_info.fix.smem_len = size;
 	current_par.palette_size   = VIDC_PALETTE_SIZE;
 
@@ -1391,7 +1391,7 @@ static int __init acornfb_probe(struct p
 	 */
 	do {
 		rc = fb_find_mode(&fb_info.var, &fb_info, NULL, modedb,
-				 sizeof(modedb) / sizeof(*modedb),
+				 ARRAY_SIZE(modedb),
 				 &acornfb_default_mode, DEFAULT_BPP);
 		/*
 		 * If we found an exact match, all ok.
@@ -1408,7 +1408,7 @@ static int __init acornfb_probe(struct p
 			break;
 
 		rc = fb_find_mode(&fb_info.var, &fb_info, NULL, modedb,
-				 sizeof(modedb) / sizeof(*modedb),
+				 ARRAY_SIZE(modedb),
 				 &acornfb_default_mode, DEFAULT_BPP);
 		if (rc)
 			break;
diff -urpN -X dontdiff linux-2.6.16/drivers/video/asiliantfb.c linux-2.6.16~array_size/drivers/video/asiliantfb.c
--- linux-2.6.16/drivers/video/asiliantfb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/asiliantfb.c	2006-03-20 20:44:30.000000000 +0100
@@ -353,8 +353,6 @@ struct chips_init_reg {
 	unsigned char data;
 };
 
-#define N_ELTS(x)	(sizeof(x) / sizeof(x[0]))
-
 static struct chips_init_reg chips_init_sr[] =
 {
 	{0x00, 0x03},		/* Reset register */
@@ -460,22 +458,22 @@ static void __devinit chips_hw_init(stru
 {
 	int i;
 
-	for (i = 0; i < N_ELTS(chips_init_xr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_xr); ++i)
 		write_xr(chips_init_xr[i].addr, chips_init_xr[i].data);
 	write_xr(0x81, 0x12);
 	write_xr(0x82, 0x08);
 	write_xr(0x20, 0x00);
-	for (i = 0; i < N_ELTS(chips_init_sr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_sr); ++i)
 		write_sr(chips_init_sr[i].addr, chips_init_sr[i].data);
-	for (i = 0; i < N_ELTS(chips_init_gr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_gr); ++i)
 		write_gr(chips_init_gr[i].addr, chips_init_gr[i].data);
-	for (i = 0; i < N_ELTS(chips_init_ar); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_ar); ++i)
 		write_ar(chips_init_ar[i].addr, chips_init_ar[i].data);
 	/* Enable video output in attribute index register */
 	writeb(0x20, mmio_base + 0x780);
-	for (i = 0; i < N_ELTS(chips_init_cr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_cr); ++i)
 		write_cr(chips_init_cr[i].addr, chips_init_cr[i].data);
-	for (i = 0; i < N_ELTS(chips_init_fr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_fr); ++i)
 		write_fr(chips_init_fr[i].addr, chips_init_fr[i].data);
 }
 
diff -urpN -X dontdiff linux-2.6.16/drivers/video/aty/aty128fb.c linux-2.6.16~array_size/drivers/video/aty/aty128fb.c
--- linux-2.6.16/drivers/video/aty/aty128fb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/aty/aty128fb.c	2006-03-20 21:23:53.000000000 +0100
@@ -1725,9 +1725,9 @@ static int __init aty128_init(struct pci
 	strcpy(video_card, "Rage128 XX ");
 	video_card[8] = ent->device >> 8;
 	video_card[9] = ent->device & 0xFF;
-	    
+
 	/* range check to make sure */
-	if (ent->driver_data < (sizeof(r128_family)/sizeof(char *)))
+	if (ent->driver_data < ARRAY_SIZE(r128_family))
 	    strncat(video_card, r128_family[ent->driver_data], sizeof(video_card));
 
 	printk(KERN_INFO "aty128fb: %s [chip rev 0x%x] ", video_card, chip_rev);
diff -urpN -X dontdiff linux-2.6.16/drivers/video/aty/atyfb_base.c linux-2.6.16~array_size/drivers/video/aty/atyfb_base.c
--- linux-2.6.16/drivers/video/aty/atyfb_base.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/aty/atyfb_base.c	2006-03-20 20:44:30.000000000 +0100
@@ -434,7 +434,7 @@ static int __devinit correct_chipset(str
 	const char *name;
 	int i;
 
-	for (i = sizeof(aty_chips) / sizeof(*aty_chips) - 1; i >= 0; i--)
+	for (i = ARRAY_SIZE(aty_chips) - 1; i >= 0; i--)
 		if (par->pci_id == aty_chips[i].pci_id)
 			break;
 
@@ -2168,10 +2168,10 @@ static void __init aty_calc_mem_refresh(
 
 	if (IS_XL(par->pci_id) || IS_MOBILITY(par->pci_id)) {
 		refresh_tbl = ragexl_tbl;
-		size = sizeof(ragexl_tbl)/sizeof(int);
+		size = ARRAY_SIZE(ragexl_tbl);
 	} else {
 		refresh_tbl = ragepro_tbl;
-		size = sizeof(ragepro_tbl)/sizeof(int);
+		size = ARRAY_SIZE(ragepro_tbl);
 	}
 
 	for (i=0; i < size; i++) {
@@ -3397,7 +3397,7 @@ static int __devinit atyfb_pci_probe(str
 	struct atyfb_par *par;
 	int i, rc = -ENOMEM;
 
-	for (i = sizeof(aty_chips) / sizeof(*aty_chips) - 1; i >= 0; i--)
+	for (i = ARRAY_SIZE(aty_chips); i >= 0; i--)
 		if (pdev->device == aty_chips[i].pci_id)
 			break;
 
diff -urpN -X dontdiff linux-2.6.16/drivers/video/aty/mach64_gx.c linux-2.6.16~array_size/drivers/video/aty/mach64_gx.c
--- linux-2.6.16/drivers/video/aty/mach64_gx.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/aty/mach64_gx.c	2006-03-20 20:44:30.000000000 +0100
@@ -149,8 +149,7 @@ static int aty_var_to_pll_514(const stru
 	};
 	int i;
 
-	for (i = 0; i < sizeof(RGB514_clocks) / sizeof(*RGB514_clocks);
-	     i++)
+	for (i = 0; i < ARRAY_SIZE(RGB514_clocks); i++)
 		if (vclk_per <= RGB514_clocks[i].limit) {
 			pll->ibm514.m = RGB514_clocks[i].m;
 			pll->ibm514.n = RGB514_clocks[i].n;
diff -urpN -X dontdiff linux-2.6.16/drivers/video/chipsfb.c linux-2.6.16~array_size/drivers/video/chipsfb.c
--- linux-2.6.16/drivers/video/chipsfb.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/chipsfb.c	2006-03-20 20:44:30.000000000 +0100
@@ -178,8 +178,6 @@ struct chips_init_reg {
 	unsigned char data;
 };
 
-#define N_ELTS(x)	(sizeof(x) / sizeof(x[0]))
-
 static struct chips_init_reg chips_init_sr[] = {
 	{ 0x00, 0x03 },
 	{ 0x01, 0x01 },
@@ -287,18 +285,18 @@ static void __init chips_hw_init(void)
 {
 	int i;
 
-	for (i = 0; i < N_ELTS(chips_init_xr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_xr); ++i)
 		write_xr(chips_init_xr[i].addr, chips_init_xr[i].data);
 	outb(0x29, 0x3c2); /* set misc output reg */
-	for (i = 0; i < N_ELTS(chips_init_sr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_sr); ++i)
 		write_sr(chips_init_sr[i].addr, chips_init_sr[i].data);
-	for (i = 0; i < N_ELTS(chips_init_gr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_gr); ++i)
 		write_gr(chips_init_gr[i].addr, chips_init_gr[i].data);
-	for (i = 0; i < N_ELTS(chips_init_ar); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_ar); ++i)
 		write_ar(chips_init_ar[i].addr, chips_init_ar[i].data);
-	for (i = 0; i < N_ELTS(chips_init_cr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_cr); ++i)
 		write_cr(chips_init_cr[i].addr, chips_init_cr[i].data);
-	for (i = 0; i < N_ELTS(chips_init_fr); ++i)
+	for (i = 0; i < ARRAY_SIZE(chips_init_fr); ++i)
 		write_fr(chips_init_fr[i].addr, chips_init_fr[i].data);
 }
 
diff -urpN -X dontdiff linux-2.6.16/drivers/video/console/fonts.c linux-2.6.16~array_size/drivers/video/console/fonts.c
--- linux-2.6.16/drivers/video/console/fonts.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/console/fonts.c	2006-03-20 20:44:30.000000000 +0100
@@ -66,7 +66,7 @@ static const struct font_desc *fonts[] =
 #endif
 };
 
-#define num_fonts (sizeof(fonts)/sizeof(*fonts))
+#define num_fonts ARRAY_SIZE(fonts)
 
 #ifdef NO_FONTS
 #error No fonts configured.
diff -urpN -X dontdiff linux-2.6.16/drivers/video/imsttfb.c linux-2.6.16~array_size/drivers/video/imsttfb.c
--- linux-2.6.16/drivers/video/imsttfb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/imsttfb.c	2006-03-20 20:44:30.000000000 +0100
@@ -1372,18 +1372,24 @@ init_imstt(struct fb_info *info)
 	write_reg_le32(par->dc_regs, STGCTL, tmp & ~0x1);
 	write_reg_le32(par->dc_regs, SSR, 0);
 
-	/* set default values for DAC registers */ 
+	/* set default values for DAC registers */
 	if (par->ramdac == IBM) {
-		par->cmap_regs[PPMASK] = 0xff;	eieio();
-		par->cmap_regs[PIDXHI] = 0;	eieio();
-		for (i = 0; i < sizeof(ibm_initregs) / sizeof(*ibm_initregs); i++) {
-			par->cmap_regs[PIDXLO] = ibm_initregs[i].addr;	eieio();
-			par->cmap_regs[PIDXDATA] = ibm_initregs[i].value;	eieio();
+		par->cmap_regs[PPMASK] = 0xff;
+		eieio();
+		par->cmap_regs[PIDXHI] = 0;
+		eieio();
+		for (i = 0; i < ARRAY_SIZE(ibm_initregs); i++) {
+			par->cmap_regs[PIDXLO] = ibm_initregs[i].addr;
+			eieio();
+			par->cmap_regs[PIDXDATA] = ibm_initregs[i].value;
+			eieio();
 		}
 	} else {
-		for (i = 0; i < sizeof(tvp_initregs) / sizeof(*tvp_initregs); i++) {
-			par->cmap_regs[TVPADDRW] = tvp_initregs[i].addr;	eieio();
-			par->cmap_regs[TVPIDATA] = tvp_initregs[i].value;	eieio();
+		for (i = 0; i < ARRAY_SIZE(tvp_initregs); i++) {
+			par->cmap_regs[TVPADDRW] = tvp_initregs[i].addr;
+			eieio();
+			par->cmap_regs[TVPIDATA] = tvp_initregs[i].value;
+			eieio();
 		}
 	}
 
diff -urpN -X dontdiff linux-2.6.16/drivers/video/macmodes.c linux-2.6.16~array_size/drivers/video/macmodes.c
--- linux-2.6.16/drivers/video/macmodes.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/macmodes.c	2006-03-20 20:44:30.000000000 +0100
@@ -380,7 +380,7 @@ int __init mac_find_mode(struct fb_var_s
     if (mode_option && !strncmp(mode_option, "mac", 3)) {
 	mode_option += 3;
 	db = mac_modedb;
-	dbsize = sizeof(mac_modedb)/sizeof(*mac_modedb);
+	dbsize = ARRAY_SIZE(mac_modedb);
     }
     return fb_find_mode(var, info, mode_option, db, dbsize,
 			&mac_modedb[DEFAULT_MODEDB_INDEX], default_bpp);
diff -urpN -X dontdiff linux-2.6.16/drivers/video/matrox/matroxfb_g450.c linux-2.6.16~array_size/drivers/video/matrox/matroxfb_g450.c
--- linux-2.6.16/drivers/video/matrox/matroxfb_g450.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/matrox/matroxfb_g450.c	2006-03-20 20:44:30.000000000 +0100
@@ -59,7 +59,7 @@ static const struct mctl g450_controls[]
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.testout) },
 };
 
-#define G450CTRLS (sizeof(g450_controls)/sizeof(g450_controls[0]))
+#define G450CTRLS ARRAY_SIZE(g450_controls)
 
 /* Return: positive number: id found
            -EINVAL:         id not found, return failure
diff -urpN -X dontdiff linux-2.6.16/drivers/video/matrox/matroxfb_maven.c linux-2.6.16~array_size/drivers/video/matrox/matroxfb_maven.c
--- linux-2.6.16/drivers/video/matrox/matroxfb_maven.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/matrox/matroxfb_maven.c	2006-03-20 21:27:45.000000000 +0100
@@ -89,12 +89,12 @@ static const struct mctl maven_controls[
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.hue) },
 	{ { V4L2_CID_GAMMA, V4L2_CTRL_TYPE_INTEGER,
 	  "gamma",
-	  0, sizeof(maven_gamma)/sizeof(maven_gamma[0])-1, 1, 3,
+	  0, ARRAY_SIZE(maven_gamma) - 1, 1, 3,
 	  0,
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.gamma) },
 	{ { MATROXFB_CID_TESTOUT, V4L2_CTRL_TYPE_BOOLEAN,
 	  "test output",
-	  0, 1, 1, 0, 
+	  0, 1, 1, 0,
 	  0,
 	}, offsetof(struct matrox_fb_info, altout.tvo_params.testout) },
 	{ { MATROXFB_CID_DEFLICKER, V4L2_CTRL_TYPE_INTEGER,
@@ -105,7 +105,7 @@ static const struct mctl maven_controls[
 
 };
 
-#define MAVCTRLS (sizeof(maven_controls)/sizeof(maven_controls[0]))
+#define MAVCTRLS ARRAY_SIZE(maven_controls)
 
 /* Return: positive number: id found
            -EINVAL:         id not found, return failure
diff -urpN -X dontdiff linux-2.6.16/drivers/video/modedb.c linux-2.6.16~array_size/drivers/video/modedb.c
--- linux-2.6.16/drivers/video/modedb.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/modedb.c	2006-03-20 20:44:30.000000000 +0100
@@ -496,7 +496,7 @@ int fb_find_mode(struct fb_var_screeninf
     /* Set up defaults */
     if (!db) {
 	db = modedb;
-	dbsize = sizeof(modedb)/sizeof(*modedb);
+	dbsize = ARRAY_SIZE(modedb);
     }
     if (!default_mode)
 	default_mode = &modedb[DEFAULT_MODEDB_INDEX];
diff -urpN -X dontdiff linux-2.6.16/drivers/video/neofb.c linux-2.6.16~array_size/drivers/video/neofb.c
--- linux-2.6.16/drivers/video/neofb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/neofb.c	2006-03-20 20:44:30.000000000 +0100
@@ -165,20 +165,20 @@ static int neoFindMode(int xres, int yre
 
 	switch (depth) {
 	case 8:
-		size = sizeof(bios8) / sizeof(biosMode);
+		size = ARRAY_SIZE(bios8);
 		mode = bios8;
 		break;
 	case 16:
-		size = sizeof(bios16) / sizeof(biosMode);
+		size = ARRAY_SIZE(bios16);
 		mode = bios16;
 		break;
 	case 24:
-		size = sizeof(bios24) / sizeof(biosMode);
+		size = ARRAY_SIZE(bios24);
 		mode = bios24;
 		break;
 #ifdef NO_32BIT_SUPPORT_YET
 	case 32:
-		size = sizeof(bios32) / sizeof(biosMode);
+		size = ARRAY_SIZE(bios32);
 		mode = bios32;
 		break;
 #endif
diff -urpN -X dontdiff linux-2.6.16/drivers/video/pmagb-b-fb.c linux-2.6.16~array_size/drivers/video/pmagb-b-fb.c
--- linux-2.6.16/drivers/video/pmagb-b-fb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/pmagb-b-fb.c	2006-03-20 20:44:30.000000000 +0100
@@ -228,7 +228,7 @@ static void __init pmagbbfb_osc_setup(st
 
 	freq1 = (par->osc0 * count1 + count0 / 2) / count0;
 	par->osc1 = freq1;
-	for (i = 0; i < sizeof(pmagbbfb_freqs) / sizeof(*pmagbbfb_freqs); i++)
+	for (i = 0; i < ARRAY_SIZE(pmagbbfb_freqs); i++)
 		if (freq1 >= pmagbbfb_freqs[i] -
 			     (pmagbbfb_freqs[i] + 128) / 256 &&
 		    freq1 <= pmagbbfb_freqs[i] +
diff -urpN -X dontdiff linux-2.6.16/drivers/video/radeonfb.c linux-2.6.16~array_size/drivers/video/radeonfb.c
--- linux-2.6.16/drivers/video/radeonfb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/radeonfb.c	2006-03-20 20:44:30.000000000 +0100
@@ -759,7 +759,7 @@ static void __iomem *radeon_find_rom(str
                 rom = rom_base;
         
                 for (i = 0; (i < 512) && (stage != 4); i++) {
-                    for(j = 0;j < sizeof(radeon_sig)/sizeof(char *);j++) {
+                    for (j = 0; j < ARRAY_SIZE(radeon_sig); j++) {
                         if (radeon_sig[j][0] == *rom)
                                 if (strncmp(radeon_sig[j], rom,
                                             strlen(radeon_sig[j])) == 0) {
diff -urpN -X dontdiff linux-2.6.16/drivers/video/sstfb.c linux-2.6.16~array_size/drivers/video/sstfb.c
--- linux-2.6.16/drivers/video/sstfb.c	2006-03-20 20:26:47.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/sstfb.c	2006-03-20 20:44:30.000000000 +0100
@@ -1194,10 +1194,11 @@ static struct dac_switch dacs[] __devini
 static int __devinit sst_detect_dactype(struct fb_info *info, struct sstfb_par *par)
 {
 	int i, ret = 0;
-	
-	for (i=0; i<sizeof(dacs)/sizeof(dacs[0]); i++) {
+
+	for (i = 0; i < ARRAY_SIZE(dacs); i++) {
 		ret = dacs[i].detect(info);
-		if (ret) break;
+		if (ret)
+			break;
 	}
 	if (!ret)
 		return 0;
@@ -1604,8 +1605,8 @@ static int sstfb_dump_regs(struct fb_inf
 		{FBZMODE,"fbzmode"},
 	};
 
-	const int pci_s = sizeof(pci_regs)/sizeof(pci_regs[0]);
-	const int sst_s = sizeof(sst_regs)/sizeof(sst_regs[0]);
+	const int pci_s = ARRAY_SIZE(pci_regs);
+	const int sst_s = ARRAY_SIZE(sst_regs);
 	struct sstfb_par *par = info->par;
 	struct pci_dev *dev = par->dev;
 	u32 pci_res[pci_s];
diff -urpN -X dontdiff linux-2.6.16/drivers/video/virgefb.c linux-2.6.16~array_size/drivers/video/virgefb.c
--- linux-2.6.16/drivers/video/virgefb.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.16~array_size/drivers/video/virgefb.c	2006-03-20 21:27:58.000000000 +0100
@@ -616,8 +616,7 @@ static struct {
 #endif
 };
 
-#define arraysize(x)	(sizeof(x)/sizeof(*(x)))
-#define NUM_TOTAL_MODES	arraysize(virgefb_predefined)
+#define NUM_TOTAL_MODES	ARRAY_SIZE(virgefb_predefined)
 
 /*
  *    Default to 800x600 for video=virge8:, virge16: or virge32:

--===============013094182050450653==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============013094182050450653==--
