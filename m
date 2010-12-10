From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Dec 2010 12:39:34 +0000
Subject: [patch] [media] zoran: bit-wise vs logical and
Message-Id: <20101210123934.GB10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

zr->frame_num is a counter and && was intended here instead of &.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/zoran/zoran_device.c b/drivers/media/video/zoran/zoran_device.c
index b02007e..e8a2784 100644
--- a/drivers/media/video/zoran/zoran_device.c
+++ b/drivers/media/video/zoran/zoran_device.c
@@ -1523,7 +1523,7 @@ zoran_irq (int             irq,
 		    zr->JPEG_missed > 25 ||
 		    zr->JPEG_error = 1	||
 		    ((zr->codec_mode = BUZ_MODE_MOTION_DECOMPRESS) &&
-		     (zr->frame_num & (zr->JPEG_missed > zr->jpg_settings.field_per_buff)))) {
+		     (zr->frame_num && (zr->JPEG_missed > zr->jpg_settings.field_per_buff)))) {
 			error_handler(zr, astat, stat);
 		}
 
