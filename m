From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 09:09:05 +0000
Subject: [PATCH 1/3] Staging: xgifb: Removes dead code
Message-Id: <1298279347-8825-2-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

xgifb staging driver has code that dependens on XGIfb_accel != 0.
But as Dan Carpenter noticed, XGIfb_accel value is always 0 in current driver.
So there is code that never gets executed.

This patch removes this dead code.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGI_accel.c |   57 ++-----------------------------------
 1 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_accel.c b/drivers/staging/xgifb/XGI_accel.c
index 7954974..7f485fe 100644
--- a/drivers/staging/xgifb/XGI_accel.c
+++ b/drivers/staging/xgifb/XGI_accel.c
@@ -216,73 +216,22 @@ void XGIfb_syncaccel(void)
 
 int fbcon_XGI_sync(struct fb_info *info)
 {
-    if(!XGIfb_accel) return 0;
-    CRITFLAGS
-
-    XGI310Sync();
-
-   CRITEND
-   return 0;
+	return 0;
 }
 
 void fbcon_XGI_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 {
-   int col=0;
-   CRITFLAGS
-
-
-   if(!rect->width || !rect->height)
-   	return;
+	if (!rect->width || !rect->height)
+		return;
 
-   if(!XGIfb_accel) {
 	cfb_fillrect(info, rect);
 	return;
-   }
-
-   switch(info->var.bits_per_pixel) {
-		case 8: col = rect->color;
-			break;
-		case 16: col = ((u32 *)(info->pseudo_palette))[rect->color];
-			 break;
-		case 32: col = ((u32 *)(info->pseudo_palette))[rect->color];
-			 break;
-	}
-
-
-	   CRITBEGIN
-	   XGI310SetupForSolidFill(col, myrops[rect->rop], 0);
-	   XGI310SubsequentSolidFillRect(rect->dx, rect->dy, rect->width, rect->height);
-	   CRITEND
-	   XGI310Sync();
-
-
 }
 
 void fbcon_XGI_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 {
-   int xdir, ydir;
-   CRITFLAGS
-
-
-   if(!XGIfb_accel) {
    	cfb_copyarea(info, area);
 	return;
-   }
-
-   if(!area->width || !area->height)
-   	return;
-
-   if(area->sx < area->dx) xdir = 0;
-   else                    xdir = 1;
-   if(area->sy < area->dy) ydir = 0;
-   else                    ydir = 1;
-
-      CRITBEGIN
-      XGI310SetupForScreenToScreenCopy(xdir, ydir, 3, 0, -1);
-      XGI310SubsequentScreenToScreenCopy(area->sx, area->sy, area->dx, area->dy, area->width, area->height);
-      CRITEND
-      XGI310Sync();
-
 }
 
 
-- 
1.7.0.4

