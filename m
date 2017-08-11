From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Aug 2017 20:16:06 +0000
Subject: [PATCH] drm/omap: Potential NULL deref in omap_crtc_duplicate_state()
Message-Id: <20170811201604.7v7txdmlf4knvdqf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

If the kmalloc() fails then we dereference "state" when we set
"state->zpos".

Fixes: 3dfeb631a15d ("drm/omap: Rework the rotation-on-crtc hack")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 400d0d2f6790..cc85c16cbc2a 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -589,8 +589,10 @@ omap_crtc_duplicate_state(struct drm_crtc *crtc)
 	current_state = to_omap_crtc_state(crtc->state);
 
 	state = kmalloc(sizeof(*state), GFP_KERNEL);
-	if (state)
-		__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
 
 	state->zpos = current_state->zpos;
 	state->rotation = current_state->rotation;
