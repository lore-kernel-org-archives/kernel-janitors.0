From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 09:09:06 +0000
Subject: [PATCH 2/3] Staging: xgifb: Remove unused functions
Message-Id: <1298279347-8825-3-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Earlier patch removed code that never got executed because it depended on
XGIfb_accel variable value to de distinct than 0. But this variable is
always 0 in current driver.

That dead code used a set of functions that not remains unused.

This patch removes these unused functions.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/xgifb/XGI_accel.c |   96 -------------------------------------
 1 files changed, 0 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_accel.c b/drivers/staging/xgifb/XGI_accel.c
index 7f485fe..e6241fe 100644
--- a/drivers/staging/xgifb/XGI_accel.c
+++ b/drivers/staging/xgifb/XGI_accel.c
@@ -99,102 +99,6 @@ XGI310Sync(void)
 	XGI310Idle
 }
 
-/* 310/325 series ------------------------------------------------ */
-
-static void
-XGI310SetupForScreenToScreenCopy(int xdir, int ydir, int rop,
-                                unsigned int planemask, int trans_color)
-{
-	XGI310SetupDSTColorDepth(xgi_video_info.DstColor);
-	XGI310SetupSRCPitch(xgi_video_info.video_linelength)
-	XGI310SetupDSTRect(xgi_video_info.video_linelength, 0xFFF)
-	if (trans_color != -1) {
-		XGI310SetupROP(0x0A)
-		XGI310SetupSRCTrans(trans_color)
-		XGI310SetupCMDFlag(TRANSPARENT_BITBLT)
-	} else {
-	        XGI310SetupROP(XGIALUConv[rop])
-		/* Set command - not needed, both 0 */
-		/* XGISetupCMDFlag(BITBLT | SRCVIDEO) */
-	}
-	XGI310SetupCMDFlag(xgi_video_info.XGI310_AccelDepth)
-	/* TW: The 310/325 series is smart enough to know the direction */
-}
-
-static void
-XGI310SubsequentScreenToScreenCopy(int src_x, int src_y, int dst_x, int dst_y,
-                                int width, int height)
-{
-	long srcbase, dstbase;
-	int mymin, mymax;
-
-	srcbase = dstbase = 0;
-	mymin = min(src_y, dst_y);
-	mymax = max(src_y, dst_y);
-
-	/* Although the chip knows the direction to use
-	 * if the source and destination areas overlap,
-	 * that logic fails if we fiddle with the bitmap
-	 * addresses. Therefore, we check if the source
-	 * and destination blitting areas overlap and
-	 * adapt the bitmap addresses synchronously
-	 * if the coordinates exceed the valid range.
-	 * The the areas do not overlap, we do our
-	 * normal check.
-	 */
-	if((mymax - mymin) < height) {
-	   if((src_y >= 2048) || (dst_y >= 2048)) {
-	      srcbase = xgi_video_info.video_linelength * mymin;
-	      dstbase = xgi_video_info.video_linelength * mymin;
-	      src_y -= mymin;
-	      dst_y -= mymin;
-	   }
-	} else {
-	   if(src_y >= 2048) {
-	      srcbase = xgi_video_info.video_linelength * src_y;
-	      src_y = 0;
-	   }
-	   if(dst_y >= 2048) {
-	      dstbase = xgi_video_info.video_linelength * dst_y;
-	      dst_y = 0;
-	   }
-	}
-
-	XGI310SetupSRCBase(srcbase);
-	XGI310SetupDSTBase(dstbase);
-	XGI310SetupRect(width, height)
-	XGI310SetupSRCXY(src_x, src_y)
-	XGI310SetupDSTXY(dst_x, dst_y)
-	XGI310DoCMD
-}
-
-static void
-XGI310SetupForSolidFill(int color, int rop, unsigned int planemask)
-{
-	XGI310SetupPATFG(color)
-	XGI310SetupDSTRect(xgi_video_info.video_linelength, 0xFFF)
-	XGI310SetupDSTColorDepth(xgi_video_info.DstColor);
-	XGI310SetupROP(XGIPatALUConv[rop])
-	XGI310SetupCMDFlag(PATFG | xgi_video_info.XGI310_AccelDepth)
-}
-
-static void
-XGI310SubsequentSolidFillRect(int x, int y, int w, int h)
-{
-	long dstbase;
-
-	dstbase = 0;
-	if(y >= 2048) {
-		dstbase = xgi_video_info.video_linelength * y;
-		y = 0;
-	}
-	XGI310SetupDSTBase(dstbase)
-	XGI310SetupDSTXY(x,y)
-	XGI310SetupRect(w,h)
-	XGI310SetupCMDFlag(BITBLT)
-	XGI310DoCMD
-}
-
 /* --------------------------------------------------------------------- */
 
 /* The exported routines */
-- 
1.7.0.4

