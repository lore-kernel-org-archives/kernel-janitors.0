From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 14:37:28 +0000
Subject: [PATCH 1/3] drm/gma500: Delete an error message for a failed memory allocation in two functions
Message-Id: <bfd6d815-3c09-9faf-e85f-fe837c38bd4a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <079c31b2-a2e6-cf42-cecb-e1e10dd241f6@users.sourceforge.net>
In-Reply-To: <079c31b2-a2e6-cf42-cecb-e1e10dd241f6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 14:55:49 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/framebuffer.c   | 4 +---
 drivers/gpu/drm/gma500/oaktrail_hdmi.c | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index cb0a2ae916e0..3ff320f3ff47 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -530,10 +530,8 @@ int psb_fbdev_init(struct drm_device *dev)
 	int ret;
 
 	fbdev = kzalloc(sizeof(struct psb_fbdev), GFP_KERNEL);
-	if (!fbdev) {
-		dev_err(dev->dev, "no memory\n");
+	if (!fbdev)
 		return -ENOMEM;
-	}
 
 	dev_priv->fbdev = fbdev;
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index 8b2eb32ee988..d9a6d54b6641 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -690,11 +690,8 @@ void oaktrail_hdmi_setup(struct drm_device *dev)
 		return;
 
 	hdmi_dev = kzalloc(sizeof(struct oaktrail_hdmi_dev), GFP_KERNEL);
-	if (!hdmi_dev) {
-		dev_err(dev->dev, "failed to allocate memory\n");
+	if (!hdmi_dev)
 		goto out;
-	}
-
 
 	ret = pci_enable_device(pdev);
 	if (ret) {
-- 
2.16.1

