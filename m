From: Colin King <colin.king@canonical.com>
Date: Wed, 12 Apr 2017 16:27:22 +0000
Subject: [PATCH] drm: fix spelling mistake: "committing"
Message-Id: <20170412162722.25087-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DRM_DEBUG_ATOMIC debug message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f32506a7c1d6..30229ab719c0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1618,7 +1618,7 @@ int drm_atomic_commit(struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	DRM_DEBUG_ATOMIC("commiting %p\n", state);
+	DRM_DEBUG_ATOMIC("committing %p\n", state);
 
 	return config->funcs->atomic_commit(state->dev, state, false);
 }
@@ -1647,7 +1647,7 @@ int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	DRM_DEBUG_ATOMIC("commiting %p nonblocking\n", state);
+	DRM_DEBUG_ATOMIC("committing %p nonblocking\n", state);
 
 	return config->funcs->atomic_commit(state->dev, state, true);
 }
-- 
2.11.0

