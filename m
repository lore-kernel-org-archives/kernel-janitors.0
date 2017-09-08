From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Sep 2017 14:05:04 +0000
Subject: [PATCH][V2] drm/vc4: clean up error handling on devm_kzalloc failure
Message-Id: <20170908140504.1340-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current error handling when devm_kzalloc fails performs a
non-null check on connector which is redundant because connector
is null at that failure point.  Once this is removed, make the
failure path into a trivial -ENOMEM return to clean up the
error handling. Also remove need to initialize connector to NULL.

Detected by CoverityScan CID#1339527 ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 937da8dd65b8..fa37a1c07cf6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -309,16 +309,13 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs  static struct drm_connector *vc4_hdmi_connector_init(struct drm_device *dev,
 						     struct drm_encoder *encoder)
 {
-	struct drm_connector *connector = NULL;
+	struct drm_connector *connector;
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

