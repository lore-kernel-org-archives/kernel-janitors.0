From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:11 +0000
Subject: [PATCH 03/14] drm/vmwgfx: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-3-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index d492d57d5309..88b72f738639 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -234,7 +234,7 @@ int vmw_du_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
 	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
-	bool shown = du->cursor_surface || du->cursor_dmabuf ? true : false;
+	bool shown = du->cursor_surface || du->cursor_dmabuf;
 
 	du->cursor_x = x + du->set_gui_x;
 	du->cursor_y = y + du->set_gui_y;
-- 
2.11.0

