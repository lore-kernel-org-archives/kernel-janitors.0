From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Mar 2018 16:00:47 +0000
Subject: [PATCH] drm/amd/display: fix spelling mistake: "Usupported" -> "Unsupported"
Message-Id: <20180330160047.7368-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DRM_ERROR error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e42a28e3adc5..1df1c91b6ae5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1521,7 +1521,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 		break;
 #endif
 	default:
-		DRM_ERROR("Usupported ASIC type: 0x%X\n", adev->asic_type);
+		DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
 		goto fail;
 	}
 
@@ -1715,7 +1715,7 @@ static int dm_early_init(void *handle)
 		break;
 #endif
 	default:
-		DRM_ERROR("Usupported ASIC type: 0x%X\n", adev->asic_type);
+		DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
 		return -EINVAL;
 	}
 
-- 
2.15.1

