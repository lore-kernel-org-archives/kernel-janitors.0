From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Feb 2017 19:56:24 +0000
Subject: [PATCH] drm/vc4: simplify exit path of a failed allocation of dsi_connector
Message-Id: <20170203195624.7189-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

If dsi_connector fails to allocate, the exit path via label 'fail'
checks if connector is null, which it always is, so the cleanup
that destroys connector is never going to be called.  Hence the
failure path can be more optimally performed by removing this
and just returning ERR_PTR(-ENOMEM).  This also removes the need
to initialize connector to NULL, and we can also remove ret too.

Detected by CoverityScan, CID#1399504 ("Logicall Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 2736b03..e328cb86 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -771,16 +771,14 @@ static const struct drm_connector_helper_funcs vc4_dsi_connector_helper_funcs  static struct drm_connector *vc4_dsi_connector_init(struct drm_device *dev,
 						    struct vc4_dsi *dsi)
 {
-	struct drm_connector *connector = NULL;
+	struct drm_connector *connector;
 	struct vc4_dsi_connector *dsi_connector;
-	int ret = 0;
 
 	dsi_connector = devm_kzalloc(dev->dev, sizeof(*dsi_connector),
 				     GFP_KERNEL);
-	if (!dsi_connector) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!dsi_connector)
+		return ERR_PTR(-ENOMEM);
+
 	connector = &dsi_connector->base;
 
 	dsi_connector->dsi = dsi;
@@ -796,12 +794,6 @@ static struct drm_connector *vc4_dsi_connector_init(struct drm_device *dev,
 	drm_mode_connector_attach_encoder(connector, dsi->encoder);
 
 	return connector;
-
-fail:
-	if (connector)
-		vc4_dsi_connector_destroy(connector);
-
-	return ERR_PTR(ret);
 }
 
 static void vc4_dsi_encoder_destroy(struct drm_encoder *encoder)
-- 
2.10.2

