From: Colin King <colin.king@canonical.com>
Date: Wed, 02 May 2018 14:43:16 +0000
Subject: [PATCH] drm/amd/display: clean up assignment of amdgpu_crtc
Message-Id: <20180502144316.32056-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The declaration of pointer amdgpu_crtc has a redundant assignment to
amdgpu_crtc. Clean this up by removing it.

Detected by CoverityScan, CID#1460299 ("Evaluation order violation")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1dd1142246c2..2beb8821e19e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3773,7 +3773,7 @@ static void remove_stream(struct amdgpu_device *adev,
 static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
 			       struct dc_cursor_position *position)
 {
-	struct amdgpu_crtc *amdgpu_crtc = amdgpu_crtc = to_amdgpu_crtc(crtc);
+	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	int x, y;
 	int xorigin = 0, yorigin = 0;
 
-- 
2.17.0

