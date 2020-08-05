From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 12:42:27 +0000
Subject: [PATCH] drm/gma500: fix spelling mistake "pannel" -> "panel"
Message-Id: <20200805124227.20005-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There a handful of spelling mistakes. fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/gma500/mdfld_dsi_output.c | 4 ++--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
index f350ac1ead18..2f3486f32fed 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
@@ -366,7 +366,7 @@ static enum drm_mode_status mdfld_dsi_connector_mode_valid(struct drm_connector
 	/**
 	 * FIXME: current DC has no fitting unit, reject any mode setting
 	 * request
-	 * Will figure out a way to do up-scaling(pannel fitting) later.
+	 * Will figure out a way to do up-scaling(panel fitting) later.
 	 **/
 	if (fixed_mode) {
 		if (mode->hdisplay != fixed_mode->hdisplay)
@@ -531,7 +531,7 @@ void mdfld_dsi_output_init(struct drm_device *dev,
 	dsi_config->connector = dsi_connector;
 
 	if (!dsi_config->fixed_mode) {
-		DRM_ERROR("No pannel fixed mode was found\n");
+		DRM_ERROR("No panel fixed mode was found\n");
 		goto dsi_init_err0;
 	}
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 06e44f47e73e..907f966d6f22 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -125,7 +125,7 @@ struct psb_intel_sdvo {
 	bool is_lvds;
 
 	/**
-	 * This is sdvo fixed pannel mode pointer
+	 * This is sdvo fixed panel mode pointer
 	 */
 	struct drm_display_mode *sdvo_lvds_fixed_mode;
 
-- 
2.27.0
