From: Colin King <colin.king@canonical.com>
Date: Fri, 28 Jun 2019 14:08:01 +0000
Subject: [PATCH][next] drm/amdgpu: fix off-by-one comparison on a WARN_ON message
Message-Id: <20190628140801.31937-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The WARN_ON is currently throwing a warning when i is 65 or higher which
is off by one. It should be 64 or higher (64 queues from 0..63 inclusive),
so fix this off-by-one comparison.

Fixes: 849aca9f9c03 ("drm/amdgpu: Move common code to amdgpu_gfx.c")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 74066e1466f7..c8d106c59e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -501,7 +501,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev)
 		/* This situation may be hit in the future if a new HW
 		 * generation exposes more than 64 queues. If so, the
 		 * definition of queue_mask needs updating */
-		if (WARN_ON(i > (sizeof(queue_mask)*8))) {
+		if (WARN_ON(i >= (sizeof(queue_mask)*8))) {
 			DRM_ERROR("Invalid KCQ enabled: %d\n", i);
 			break;
 		}
-- 
2.20.1
