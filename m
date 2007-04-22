From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 22 Apr 2007 00:11:31 +0000
Subject: [KJ] [PATCH] cirrusfb: Convert to generic boolean
Message-Id: <20070422000901.9344.30280.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Convert to generic boolean.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Compiled-tested with "allyes", "allmod" & "allno" on x86[,_64] & sparc[,64]

 cirrusfb.c |   69 ++++++++++++++++++++++++++-----------------------------------
 1 file changed, 30 insertions(+), 39 deletions(-)


diff --git a/drivers/video/cirrusfb.c b/drivers/video/cirrusfb.c
index 2c4bc62..992bf4a 100644
--- a/drivers/video/cirrusfb.c
+++ b/drivers/video/cirrusfb.c
@@ -98,15 +98,6 @@
 #define assert(expr)
 #endif
 
-#ifdef TRUE
-#undef TRUE
-#endif
-#ifdef FALSE
-#undef FALSE
-#endif
-#define TRUE  1
-#define FALSE 0
-
 #define MB_ (1024*1024)
 #define KB_ (1024)
 
@@ -146,9 +137,9 @@ static const struct cirrusfb_board_info_rec {
 	char *name;		/* ASCII name of chipset */
 	long maxclock[5];		/* maximum video clock */
 	/* for  1/4bpp, 8bpp 15/16bpp, 24bpp, 32bpp - numbers from xorg code */
-	unsigned init_sr07 : 1;	/* init SR07 during init_vgachip() */
-	unsigned init_sr1f : 1; /* write SR1F during init_vgachip() */
-	unsigned scrn_start_bit19 : 1; /* construct bit 19 of screen start address */
+	bool init_sr07 : 1; /* init SR07 during init_vgachip() */
+	bool init_sr1f : 1; /* write SR1F during init_vgachip() */
+	bool scrn_start_bit19 : 1; /* construct bit 19 of screen start address */
 
 	/* initial SR07 value, then for each mode */
 	unsigned char sr07;
@@ -166,9 +157,9 @@ static const struct cirrusfb_board_info_rec {
 			/* the SD64/P4 have a higher max. videoclock */
 			140000, 140000, 140000, 140000, 140000,
 		},
-		.init_sr07		= TRUE,
-		.init_sr1f		= TRUE,
-		.scrn_start_bit19	= TRUE,
+		.init_sr07		= true,
+		.init_sr1f		= true,
+		.scrn_start_bit19	= true,
 		.sr07			= 0xF0,
 		.sr07_1bpp		= 0xF0,
 		.sr07_8bpp		= 0xF1,
@@ -180,9 +171,9 @@ static const struct cirrusfb_board_info_rec {
 			/* guess */
 			90000, 90000, 90000, 90000, 90000
 		},
-		.init_sr07		= TRUE,
-		.init_sr1f		= TRUE,
-		.scrn_start_bit19	= FALSE,
+		.init_sr07		= true,
+		.init_sr1f		= true,
+		.scrn_start_bit19	= false,
 		.sr07			= 0x80,
 		.sr07_1bpp		= 0x80,
 		.sr07_8bpp		= 0x81,
@@ -194,9 +185,9 @@ static const struct cirrusfb_board_info_rec {
 			/* guess */
 			90000, 90000, 90000, 90000, 90000
 		},
-		.init_sr07		= TRUE,
-		.init_sr1f		= TRUE,
-		.scrn_start_bit19	= FALSE,
+		.init_sr07		= true,
+		.init_sr1f		= true,
+		.scrn_start_bit19	= false,
 		.sr07			= 0x20,
 		.sr07_1bpp		= 0x20,
 		.sr07_8bpp		= 0x21,
@@ -208,9 +199,9 @@ static const struct cirrusfb_board_info_rec {
 			/* guess */
 			90000, 90000, 90000, 90000, 90000
 		},
-		.init_sr07		= TRUE,
-		.init_sr1f		= TRUE,
-		.scrn_start_bit19	= FALSE,
+		.init_sr07		= true,
+		.init_sr1f		= true,
+		.scrn_start_bit19	= false,
 		.sr07			= 0x80,
 		.sr07_1bpp		= 0x80,
 		.sr07_8bpp		= 0x81,
@@ -221,9 +212,9 @@ static const struct cirrusfb_board_info_rec {
 		.maxclock		= {
 			135100, 135100, 85500, 85500, 0
 		},
-		.init_sr07		= TRUE,
-		.init_sr1f		= FALSE,
-		.scrn_start_bit19	= TRUE,
+		.init_sr07		= true,
+		.init_sr1f		= false,
+		.scrn_start_bit19	= true,
 		.sr07			= 0x20,
 		.sr07_1bpp		= 0x20,
 		.sr07_8bpp		= 0x21,
@@ -235,9 +226,9 @@ static const struct cirrusfb_board_info_rec {
 			/* for the GD5430.  GD5446 can do more... */
 			85500, 85500, 50000, 28500, 0
 		},
-		.init_sr07		= TRUE,
-		.init_sr1f		= TRUE,
-		.scrn_start_bit19	= TRUE,
+		.init_sr07		= true,
+		.init_sr1f		= true,
+		.scrn_start_bit19	= true,
 		.sr07			= 0xA0,
 		.sr07_1bpp		= 0xA1,
 		.sr07_1bpp_mux		= 0xA7,
@@ -250,9 +241,9 @@ static const struct cirrusfb_board_info_rec {
 		.maxclock		= {
 			135100, 200000, 200000, 135100, 135100
 		},
-		.init_sr07		= TRUE,
-		.init_sr1f		= TRUE,
-		.scrn_start_bit19	= TRUE,
+		.init_sr07		= true,
+		.init_sr1f		= true,
+		.scrn_start_bit19	= true,
 		.sr07			= 0x10,
 		.sr07_1bpp		= 0x11,
 		.sr07_8bpp		= 0x11,
@@ -264,9 +255,9 @@ static const struct cirrusfb_board_info_rec {
 			/* guess */
 			135100, 135100, 135100, 135100, 135100,
 		},
-		.init_sr07		= FALSE,
-		.init_sr1f		= FALSE,
-		.scrn_start_bit19	= TRUE,
+		.init_sr07		= false,
+		.init_sr1f		= false,
+		.scrn_start_bit19	= true,
 	}
 };
 
@@ -815,7 +806,7 @@ static int cirrusfb_check_var(struct fb_var_screeninfo *var,
 
 	default:
 		DPRINTK("Unsupported bpp size: %d\n", var->bits_per_pixel);
-		assert (FALSE);
+		assert(false);
 		/* should never occur */
 		break;
 	}
@@ -886,7 +877,7 @@ static int cirrusfb_decode_var (const struct fb_var_screeninfo *var,
 
 	default:
 		DPRINTK("Unsupported bpp size: %d\n", var->bits_per_pixel);
-		assert (FALSE);
+		assert(false);
 		/* should never occur */
 		break;
 	}
@@ -3203,7 +3194,7 @@ void cirrusfb_dbg_print_regs (caddr_t regbase, cirrusfb_dbg_reg_class_t reg_clas
 			break;
 		default:
 			/* should never occur */
-			assert (FALSE);
+			assert(false);
 			break;
 		}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
