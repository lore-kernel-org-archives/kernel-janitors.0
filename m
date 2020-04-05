From: Colin King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 12:13:47 +0000
Subject: [PATCH][next] drm/vmwgfx: remove redundant assignment to variable ret
Message-Id: <20200405121347.370645-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 7ef51fa84b01..126f93c0b0b8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1651,7 +1651,7 @@ vmw_gb_surface_reference_internal(struct drm_device *dev,
 	struct vmw_surface_metadata *metadata;
 	struct ttm_base_object *base;
 	uint32_t backup_handle;
-	int ret = -EINVAL;
+	int ret;
 
 	ret = vmw_surface_handle_reference(dev_priv, file_priv, req->sid,
 					   req->handle_type, &base);
-- 
2.25.1
