From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 20 Feb 2011 16:53:17 +0000
Subject: [PATCH 1/2] Staging: xgifb: Remove CRIT[FLAGS | BEGIN | END] defines usage
Message-Id: <1298220798-2942-2-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Bill Pemberton <wfp5p@virginia.edu>, Arnaud Patard <apatard@mandriva.com>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Javier Martinez Canillas <martinez.javier@gmail.com>


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGI_accel.c |   43 ++++++++++++++++++++----------------
 1 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_accel.c b/drivers/staging/xgifb/XGI_accel.c
index 7954974..6ef2148 100644
--- a/drivers/staging/xgifb/XGI_accel.c
+++ b/drivers/staging/xgifb/XGI_accel.c
@@ -216,19 +216,21 @@ void XGIfb_syncaccel(void)
 
 int fbcon_XGI_sync(struct fb_info *info)
 {
-    if(!XGIfb_accel) return 0;
-    CRITFLAGS
+	unsigned long critflags = 0;
 
-    XGI310Sync();
+	if (!XGIfb_accel)
+		return 0;
+
+	XGI310Sync();
 
-   CRITEND
-   return 0;
+	spin_unlock_irqrestore(&xgi_video_info.lockaccel, critflags);
+	return 0;
 }
 
 void fbcon_XGI_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 {
-   int col=0;
-   CRITFLAGS
+	int col = 0;
+	unsigned long critflags;
 
 
    if(!rect->width || !rect->height)
@@ -249,19 +251,20 @@ void fbcon_XGI_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 	}
 
 
-	   CRITBEGIN
-	   XGI310SetupForSolidFill(col, myrops[rect->rop], 0);
-	   XGI310SubsequentSolidFillRect(rect->dx, rect->dy, rect->width, rect->height);
-	   CRITEND
-	   XGI310Sync();
+	spin_lock_irqsave(&xgi_video_info.lockaccel, critflags);
+	XGI310SetupForSolidFill(col, myrops[rect->rop], 0);
+	XGI310SubsequentSolidFillRect(rect->dx, rect->dy, rect->width,
+				      rect->height);
+	spin_unlock_irqrestore(&xgi_video_info.lockaccel, critflags);
+	XGI310Sync();
 
 
 }
 
 void fbcon_XGI_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 {
-   int xdir, ydir;
-   CRITFLAGS
+	int xdir, ydir;
+	unsigned long critflags;
 
 
    if(!XGIfb_accel) {
@@ -277,11 +280,13 @@ void fbcon_XGI_copyarea(struct fb_info *info, const struct fb_copyarea *area)
    if(area->sy < area->dy) ydir = 0;
    else                    ydir = 1;
 
-      CRITBEGIN
-      XGI310SetupForScreenToScreenCopy(xdir, ydir, 3, 0, -1);
-      XGI310SubsequentScreenToScreenCopy(area->sx, area->sy, area->dx, area->dy, area->width, area->height);
-      CRITEND
-      XGI310Sync();
+	spin_lock_irqsave(&xgi_video_info.lockaccel, critflags);
+	XGI310SetupForScreenToScreenCopy(xdir, ydir, 3, 0, -1);
+	XGI310SubsequentScreenToScreenCopy(area->sx, area->sy, area->dx,
+					   area->dy, area->width,
+					   area->height);
+	spin_unlock_irqrestore(&xgi_video_info.lockaccel, critflags);
+	XGI310Sync();
 
 }
 
-- 
1.7.2.3

