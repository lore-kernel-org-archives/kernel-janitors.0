From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 11:35:10 +0000
Subject: [PATCH] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
Message-Id: <20200805113510.18277-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126150228.8578-1-colin.king@canonical.com>
In-Reply-To: <20181126150228.8578-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DRM_ERROR message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 49d4514aa6ed..c68369731b20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2010,7 +2010,7 @@ static int psp_suspend(void *handle)
 
 	ret = psp_tmr_terminate(psp);
 	if (ret) {
-		DRM_ERROR("Falied to terminate tmr\n");
+		DRM_ERROR("Failed to terminate tmr\n");
 		return ret;
 	}
 
-- 
2.27.0
