From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jul 2019 13:32:19 +0000
Subject: [PATCH][next] drm/amd/display: remove duplicated comparison
Message-Id: <20190723133219.27877-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of surface_pitch is duplicated and hence one of these
comparisons is redundant and can be removed.  Remove it.

Addresses-Coverity: ("Same on both sides")
Fixes: 12e2b2d4c65f ("drm/amd/display: add dcc programming for dual plane")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 94f126d2331c..168f4a7dffdf 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1379,7 +1379,6 @@ static enum surface_update_type get_plane_info_update_type(const struct dc_surfa
 	}
 
 	if (u->plane_info->plane_size.surface_pitch != u->surface->plane_size.surface_pitch
-			|| u->plane_info->plane_size.surface_pitch != u->surface->plane_size.surface_pitch
 			|| u->plane_info->plane_size.chroma_pitch != u->surface->plane_size.chroma_pitch) {
 		update_flags->bits.plane_size_change = 1;
 		elevate_update_type(&update_type, UPDATE_TYPE_MED);
-- 
2.20.1
