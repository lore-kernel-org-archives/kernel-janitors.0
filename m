From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 17:44:35 +0000
Subject: [PATCHv2 3/3] Staging: xgifb: Remove unused function fbcon_XGI_sync
Message-Id: <1298310275-32727-1-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Due a cleanup in earlier patches, the function fbcon_XGI_sync now does nothing
so it has to be removed.

This patches removes the unused function.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---

v2: Remove the .fb_sync member instead of explicitly set it to NULL
suggested by Dan Carpenter.

 drivers/staging/xgifb/XGI_accel.c   |    5 -----
 drivers/staging/xgifb/XGI_main.h    |    1 -
 drivers/staging/xgifb/XGI_main_26.c |    1 -
 3 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_accel.c b/drivers/staging/xgifb/XGI_accel.c
index 7c69e07..905b34a 100644
--- a/drivers/staging/xgifb/XGI_accel.c
+++ b/drivers/staging/xgifb/XGI_accel.c
@@ -115,11 +115,6 @@ void XGIfb_syncaccel(void)
 
 }
 
-int fbcon_XGI_sync(struct fb_info *info)
-{
-	return 0;
-}
-
 void fbcon_XGI_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 {
 	if (!rect->width || !rect->height)
diff --git a/drivers/staging/xgifb/XGI_main.h b/drivers/staging/xgifb/XGI_main.h
index e8e2bfe..1b45414 100644
--- a/drivers/staging/xgifb/XGI_main.h
+++ b/drivers/staging/xgifb/XGI_main.h
@@ -797,7 +797,6 @@ extern void     fbcon_XGI_fillrect(struct fb_info *info,
                                    const struct fb_fillrect *rect);
 extern void     fbcon_XGI_copyarea(struct fb_info *info,
                                    const struct fb_copyarea *area);
-extern int      fbcon_XGI_sync(struct fb_info *info);
 
 static int XGIfb_ioctl(struct fb_info *info, unsigned int cmd,
 			    unsigned long arg);
diff --git a/drivers/staging/xgifb/XGI_main_26.c b/drivers/staging/xgifb/XGI_main_26.c
index b52e11f..c77ac4a 100644
--- a/drivers/staging/xgifb/XGI_main_26.c
+++ b/drivers/staging/xgifb/XGI_main_26.c
@@ -1741,7 +1741,6 @@ static struct fb_ops XGIfb_ops = {
 	.fb_fillrect = fbcon_XGI_fillrect,
 	.fb_copyarea = fbcon_XGI_copyarea,
 	.fb_imageblit = cfb_imageblit,
-	.fb_sync = fbcon_XGI_sync,
 	.fb_ioctl = XGIfb_ioctl,
 	/* .fb_mmap = XGIfb_mmap, */
 };
-- 
1.7.0.4

