From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Jul 2020 08:37:58 +0000
Subject: [PATCH][next] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
Message-Id: <20200710083758.3304139-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180322154144.31363-1-colin.king@canonical.com>
In-Reply-To: <20180322154144.31363-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_ERROR error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index e20695b44dbe..40706334f7a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1984,7 +1984,7 @@ static int psp_suspend(void *handle)
 
 	ret = psp_tmr_terminate(psp);
 	if (ret) {
-		DRM_ERROR("Falied to terminate tmr\n");
+		DRM_ERROR("Failed to terminate tmr\n");
 		return ret;
 	}
 
-- 
2.27.0
