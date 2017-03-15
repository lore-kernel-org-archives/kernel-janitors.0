From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:09 +0000
Subject: [PATCH 01/14] omapfb/dss: remove unneeded conversions to bool
Message-Id: <20170315162322.12096-1-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 7a75dfda9845..93d49cd8b42a 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -1646,7 +1646,7 @@ static void dispc_ovl_set_scaling_uv(enum omap_plane plane,
 {
 	int scale_x = out_width != orig_width;
 	int scale_y = out_height != orig_height;
-	bool chroma_upscale = plane != OMAP_DSS_WB ? true : false;
+	bool chroma_upscale = plane != OMAP_DSS_WB;
 
 	if (!dss_has_feature(FEAT_HANDLE_UV_SEPARATE))
 		return;
@@ -3109,9 +3109,9 @@ static bool _dispc_mgr_pclk_ok(enum omap_channel channel,
 		unsigned long pclk)
 {
 	if (dss_mgr_is_lcd(channel))
-		return pclk <= dispc.feat->max_lcd_pclk ? true : false;
+		return pclk <= dispc.feat->max_lcd_pclk;
 	else
-		return pclk <= dispc.feat->max_tv_pclk ? true : false;
+		return pclk <= dispc.feat->max_tv_pclk;
 }
 
 bool dispc_mgr_timings_ok(enum omap_channel channel,
-- 
2.11.0

