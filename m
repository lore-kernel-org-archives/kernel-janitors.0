From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 12:56:40 +0000
Subject: [PATCH][next] drm/amdgpu: fix unlocks on error return path
Message-Id: <20200424125640.22656-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error returns paths are unlocking lock kiq->ring_lock
however it seems this should be dev->gfx.kiq.ring_lock as this
is the lock that is being locked and unlocked around the ring
operations.  This looks like a bug, fix it by unlocking the
correct lock.

[ Note: untested ]

Addresses-Coverity: ("Missing unlock")
Fixes: 82478876eaac ("drm/amdgpu: protect ring overrun")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index b120f9160f13..edaa50d850a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -430,7 +430,7 @@ static int gmc_v10_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 		r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
 		if (r) {
 			amdgpu_ring_undo(ring);
-			spin_unlock(&kiq->ring_lock);
+			spin_unlock(&adev->gfx.kiq.ring_lock);
 			return -ETIME;
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 0a6026308343..055ecba754ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -624,7 +624,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 		r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
 		if (r) {
 			amdgpu_ring_undo(ring);
-			spin_unlock(&kiq->ring_lock);
+			spin_unlock(&adev->gfx.kiq.ring_lock);
 			return -ETIME;
 		}
 
-- 
2.25.1
