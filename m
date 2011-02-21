From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 17:16:43 +0000
Subject: [PATCH 1/3] Staging: xgifb: Remove all the references to XGIfb_accel
Message-Id: <1298308605-31690-2-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

xgifb framebuffer driver has an option to use an accelerator engine that never
get used (XGIfb_accel is always 0).

An earlier patchset remove the code that depends on the accelerator being
activated. This patch removes all the references to XGIfb_accel.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGI_accel.h   |    1 -
 drivers/staging/xgifb/XGI_main_26.c |   17 +----------------
 2 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_accel.h b/drivers/staging/xgifb/XGI_accel.h
index 3087e90..6cecdf7 100644
--- a/drivers/staging/xgifb/XGI_accel.h
+++ b/drivers/staging/xgifb/XGI_accel.h
@@ -478,7 +478,6 @@ int fbcon_XGI_sync(struct fb_info *info);
 
 extern struct video_info xgi_video_info;
 
-extern int XGIfb_accel;
 void fbcon_XGI_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 void fbcon_XGI_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 
diff --git a/drivers/staging/xgifb/XGI_main_26.c b/drivers/staging/xgifb/XGI_main_26.c
index 7f821ae..b52e11f 100644
--- a/drivers/staging/xgifb/XGI_main_26.c
+++ b/drivers/staging/xgifb/XGI_main_26.c
@@ -43,8 +43,6 @@
 #include "XGI_main.h"
 #include "vb_util.h"
 
-int XGIfb_accel = 0;
-
 #define Index_CR_GPIO_Reg1 0x48
 #define Index_CR_GPIO_Reg2 0x49
 #define Index_CR_GPIO_Reg3 0x4a
@@ -1190,10 +1188,6 @@ static int XGIfb_do_set_var(struct fb_var_screeninfo *var, int isactive,
 		xgi_video_info.video_linelength = info->var.xres_virtual
 				* (xgi_video_info.video_bpp >> 3);
 		xgi_video_info.accel = 0;
-		if (XGIfb_accel) {
-			xgi_video_info.accel = (var->accel_flags
-					& FB_ACCELF_TEXT) ? -1 : 0;
-		}
 		switch (xgi_video_info.video_bpp) {
 		case 8:
 			xgi_video_info.DstColor = 0x0000;
@@ -2856,8 +2850,6 @@ XGIINITSTATIC int __init XGIfb_setup(char *options)
 				printk(KERN_INFO "XGIfb: Illegal pdc parameter\n");
 				XGIfb_pdc = 0;
 			}
-		} else if (!strncmp(this_opt, "noaccel", 7)) {
-			XGIfb_accel = 0;
 		} else if (!strncmp(this_opt, "noypan", 6)) {
 			XGIfb_ypan = 0;
 		} else if (!strncmp(this_opt, "userom:", 7)) {
@@ -2872,11 +2864,9 @@ XGIINITSTATIC int __init XGIfb_setup(char *options)
 		/* TW: Acceleration only with MMIO mode */
 		if ((XGIfb_queuemode != -1) && (XGIfb_queuemode != MMIO_CMD)) {
 			XGIfb_ypan = 0;
-			XGIfb_accel = 0;
 		}
 		/* TW: Panning only with acceleration */
-		if (XGIfb_accel = 0)
-			XGIfb_ypan = 0;
+		XGIfb_ypan = 0;
 
 	}
 	printk("\nxgifb: outa xgifb_setup 3450");
@@ -3370,11 +3360,6 @@ static int __devinit xgifb_probe(struct pci_dev *pdev,
 		}
 
 		xgi_video_info.accel = 0;
-		if (XGIfb_accel) {
-			xgi_video_info.accel = -1;
-			default_var.accel_flags |= FB_ACCELF_TEXT;
-			XGIfb_initaccel();
-		}
 
 		fb_info->flags = FBINFO_FLAG_DEFAULT;
 		fb_info->var = default_var;
-- 
1.7.0.4

