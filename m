From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jun 2020 10:34:37 +0000
Subject: [PATCH] drm/vmwgfx: Use correct vmw_legacy_display_unit pointer
Message-Id: <20200626103437.GB314359@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Jakob Bornecrantz <jakob@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>

The "entry" pointer is an offset from the list head and it doesn't
point to a valid vmw_legacy_display_unit struct.  Presumably the
intent was to point to the last entry.

Also the "i++" wasn't used so I have removed that as well.

Fixes: d7e1958dbe4a ("drm/vmwgfx: Support older hardware.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.  This bug celebrated its tenth
birthday last month.  :)

 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 16dafff5cab1..009f1742bed5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -81,7 +81,7 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 	struct vmw_legacy_display_unit *entry;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_crtc *crtc = NULL;
-	int i = 0;
+	int i;
 
 	/* If there is no display topology the host just assumes
 	 * that the guest will set the same layout as the host.
@@ -92,12 +92,11 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 			crtc = &entry->base.crtc;
 			w = max(w, crtc->x + crtc->mode.hdisplay);
 			h = max(h, crtc->y + crtc->mode.vdisplay);
-			i++;
 		}
 
 		if (crtc = NULL)
 			return 0;
-		fb = entry->base.crtc.primary->state->fb;
+		fb = crtc->primary->state->fb;
 
 		return vmw_kms_write_svga(dev_priv, w, h, fb->pitches[0],
 					  fb->format->cpp[0] * 8,
-- 
2.27.0
