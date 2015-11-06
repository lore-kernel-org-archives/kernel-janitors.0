From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 06 Nov 2015 11:13:02 +0000
Subject: [PATCH] GPU-DRM: Delete unnecessary checks before drm_property_unreference_blob()
Message-Id: <563C8B3E.405@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <55998CD5.3080204@users.sourceforge.net>
 <CAEG8a3KgYtd4b6Dk0+TjcX_-gHXWMc5xv367LPvChivjM-uzRg@mail.gmail.com>
 <20150706065346.GA2156@phenom.ffwll.local>
In-Reply-To: <20150706065346.GA2156@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Junwang Zhao <zhjwpku@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 6 Nov 2015 12:03:46 +0100

The drm_property_unreference_blob() function tests whether its argument
is NULL and then returns immediately.
Thus the tests around the calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_atomic.c        | 9 +++------
 drivers/gpu/drm/drm_atomic_helper.c | 5 ++---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 7bb3845..d65dc31 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -316,8 +316,7 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 	if (mode && memcmp(&state->mode, mode, sizeof(*mode)) = 0)
 		return 0;
 
-	if (state->mode_blob)
-		drm_property_unreference_blob(state->mode_blob);
+	drm_property_unreference_blob(state->mode_blob);
 	state->mode_blob = NULL;
 
 	if (mode) {
@@ -363,8 +362,7 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 	if (blob = state->mode_blob)
 		return 0;
 
-	if (state->mode_blob)
-		drm_property_unreference_blob(state->mode_blob);
+	drm_property_unreference_blob(state->mode_blob);
 	state->mode_blob = NULL;
 
 	if (blob) {
@@ -419,8 +417,7 @@ int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		struct drm_property_blob *mode  			drm_property_lookup_blob(dev, val);
 		ret = drm_atomic_set_mode_prop_for_crtc(state, mode);
-		if (mode)
-			drm_property_unreference_blob(mode);
+		drm_property_unreference_blob(mode);
 		return ret;
 	}
 	else if (crtc->funcs->atomic_set_property)
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 0c6f621..9870c70 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2173,7 +2173,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_dpms);
  */
 void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc)
 {
-	if (crtc->state && crtc->state->mode_blob)
+	if (crtc->state)
 		drm_property_unreference_blob(crtc->state->mode_blob);
 	kfree(crtc->state);
 	crtc->state = kzalloc(sizeof(*crtc->state), GFP_KERNEL);
@@ -2241,8 +2241,7 @@ EXPORT_SYMBOL(drm_atomic_helper_crtc_duplicate_state);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					    struct drm_crtc_state *state)
 {
-	if (state->mode_blob)
-		drm_property_unreference_blob(state->mode_blob);
+	drm_property_unreference_blob(state->mode_blob);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
 
-- 
2.6.2

