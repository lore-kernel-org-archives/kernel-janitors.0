From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 14:38:42 +0000
Subject: [PATCH 2/3] drm/gma500: Improve four size determinations
Message-Id: <9165671d-8a07-30e7-c0ee-936e91331297@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <079c31b2-a2e6-cf42-cecb-e1e10dd241f6@users.sourceforge.net>
In-Reply-To: <079c31b2-a2e6-cf42-cecb-e1e10dd241f6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 15:08:39 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/framebuffer.c   | 3 +--
 drivers/gpu/drm/gma500/oaktrail_hdmi.c | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 3ff320f3ff47..ad96a542d137 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -525,11 +525,10 @@ static int psb_fbdev_destroy(struct drm_device *dev, struct psb_fbdev *fbdev)
 
 int psb_fbdev_init(struct drm_device *dev)
 {
-	struct psb_fbdev *fbdev;
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	int ret;
+	struct psb_fbdev *fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
 
-	fbdev = kzalloc(sizeof(struct psb_fbdev), GFP_KERNEL);
 	if (!fbdev)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index d9a6d54b6641..dbc58e5130bb 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -637,11 +637,11 @@ void oaktrail_hdmi_init(struct drm_device *dev,
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 
-	gma_encoder = kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
+	gma_encoder = kzalloc(sizeof(*gma_encoder), GFP_KERNEL);
 	if (!gma_encoder)
 		return;
 
-	gma_connector = kzalloc(sizeof(struct gma_connector), GFP_KERNEL);
+	gma_connector = kzalloc(sizeof(*gma_connector), GFP_KERNEL);
 	if (!gma_connector)
 		goto failed_connector;
 
@@ -689,7 +689,7 @@ void oaktrail_hdmi_setup(struct drm_device *dev)
 	if (!pdev)
 		return;
 
-	hdmi_dev = kzalloc(sizeof(struct oaktrail_hdmi_dev), GFP_KERNEL);
+	hdmi_dev = kzalloc(sizeof(*hdmi_dev), GFP_KERNEL);
 	if (!hdmi_dev)
 		goto out;
 
-- 
2.16.1

