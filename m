From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 11:59:26 +0000
Subject: [PATCH] drm/amdgpu: fix spelling mistake "gateing" -> "gating"
Message-Id: <20190416115926.32669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126150228.8578-1-colin.king@canonical.com>
In-Reply-To: <20181126150228.8578-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_INFO message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index bed78a778e3f..40363ca6c5f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -283,7 +283,7 @@ static int vce_v2_0_stop(struct amdgpu_device *adev)
 	}
 
 	if (vce_v2_0_wait_for_idle(adev)) {
-		DRM_INFO("VCE is busy, Can't set clock gateing");
+		DRM_INFO("VCE is busy, Can't set clock gating");
 		return 0;
 	}
 
-- 
2.20.1
