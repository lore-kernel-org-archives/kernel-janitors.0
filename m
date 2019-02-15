From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 15 Feb 2019 03:35:07 +0000
Subject: [PATCH -next] drm: Remove set but not used variable 'gem'
Message-Id: <20190215033507.103232-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536646814-186429-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536646814-186429-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/vc4/vc4_txp.c: In function 'vc4_txp_connector_atomic_check':
drivers/gpu/drm/vc4/vc4_txp.c:252:29: warning:
 variable 'gem' set but not used [-Wunused-but-set-variable]
  struct drm_gem_cma_object *gem;
                             ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index aa279b5b0de7..afb1c4ec4f18 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -249,7 +249,6 @@ static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
 					struct drm_connector_state *conn_state)
 {
 	struct drm_crtc_state *crtc_state;
-	struct drm_gem_cma_object *gem;
 	struct drm_framebuffer *fb;
 	int i;
 
@@ -275,8 +274,6 @@ static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
 	if (i = ARRAY_SIZE(drm_fmts))
 		return -EINVAL;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
-
 	/* Pitch must be aligned on 16 bytes. */
 	if (fb->pitches[0] & GENMASK(3, 0))
 		return -EINVAL;
