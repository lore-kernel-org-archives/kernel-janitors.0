From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jun 2020 10:39:59 +0000
Subject: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
Message-Id: <20200626103959.GC314359@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: Sinclair Yeh <syeh@vmware.com>, David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

These if statements are supposed to be true if we ended the
list_for_each_entry() loops without hitting a break statement but they
don't work.

In the first loop, we increment "i" after the "if (i = unit)" condition
so we don't necessarily know that "i" is not equal to unit at the end of
the loop.

In the second loop we exit when mode is not pointing to a valid
drm_display_mode struct so it doesn't make sense to check "mode->type".

Fixes: a278724aa23c ("drm/vmwgfx: Implement fbdev on kms v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I reversed the second condition as well, just because I was copy and
pasting the exit condition.  Plus I always feel like error handling is
better than success handling.  If anyone feel strongly, then I can send
a v2.

 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 3c97654b5a43..44168a7d7b44 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2576,7 +2576,7 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
 		++i;
 	}
 
-	if (i != unit) {
+	if (&con->head = &dev_priv->dev->mode_config.connector_list) {
 		DRM_ERROR("Could not find initial display unit.\n");
 		ret = -EINVAL;
 		goto out_unlock;
@@ -2600,13 +2600,13 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
 			break;
 	}
 
-	if (mode->type & DRM_MODE_TYPE_PREFERRED)
-		*p_mode = mode;
-	else {
+	if (&mode->head = &con->modes) {
 		WARN_ONCE(true, "Could not find initial preferred mode.\n");
 		*p_mode = list_first_entry(&con->modes,
 					   struct drm_display_mode,
 					   head);
+	} else {
+		*p_mode = mode;
 	}
 
  out_unlock:
-- 
2.27.0
