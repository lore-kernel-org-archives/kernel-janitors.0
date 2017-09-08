From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Sep 2017 13:17:04 +0000
Subject: [PATCH] drm/vc4: clean up error handling on devm_kzalloc failure
Message-Id: <20170908131704.32517-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current error handling on devm_kzalloc failures performs a non-null
check on connector. Thss check is redundant because connector is null
at that failure point.  With this check removed, we may as well make
the failure path into a trivial -ENOMEM return to clean up the error
handling.

Detected by CoverityScan CID#1339527 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 937da8dd65b8..a8808c1a1e03 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -311,14 +311,11 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 {
 	struct drm_connector *connector = NULL;
 	struct vc4_hdmi_connector *hdmi_connector;
-	int ret = 0;
 
 	hdmi_connector = devm_kzalloc(dev->dev, sizeof(*hdmi_connector),
 				      GFP_KERNEL);
-	if (!hdmi_connector) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!hdmi_connector)
+		return ERR_PTR(-ENOMEM);
 	connector = &hdmi_connector->base;
 
 	hdmi_connector->encoder = encoder;
@@ -336,12 +333,6 @@ static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 	drm_mode_connector_attach_encoder(connector, encoder);
 
 	return connector;
-
- fail:
-	if (connector)
-		vc4_hdmi_connector_destroy(connector);
-
-	return ERR_PTR(ret);
 }
 
 static void vc4_hdmi_encoder_destroy(struct drm_encoder *encoder)
-- 
2.14.1

