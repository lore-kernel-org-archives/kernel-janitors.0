From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jun 2020 16:44:05 +0000
Subject: [PATCH] drm/fbdev: fix a memory leak on the dmt_mode object
Message-Id: <20200617164405.232639-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Object drm_mode is allocated by the call to drm_mode_find_dmt
(via the call to drm_mode_duplicate and drm_mode_create). The
object is never free'd and hence causes a small memory leak.
Fix this by kfree'ing drm_mode once it is no longer required.

Addresses-Coverity: ("Resource leak")
Fixes: 1d42bbc8f7f9 ("drm/fbdev: fix cloning on fbcon")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index b7e9e1c2564c..c0119e4db045 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -324,6 +324,8 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 			can_clone = false;
 	}
 
+	kfree(dmt_mode);
+
 	if (can_clone) {
 		DRM_DEBUG_KMS("can clone using 1024x768\n");
 		return true;
-- 
2.27.0.rc0
