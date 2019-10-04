From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Oct 2019 16:21:56 +0000
Subject: [PATCH][next] drm/komeda: remove redundant assignment to pointer disable_done
Message-Id: <20191004162156.325-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer disable_done is being initialized with a value that
is never read and is being re-assigned a little later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 75263d8cd0bd..9beeda04818b 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -296,7 +296,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct komeda_crtc_state *old_st = to_kcrtc_st(old);
 	struct komeda_pipeline *master = kcrtc->master;
 	struct komeda_pipeline *slave  = kcrtc->slave;
-	struct completion *disable_done = &crtc->state->commit->flip_done;
+	struct completion *disable_done;
 	bool needs_phase2 = false;
 
 	DRM_DEBUG_ATOMIC("CRTC%d_DISABLE: active_pipes: 0x%x, affected: 0x%x\n",
-- 
2.20.1
