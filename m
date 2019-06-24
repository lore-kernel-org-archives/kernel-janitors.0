From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Jun 2019 22:44:44 +0000
Subject: [PATCH][next] drm/vmwgfx: remove redundant assignment to sub_res
Message-Id: <20190624224444.14099-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable sub_res is initialized to a value that is never read and it
is re-assigned later in a for-loop.  The initialization is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 862ca44680ca..3257ba689d93 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1914,7 +1914,7 @@ static void vmw_surface_tex_dirty_range_add(struct vmw_resource *res,
 	} else {
 		/* Dirty range covers multiple sub-resources */
 		struct svga3dsurface_loc loc_min, loc_max;
-		u32 sub_res = loc1.sub_resource;
+		u32 sub_res;
 
 		svga3dsurface_max_loc(cache, loc1.sub_resource, &loc_max);
 		vmw_subres_dirty_add(dirty, &loc1, &loc_max);
-- 
2.20.1
