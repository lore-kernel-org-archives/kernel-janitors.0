From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 16:02:30 +0000
Subject: [PATCH 2/2] drm/rcar-du: Adjust 14 checks for null pointers
Message-Id: <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
In-Reply-To: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 17:47:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c   | 6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 6 +++---
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 301ea1a8018e..67567af6e348 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -410,7 +410,7 @@ void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc)
 	rcrtc->event = NULL;
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 
-	if (event = NULL)
+	if (!event)
 		return;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d2f29e6b1112..cf80476783bf 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -318,7 +318,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 
 	/* Allocate and initialize the R-Car device structure. */
 	rcdu = devm_kzalloc(&pdev->dev, sizeof(*rcdu), GFP_KERNEL);
-	if (rcdu = NULL)
+	if (!rcdu)
 		return -ENOMEM;
 
 	rcdu->dev = &pdev->dev;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ba8d2804c1d1..8a9f7fa69ecc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -166,7 +166,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	int ret;
 
 	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
-	if (renc = NULL)
+	if (!renc)
 		return -ENOMEM;
 
 	renc->output = output;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index d2c80cc9f8ee..f87c11a3df6c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -181,7 +181,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 	unsigned int i;
 
 	format = rcar_du_format_info(mode_cmd->pixel_format);
-	if (format = NULL) {
+	if (!format) {
 		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
 			mode_cmd->pixel_format);
 		return ERR_PTR(-EINVAL);
@@ -419,7 +419,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
 {
 	rcdu->props.alpha  		drm_property_create_range(rcdu->ddev, 0, "alpha", 0, 255);
-	if (rcdu->props.alpha = NULL)
+	if (!rcdu->props.alpha)
 		return -ENOMEM;
 
 	/*
@@ -430,7 +430,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
 	rcdu->props.colorkey  		drm_property_create_range(rcdu->ddev, 0, "colorkey",
 					  0, 0x01ffffff);
-	if (rcdu->props.colorkey = NULL)
+	if (!rcdu->props.colorkey)
 		return -ENOMEM;
 
 	return 0;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
index b373ad48ef5f..189e71b3d5d4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
@@ -63,7 +63,7 @@ int rcar_du_lvds_connector_init(struct rcar_du_device *rcdu,
 	int ret;
 
 	rcon = devm_kzalloc(rcdu->dev, sizeof(*rcon), GFP_KERNEL);
-	if (rcon = NULL)
+	if (!rcon)
 		return -ENOMEM;
 
 	connector = &rcon->connector;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index 12d22f3db1af..ab2576e5d700 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -253,7 +253,7 @@ int rcar_du_lvdsenc_init(struct rcar_du_device *rcdu)
 
 	for (i = 0; i < rcdu->info->num_lvds; ++i) {
 		lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
-		if (lvds = NULL)
+		if (!lvds)
 			return -ENOMEM;
 
 		lvds->dev = rcdu;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 61833cc1c699..f48a990214ed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -584,7 +584,7 @@ static int rcar_du_plane_atomic_check(struct drm_plane *plane,
 	}
 
 	rstate->format = rcar_du_format_info(state->fb->format->format);
-	if (rstate->format = NULL) {
+	if (!rstate->format) {
 		dev_dbg(rcdu->dev, "%s: unsupported format %08x\n", __func__,
 			state->fb->format->format);
 		return -EINVAL;
@@ -637,7 +637,7 @@ rcar_du_plane_atomic_duplicate_state(struct drm_plane *plane)
 
 	state = to_rcar_plane_state(plane->state);
 	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
-	if (copy = NULL)
+	if (!copy)
 		return NULL;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
@@ -662,7 +662,7 @@ static void rcar_du_plane_reset(struct drm_plane *plane)
 	}
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state = NULL)
+	if (!state)
 		return;
 
 	state->hwindex = -1;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 2c96147bc444..e8e261362d9a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -283,7 +283,7 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 	}
 
 	rstate->format = rcar_du_format_info(state->fb->format->format);
-	if (rstate->format = NULL) {
+	if (!rstate->format) {
 		dev_dbg(rcdu->dev, "%s: unsupported format %08x\n", __func__,
 			state->fb->format->format);
 		return -EINVAL;
@@ -323,7 +323,7 @@ rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
 
 	state = to_rcar_vsp_plane_state(plane->state);
 	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
-	if (copy = NULL)
+	if (!copy)
 		return NULL;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
@@ -348,7 +348,7 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
 	}
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state = NULL)
+	if (!state)
 		return;
 
 	state->alpha = 255;
-- 
2.14.3

