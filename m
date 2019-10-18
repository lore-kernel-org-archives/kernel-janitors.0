From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Oct 2019 08:15:08 +0000
Subject: [PATCH][next] drm/amdgpu/psp: fix spelling mistake "initliaze" -> "initialize"
Message-Id: <20191018081508.11028-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_ERROR error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index b996b5bc5804..fd7a73f4fa70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -90,7 +90,7 @@ static int psp_sw_init(void *handle)
 
 	ret = psp_mem_training_init(psp);
 	if (ret) {
-		DRM_ERROR("Failed to initliaze memory training!\n");
+		DRM_ERROR("Failed to initialize memory training!\n");
 		return ret;
 	}
 	ret = psp_mem_training(psp, PSP_MEM_TRAIN_COLD_BOOT);
-- 
2.20.1
