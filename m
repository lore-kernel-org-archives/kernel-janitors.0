From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 23:46:01 +0000
Subject: [patch] drm/atomic: fix an error code in mode_fixup()
Message-Id: <20170207234601.GA23981@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Having "ret" be a bool type works for everything except
ret = funcs->atomic_check().  The other functions all return zero on
error but ->atomic_check() returns negative error codes.  We want to
propagate the error code but instead we return 1.

I found this bug with static analysis and I don't know if it affects
run time.

Fixes: 4cd4df8080a3 ("drm/atomic: Add ->atomic_check() to encoder helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9a08445a7a7a..01d936b7be43 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -369,7 +369,7 @@ mode_fixup(struct drm_atomic_state *state)
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	int i;
-	bool ret;
+	int ret;
 
 	for_each_crtc_in_state(state, crtc, crtc_state, i) {
 		if (!crtc_state->mode_changed &&
