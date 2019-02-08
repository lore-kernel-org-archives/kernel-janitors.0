From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Feb 2019 16:03:33 +0000
Subject: [PATCH] gma500: fix some indentation issues
Message-Id: <20190208160333.24637-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several statements that are indented incorrectly. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 ++---
 drivers/gpu/drm/gma500/mid_bios.c     | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 90ed20083009..52b18410fdef 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1528,8 +1528,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 	clock_recovery = false;
 
 	DRM_DEBUG_KMS("Start train\n");
-		reg = DP | DP_LINK_TRAIN_PAT_1;
-
+	reg = DP | DP_LINK_TRAIN_PAT_1;
 
 	for (;;) {
 		/* Use intel_dp->train_set[0] to set the voltage and pre emphasis values */
@@ -1604,7 +1603,7 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 	channel_eq = false;
 
 	DRM_DEBUG_KMS("\n");
-		reg = DP | DP_LINK_TRAIN_PAT_2;
+	reg = DP | DP_LINK_TRAIN_PAT_2;
 
 	for (;;) {
 
diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index 237041a37532..0b47c1b202db 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -63,7 +63,7 @@ static void mid_get_fuse_settings(struct drm_device *dev)
 		 dev_priv->iLVDS_enable ? "LVDS display" : "MIPI display");
 
 	 /* Prevent runtime suspend at start*/
-	 if (dev_priv->iLVDS_enable) {
+	if (dev_priv->iLVDS_enable) {
 		dev_priv->is_lvds_on = true;
 		dev_priv->is_mipi_on = false;
 	} else {
-- 
2.20.1
