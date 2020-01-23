From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:22:16 +0000
Subject: [PATCH] drm/amd/amdgpu: fix spelling mistake "to" -> "too"
Message-Id: <20200123002216.2832146-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_ERROR message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index ceb0dbf685f1..59ddba137946 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -652,7 +652,7 @@ static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parser *p, uint32_t ib_idx,
 
 	if ((addr + (uint64_t)size) >
 	    (mapping->last + 1) * AMDGPU_GPU_PAGE_SIZE) {
-		DRM_ERROR("BO to small for addr 0x%010Lx %d %d\n",
+		DRM_ERROR("BO too small for addr 0x%010Lx %d %d\n",
 			  addr, lo, hi);
 		return -EINVAL;
 	}
-- 
2.24.0
