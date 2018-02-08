From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 18:36:11 +0000
Subject: [PATCH] drm_fb_cma_helper: Delete an error message for a failed memory allocation in drm_fbdev_cma_i
Message-Id: <b42a3095-fc99-1ee4-b3d7-2a71277454d9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 19:30:06 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_fb_cma_helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index 186d00adfb5f..59f0d8dbfa61 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -408,10 +408,9 @@ struct drm_fbdev_cma *drm_fbdev_cma_init_with_funcs(struct drm_device *dev,
 	int ret;
 
 	fbdev_cma = kzalloc(sizeof(*fbdev_cma), GFP_KERNEL);
-	if (!fbdev_cma) {
-		dev_err(dev->dev, "Failed to allocate drm fbdev.\n");
+	if (!fbdev_cma)
 		return ERR_PTR(-ENOMEM);
-	}
+
 	fbdev_cma->fb_funcs = funcs;
 
 	helper = &fbdev_cma->fb_helper;
-- 
2.16.1

