From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Tue, 29 Mar 2016 22:12:40 +0000
Subject: [PATCH v2] staging: xgifb: fix block comments
Message-Id: <1459289560-12834-1-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnaud.patard@rtp-net.org, gregkh@linuxfoundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'Block comments use a trailing */ on a
separate line' and 'Block comments use * on subsequent lines'

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
v2: moved the comments in XGI_CRT1Table to above the block of data

 drivers/staging/xgifb/vb_init.c    |  13 ++--
 drivers/staging/xgifb/vb_setmode.c |   3 +-
 drivers/staging/xgifb/vb_table.h   | 135 ++++++++++++++++++++++---------------
 3 files changed, 88 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/xgifb/vb_init.c b/drivers/staging/xgifb/vb_init.c
index 29da955..062ece2 100644
--- a/drivers/staging/xgifb/vb_init.c
+++ b/drivers/staging/xgifb/vb_init.c
@@ -355,7 +355,8 @@ static void XGINew_DDR2_DefaultRegister(
 	unsigned long P3d4 = Port, P3c4 = Port - 0x10;
 
 	/* keep following setting sequence, each setting in
-	 * the same reg insert idle */
+	 * the same reg insert idle
+	 */
 	xgifb_reg_set(P3d4, 0x82, 0x77);
 	xgifb_reg_set(P3d4, 0x86, 0x00);
 	xgifb_reg_get(P3d4, 0x86); /* Insert read command for delay */
@@ -700,11 +701,11 @@ static void XGINew_CheckChannel(struct xgi_hw_device_info *HwDeviceExtension,
 		break;
 	case XG42:
 		/*
-		 XG42 SR14 D[3] Reserve
-		 D[2] = 1, Dual Channel
-		 = 0, Single Channel
-
-		 It's Different from Other XG40 Series.
+		 * XG42 SR14 D[3] Reserve
+		 * D[2] = 1, Dual Channel
+		 * = 0, Single Channel
+		 *
+		 * It's Different from Other XG40 Series.
 		 */
 		if (XGINew_CheckFrequence(pVBInfo) = 1) { /* DDRII, DDR2x */
 			pVBInfo->ram_bus = 32; /* 32 bits */
diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/vb_setmode.c
index cc1ad76..50c8ea4 100644
--- a/drivers/staging/xgifb/vb_setmode.c
+++ b/drivers/staging/xgifb/vb_setmode.c
@@ -1992,7 +1992,8 @@ static void XGI_GetVBInfo(unsigned short ModeIdIndex,
 		}
 
 		/* LCD+TV can't support in slave mode
-		 * (Force LCDA+TV->LCDB) */
+		 * (Force LCDA+TV->LCDB)
+		 */
 		if ((tempbx & SetInSlaveMode) && (tempbx & XGI_SetCRT2ToLCDA)) {
 			tempbx ^= (SetCRT2ToLCD | XGI_SetCRT2ToLCDA |
 				   SetCRT2ToDualEdge);
diff --git a/drivers/staging/xgifb/vb_table.h b/drivers/staging/xgifb/vb_table.h
index 45f2c99..c801deb 100644
--- a/drivers/staging/xgifb/vb_table.h
+++ b/drivers/staging/xgifb/vb_table.h
@@ -58,8 +58,9 @@ static const unsigned char XGI27_cr41[24][3] = {
 	{0xC4, 0x40, 0x84}, /* 1 CR8A */
 	{0xC4, 0x40, 0x84}, /* 2 CR8B */
 	{0xB3, 0x13, 0xa4}, /* 3 CR40[7],
-				 CR99[2:0],
-				 CR45[3:0]*/
+			     *   CR99[2:0],
+			     *   CR45[3:0]
+			     */
 	{0xf0, 0xf5, 0xf0}, /* 4 CR59 */
 	{0x90, 0x90, 0x24}, /* 5 CR68 */
 	{0x77, 0x67, 0x44}, /* 6 CR69 */
@@ -101,9 +102,11 @@ const struct XGI_ExtStruct XGI330_EModeIDTable[] = {
 	{0x38, 0x0a1b, 0x0508, 0x08, 0x00, 0x16},
 	{0x3a, 0x0e3b, 0x0609, 0x09, 0x00, 0x1e},
 	{0x3c, 0x0e3b, 0x070a, 0x0a, 0x00, 0x22}, /* mode 1600x1200
-						   add CRT2MODE [2003/10/07] */
+						   * add CRT2MODE [2003/10/07]
+						   */
 	{0x3d, 0x0e7d, 0x070a, 0x0a, 0x00, 0x22}, /* mode 1600x1200
-						   add CRT2MODE */
+						   * add CRT2MODE
+						   */
 	{0x40, 0x9a1c, 0x0000, 0x00, 0x04, 0x00},
 	{0x41, 0x9a1d, 0x0000, 0x00, 0x04, 0x00},
 	{0x43, 0x0a1c, 0x0306, 0x06, 0x05, 0x06},
@@ -129,7 +132,8 @@ const struct XGI_ExtStruct XGI330_EModeIDTable[] = {
 	{0x64, 0x0a7f, 0x0508, 0x08, 0x00, 0x16},
 	{0x65, 0x0eff, 0x0609, 0x09, 0x00, 0x1e},
 	{0x66, 0x0eff, 0x070a, 0x0a, 0x00, 0x22}, /* mode 1600x1200
-						   add CRT2MODE */
+						   * add CRT2MODE
+						   */
 	{0x68, 0x067b, 0x080b, 0x0b, 0x00, 0x29},
 	{0x69, 0x06fd, 0x080b, 0x0b, 0x00, 0x29},
 	{0x6b, 0x07ff, 0x080b, 0x0b, 0x00, 0x29},
@@ -223,38 +227,38 @@ const struct XGI_CRT1TableStruct XGI_CRT1Table[] = {
 	  0x0D, 0x3E, 0xE0, 0x83, 0xDF, 0x0E, 0x90} }, /* 0xb */
 	{ {0x65, 0x4F, 0x89, 0x57, 0x9F, 0x00, 0x01, 0x00,
 	  0xFB, 0x1F, 0xE6, 0x8A, 0xDF, 0xFC, 0x10} }, /* 0xc */
-	{ {0x7B, 0x63, 0x9F, 0x6A, 0x93, 0x00, 0x05, 0x00, /* ;
-						0D (800x600,56Hz) */
-	  0x6F, 0xF0, 0x58, 0x8A, 0x57, 0x70, 0xA0} },     /* ;
-						(VCLK 36.0MHz) */
-	{ {0x7F, 0x63, 0x83, 0x6C, 0x1C, 0x00, 0x06, 0x00, /* ;
-						0E (800x600,60Hz) */
-	  0x72, 0xF0, 0x58, 0x8C, 0x57, 0x73, 0xA0} },     /* ;
-						(VCLK 40.0MHz) */
-	{ {0x7D, 0x63, 0x81, 0x6E, 0x1D, 0x00, 0x06, 0x00, /* ;
-						0F (800x600,72Hz) */
-	  0x98, 0xF0, 0x7C, 0x82, 0x57, 0x99, 0x80} },     /* ;
-						(VCLK 50.0MHz) */
-	{ {0x7F, 0x63, 0x83, 0x69, 0x13, 0x00, 0x06, 0x00, /* ;
-						10 (800x600,75Hz) */
-	  0x6F, 0xF0, 0x58, 0x8B, 0x57, 0x70, 0xA0} },     /* ;
-						(VCLK 49.5MHz) */
-	{ {0x7E, 0x63, 0x82, 0x6B, 0x13, 0x00, 0x06, 0x00, /* ;
-						11 (800x600,85Hz) */
-	  0x75, 0xF0, 0x58, 0x8B, 0x57, 0x76, 0xA0} },     /* ;
-						(VCLK 56.25MHz) */
-	{ {0x81, 0x63, 0x85, 0x6D, 0x18, 0x00, 0x06, 0x60, /* ;
-						12 (800x600,100Hz) */
-	  0x7A, 0xF0, 0x58, 0x8B, 0x57, 0x7B, 0xA0} },     /* ;
-						(VCLK 75.8MHz) */
-	{ {0x83, 0x63, 0x87, 0x6E, 0x19, 0x00, 0x06, 0x60, /* ;
-						13 (800x600,120Hz) */
-	  0x81, 0xF0, 0x58, 0x8B, 0x57, 0x82, 0xA0} },     /* ;
-						(VCLK 79.411MHz) */
-	{ {0x85, 0x63, 0x89, 0x6F, 0x1A, 0x00, 0x06, 0x60, /* ;
-						14 (800x600,160Hz) */
-	  0x91, 0xF0, 0x58, 0x8B, 0x57, 0x92, 0xA0} },     /* ;
-						(VCLK 105.822MHz) */
+	/* 0D (800x600,56Hz) */
+	{ {0x7B, 0x63, 0x9F, 0x6A, 0x93, 0x00, 0x05, 0x00,
+	/* (VCLK 36.0MHz) */
+	  0x6F, 0xF0, 0x58, 0x8A, 0x57, 0x70, 0xA0} },
+	/* 0E (800x600,60Hz) */
+	{ {0x7F, 0x63, 0x83, 0x6C, 0x1C, 0x00, 0x06, 0x00,
+	/* (VCLK 40.0MHz) */
+	  0x72, 0xF0, 0x58, 0x8C, 0x57, 0x73, 0xA0} },
+	/* 0F (800x600,72Hz) */
+	{ {0x7D, 0x63, 0x81, 0x6E, 0x1D, 0x00, 0x06, 0x00,
+	/* (VCLK 50.0MHz) */
+	  0x98, 0xF0, 0x7C, 0x82, 0x57, 0x99, 0x80} },
+	/* 10 (800x600,75Hz) */
+	{ {0x7F, 0x63, 0x83, 0x69, 0x13, 0x00, 0x06, 0x00,
+	/* (VCLK 49.5MHz) */
+	  0x6F, 0xF0, 0x58, 0x8B, 0x57, 0x70, 0xA0} },
+	/* 11 (800x600,85Hz) */
+	{ {0x7E, 0x63, 0x82, 0x6B, 0x13, 0x00, 0x06, 0x00,
+	/* (VCLK 56.25MHz) */
+	  0x75, 0xF0, 0x58, 0x8B, 0x57, 0x76, 0xA0} },
+	/* 12 (800x600,100Hz) */
+	{ {0x81, 0x63, 0x85, 0x6D, 0x18, 0x00, 0x06, 0x60,
+	/* (VCLK 75.8MHz) */
+	  0x7A, 0xF0, 0x58, 0x8B, 0x57, 0x7B, 0xA0} },
+	/* 13 (800x600,120Hz) */
+	{ {0x83, 0x63, 0x87, 0x6E, 0x19, 0x00, 0x06, 0x60,
+	/* (VCLK 79.411MHz) */
+	  0x81, 0xF0, 0x58, 0x8B, 0x57, 0x82, 0xA0} },
+	/* 14 (800x600,160Hz) */
+	{ {0x85, 0x63, 0x89, 0x6F, 0x1A, 0x00, 0x06, 0x60,
+	/* (VCLK 105.822MHz) */
+	  0x91, 0xF0, 0x58, 0x8B, 0x57, 0x92, 0xA0} },
 	{ {0x99, 0x7F, 0x9D, 0x84, 0x1A, 0x00, 0x02, 0x00,
 	  0x96, 0x1F, 0x7F, 0x83, 0x7F, 0x97, 0x10} }, /* 0x15 */
 	{ {0xA3, 0x7F, 0x87, 0x86, 0x97, 0x00, 0x02, 0x00,
@@ -388,7 +392,8 @@ static const struct SiS_LCDData XGI_ExtLCD1024x768Data[] = {
 
 static const struct SiS_LCDData XGI_CetLCD1024x768Data[] = {
 	{1, 1, 1344, 806, 1344, 806}, /* ; 00 (320x200,320x400,
-					       640x200,640x400) */
+				       *       640x200,640x400)
+				       */
 	{1, 1, 1344, 806, 1344, 806}, /* 01 (320x350,640x350) */
 	{1, 1, 1344, 806, 1344, 806}, /* 02 (360x400,720x400) */
 	{1, 1, 1344, 806, 1344, 806}, /* 03 (720x350) */
@@ -421,7 +426,8 @@ static const struct SiS_LCDData XGI_ExtLCD1280x1024Data[] = {
 
 static const struct SiS_LCDData XGI_CetLCD1280x1024Data[] = {
 	{1, 1, 1688, 1066, 1688, 1066}, /* 00 (320x200,320x400,
-					       640x200,640x400) */
+					 *     640x200,640x400)
+					 */
 	{1, 1, 1688, 1066, 1688, 1066}, /* 01 (320x350,640x350) */
 	{1, 1, 1688, 1066, 1688, 1066}, /* 02 (360x400,720x400) */
 	{1, 1, 1688, 1066, 1688, 1066}, /* 03 (720x350) */
@@ -434,7 +440,8 @@ static const struct SiS_LCDData XGI_CetLCD1280x1024Data[] = {
 
 static const struct SiS_LCDData xgifb_lcd_1400x1050[] = {
 	{211, 100, 2100, 408,  1688, 1066}, /* 00 (320x200,320x400,
-						   640x200,640x400) */
+					     *     640x200,640x400)
+					     */
 	{211, 64,  1536, 358,  1688, 1066}, /* 01 (320x350,640x350) */
 	{211, 100, 2100, 408,  1688, 1066}, /* 02 (360x400,720x400) */
 	{211, 64,  1536, 358,  1688, 1066}, /* 03 (720x350) */
@@ -442,13 +449,15 @@ static const struct SiS_LCDData xgifb_lcd_1400x1050[] = {
 	{211, 72,  1008, 609,  1688, 1066}, /* 05 (800x600x60Hz) */
 	{211, 128, 1400, 776,  1688, 1066}, /* 06 (1024x768x60Hz) */
 	{1,   1,   1688, 1066, 1688, 1066}, /* 07 (1280x1024x60Hz
-						  w/o Scaling) */
+					     *    w/o Scaling)
+					     */
 	{1,   1,   1688, 1066, 1688, 1066}  /* 08 (1400x1050x60Hz) */
 };
 
 static const struct SiS_LCDData XGI_ExtLCD1600x1200Data[] = {
 	{4,  1,  1620, 420,  2160, 1250}, /* 00 (320x200,320x400,
-						 640x200,640x400)*/
+					   *     640x200,640x400)
+					   */
 	{27, 7,  1920, 375,  2160, 1250}, /* 01 (320x350,640x350) */
 	{4,  1,  1620, 420,  2160, 1250}, /* 02 (360x400,720x400)*/
 	{27, 7,  1920, 375,  2160, 1250}, /* 03 (720x350) */
@@ -462,7 +471,8 @@ static const struct SiS_LCDData XGI_ExtLCD1600x1200Data[] = {
 
 static const struct SiS_LCDData XGI_StLCD1600x1200Data[] = {
 	{27,  4,  800,  500,  2160, 1250}, /* 00 (320x200,320x400,
-						  640x200,640x400) */
+					    *     640x200,640x400)
+					    */
 	{27,  4,  800,  500,  2160, 1250}, /* 01 (320x350,640x350) */
 	{27,  4,  800,  500,  2160, 1250}, /* 02 (360x400,720x400) */
 	{27,  4,  800,  500,  2160, 1250}, /* 03 (720x350) */
@@ -489,7 +499,8 @@ static const struct SiS_LCDData XGI_NoScalingData[] = {
 
 static const struct SiS_LCDData XGI_ExtLCD1024x768x75Data[] = {
 	{42, 25, 1536, 419, 1344, 806}, /* ; 00 (320x200,320x400,
-						 640x200,640x400) */
+					 *       640x200,640x400)
+					 */
 	{48, 25, 1536, 369, 1344, 806}, /* ; 01 (320x350,640x350) */
 	{42, 25, 1536, 419, 1344, 806}, /* ; 02 (360x400,720x400) */
 	{48, 25, 1536, 369, 1344, 806}, /* ; 03 (720x350) */
@@ -500,7 +511,8 @@ static const struct SiS_LCDData XGI_ExtLCD1024x768x75Data[] = {
 
 static const struct SiS_LCDData XGI_CetLCD1024x768x75Data[] = {
 	{1, 1, 1312, 800, 1312, 800}, /* ; 00 (320x200,320x400,
-					       640x200,640x400) */
+				       *       640x200,640x400)
+				       */
 	{1, 1, 1312, 800, 1312, 800}, /* ; 01 (320x350,640x350) */
 	{1, 1, 1312, 800, 1312, 800}, /* ; 02 (360x400,720x400) */
 	{1, 1, 1312, 800, 1312, 800}, /* ; 03 (720x350) */
@@ -511,7 +523,8 @@ static const struct SiS_LCDData XGI_CetLCD1024x768x75Data[] = {
 
 static const struct SiS_LCDData xgifb_lcd_1280x1024x75[] = {
 	{211, 60,  1024, 501,  1688, 1066}, /* ; 00 (320x200,320x400,
-						     640x200,640x400) */
+					     *       640x200,640x400)
+					     */
 	{211, 60,  1024, 508,  1688, 1066}, /* ; 01 (320x350,640x350) */
 	{211, 60,  1024, 501,  1688, 1066}, /* ; 02 (360x400,720x400) */
 	{211, 60,  1024, 508,  1688, 1066}, /* ; 03 (720x350) */
@@ -525,7 +538,8 @@ static const struct SiS_LCDData xgifb_lcd_1280x1024x75[] = {
 
 static const struct SiS_LCDData XGI_NoScalingDatax75[] = {
 	{1, 1, 800,  449,  800,  449},  /* ; 00 (320x200, 320x400,
-						 640x200, 640x400) */
+					 *       640x200, 640x400)
+					 */
 	{1, 1, 800,  449,  800,  449},  /* ; 01 (320x350, 640x350) */
 	{1, 1, 900,  449,  900,  449},  /* ; 02 (360x400, 720x400) */
 	{1, 1, 900,  449,  900,  449},  /* ; 03 (720x350) */
@@ -732,7 +746,8 @@ static const struct XGI_LCDDesStruct XGI_StLCDDes1600x1200Data[] = {
 
 static const struct XGI330_LCDDataDesStruct2  XGI_NoScalingDesData[] = {
 	{9, 657,  448, 405,  96,   2}, /* 00 (320x200,320x400,
-					      640x200,640x400) */
+					*     640x200,640x400)
+					*/
 	{9, 657,  448, 355,  96,   2}, /* 01 (320x350,640x350) */
 	{9, 657,  448, 405,  96,   2}, /* 02 (360x400,720x400) */
 	{9, 657,  448, 355,  96,   2}, /* 03 (720x350) */
@@ -818,7 +833,8 @@ static const struct XGI_LCDDesStruct XGI_CetLCDDes1280x1024x75Data[] = {
 /* Scaling LCD 75Hz */
 static const struct XGI330_LCDDataDesStruct2 XGI_NoScalingDesDatax75[] =  {
 	{9, 657,  448, 405,  96,  2}, /* ; 00 (320x200,320x400,
-					       640x200,640x400) */
+				       *       640x200,640x400)
+				       */
 	{9, 657,  448, 355,  96,  2}, /* ; 01 (320x350,640x350) */
 	{9, 738,  448, 405,  108, 2}, /* ; 02 (360x400,720x400) */
 	{9, 738,  448, 355,  108, 2}, /* ; 03 (720x350) */
@@ -873,7 +889,8 @@ static const struct SiS_TVData XGI_ExtNTSCData[] = {
 
 static const struct SiS_TVData XGI_St1HiTVData[] = {
 	{1, 1, 892,  563, 690,  800, 0,     0, 0}, /* 00 (320x200,320x400,
-							  640x200,640x400) */
+						    *     640x200,640x400)
+						    */
 	{1, 1, 892,  563, 690,  700, 0,     0, 0}, /* 01 (320x350,640x350) */
 	{1, 1, 1000, 563, 785,  800, 0,     0, 0}, /* 02 (360x400,720x400) */
 	{1, 1, 1000, 563, 785,  700, 0,     0, 0}, /* 03 (720x350) */
@@ -883,7 +900,8 @@ static const struct SiS_TVData XGI_St1HiTVData[] = {
 
 static const struct SiS_TVData XGI_St2HiTVData[] = {
 	{3, 1, 840,  483, 1648, 960, 0x032, 0, 0}, /* 00 (320x200,320x400,
-							  640x200,640x400) */
+						    *     640x200,640x400)
+						    */
 	{1, 1, 892,  563, 690,  700, 0,     0, 0}, /* 01 (320x350,640x350) */
 	{3, 1, 840,  483, 1648, 960, 0x032, 0, 0}, /* 02 (360x400,720x400) */
 	{1, 1, 1000, 563, 785,  700, 0,     0, 0}, /* 03 (720x350) */
@@ -893,7 +911,8 @@ static const struct SiS_TVData XGI_St2HiTVData[] = {
 
 static const struct SiS_TVData XGI_ExtHiTVData[] = {
 	{6,  1,  840,  563,  1632, 960, 0,     0, 0}, /* 00 (320x200,320x400,
-							     640x200,640x400) */
+						       *     640x200,640x400)
+						       */
 	{3,  1,  960,  563,  1632, 960, 0,     0, 0}, /* 01 (320x350,640x350) */
 	{3,  1,  840,  483,  1632, 960, 0,     0, 0}, /* 02 (360x400,720x400) */
 	{3,  1,  960,  563,  1632, 960, 0,     0, 0}, /* 03 (720x350) */
@@ -948,7 +967,8 @@ static const struct SiS_TVData XGI_StYPbPr525pData[] = {
 
 static const struct SiS_TVData XGI_ExtYPbPr750pData[] = {
 	{ 3, 1,  935, 470, 1130, 680,  50, 0, 0}, /* 00 (320x200,320x400,
-							 640x200,640x400) */
+						   *     640x200,640x400)
+						   */
 	{24, 7,  935, 420, 1130, 680,  50, 0, 0}, /* 01 (320x350,640x350) */
 	{ 3, 1,  935, 470, 1130, 680,  50, 0, 0}, /* 02 (360x400,720x400) */
 	{24, 7,  935, 420, 1130, 680,  50, 0, 0}, /* 03 (720x350) */
@@ -1269,7 +1289,8 @@ static const struct SiS_LVDSData XGI_LVDSNoScalingDatax75[] = {
 	{1312,  800, 1312, 800},  /* ; 06 (1024x768x75Hz) */
 	{1688, 1066, 1688, 1066}, /* ; 07 (1280x1024x75Hz) */
 	{1688, 1066, 1688, 1066}, /* ; 08 (1400x1050x75Hz)
-				     ;;[ycchen] 12/19/02 */
+				   * ;;[ycchen] 12/19/02
+				   */
 	{2160, 1250, 2160, 1250}, /* ; 09 (1600x1200x75Hz) */
 	{1688,  806, 1688, 806},  /* ; 0A (1280x768x75Hz) */
 };
@@ -1364,7 +1385,8 @@ static const struct SiS_LVDSData XGI_LVDS1600x1200Des_1[] = {
 
 static const struct XGI330_LCDDataDesStruct2  XGI_LVDSNoScalingDesData[] = {
 	{0,  648,  448,  405,  96, 2}, /* 00 (320x200,320x400,
-					      640x200,640x400) */
+					*     640x200,640x400)
+					*/
 	{0,  648,  448,  355,  96, 2}, /* 01 (320x350,640x350) */
 	{0,  648,  448,  405,  96, 2}, /* 02 (360x400,720x400) */
 	{0,  648,  448,  355,  96, 2}, /* 03 (720x350) */
@@ -1435,7 +1457,8 @@ static const struct SiS_LVDSData XGI_LVDS1280x1024Des_2x75[] = {
 /* Scaling LCD 75Hz */
 static const struct XGI330_LCDDataDesStruct2 XGI_LVDSNoScalingDesDatax75[] = {
 	{0,  648, 448,  405,  96, 2}, /* ; 00 (320x200,320x400,
-					       640x200,640x400) */
+				       *       640x200,640x400)
+				       */
 	{0,  648, 448,  355,  96, 2}, /* ; 01 (320x350,640x350) */
 	{0,  729, 448,  405, 108, 2}, /* ; 02 (360x400,720x400) */
 	{0,  729, 448,  355, 108, 2}, /* ; 03 (720x350) */
-- 
1.9.1

