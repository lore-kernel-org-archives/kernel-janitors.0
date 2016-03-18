From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Mar 2016 09:02:19 +0000
Subject: [patch] drm/tegra: fixup error handling in tegra_dc_init()
Message-Id: <20160318090219.GB19233@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org

1)  There was a chance that "cursor" or "primary" were error pointers
    leading to an oops.
2)  The error handling wasn't very complete.

When I started working on this, the one err label style error handling
became unwieldy so I just re-wrote it with multiple exit labels.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fb2b4b0..8134e30 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1683,8 +1683,8 @@ static int tegra_dc_init(struct host1x_client *client)
 	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
 	struct tegra_dc *dc = host1x_client_to_dc(client);
 	struct tegra_drm *tegra = drm->dev_private;
-	struct drm_plane *primary = NULL;
-	struct drm_plane *cursor = NULL;
+	struct drm_plane *primary;
+	struct drm_plane *cursor;
 	u32 value;
 	int err;
 
@@ -1706,21 +1706,22 @@ static int tegra_dc_init(struct host1x_client *client)
 	primary = tegra_dc_primary_plane_create(drm, dc);
 	if (IS_ERR(primary)) {
 		err = PTR_ERR(primary);
-		goto cleanup;
+		goto detach_iommu;
 	}
 
+	cursor = NULL;
 	if (dc->soc->supports_cursor) {
 		cursor = tegra_dc_cursor_plane_create(drm, dc);
 		if (IS_ERR(cursor)) {
 			err = PTR_ERR(cursor);
-			goto cleanup;
+			goto cleanup_primary;
 		}
 	}
 
 	err = drm_crtc_init_with_planes(drm, &dc->base, primary, cursor,
 					&tegra_crtc_funcs, NULL);
 	if (err < 0)
-		goto cleanup;
+		goto cleanup_cursor;
 
 	drm_mode_crtc_set_gamma_size(&dc->base, 256);
 	drm_crtc_helper_add(&dc->base, &tegra_crtc_helper_funcs);
@@ -1735,12 +1736,12 @@ static int tegra_dc_init(struct host1x_client *client)
 	err = tegra_dc_rgb_init(drm, dc);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(dc->dev, "failed to initialize RGB output: %d\n", err);
-		goto cleanup;
+		goto cleanup_cursor;
 	}
 
 	err = tegra_dc_add_planes(drm, dc);
 	if (err < 0)
-		goto cleanup;
+		goto rgb_exit;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
 		err = tegra_dc_debugfs_init(dc, drm->primary);
@@ -1753,7 +1754,7 @@ static int tegra_dc_init(struct host1x_client *client)
 	if (err < 0) {
 		dev_err(dc->dev, "failed to request IRQ#%u: %d\n", dc->irq,
 			err);
-		goto cleanup;
+		goto remove_debugfs;
 	}
 
 	/* initialize display controller */
@@ -1799,13 +1800,18 @@ static int tegra_dc_init(struct host1x_client *client)
 
 	return 0;
 
-cleanup:
-	if (cursor)
+remove_debugfs:
+	tegra_dc_debugfs_exit(dc);
+rgb_exit:
+	tegra_dc_rgb_exit(dc);
+cleanup_cursor:
+	if (dc->soc->supports_cursor)
 		drm_plane_cleanup(cursor);
 
-	if (primary)
-		drm_plane_cleanup(primary);
+cleanup_primary:
+	drm_plane_cleanup(primary);
 
+detach_iommu:
 	if (tegra->domain) {
 		iommu_detach_device(tegra->domain, dc->dev);
 		dc->domain = NULL;
