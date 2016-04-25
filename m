From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Apr 2016 09:04:54 +0000
Subject: [patch] drm: atmel-hlcdc: fix a NULL check
Message-Id: <20160425090454.GA25366@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

If kmalloc() returned NULL we would end up dereferencing "state" a
couple lines later.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 8df0aaf..867069b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -415,8 +415,9 @@ atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
 		return NULL;
 
 	state = kmalloc(sizeof(*state), GFP_KERNEL);
-	if (state)
-		__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
+	if (!state)
+		return NULL;
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
 
 	cur = drm_crtc_state_to_atmel_hlcdc_crtc_state(crtc->state);
 	state->output_mode = cur->output_mode;
