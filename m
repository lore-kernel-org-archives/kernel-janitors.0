From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Mar 2017 09:46:22 +0000
Subject: [PATCH] drm/amdgpu/virt: fix spelling mistake: "hypervior" -> "hypervisor"
Message-Id: <20170330094622.19214-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Xiangliang Yu <Xiangliang.Yu@amd.com>, shaoyunl <Shaoyun.Liu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in DRM_ERROR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index d2622b6f49fa..94af75fc6321 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -487,7 +487,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
 
 	r = xgpu_vi_poll_msg(adev, IDH_FLR_NOTIFICATION_CMPL);
 	if (r)
-		DRM_ERROR("failed to get flr cmpl msg from hypervior.\n");
+		DRM_ERROR("failed to get flr cmpl msg from hypervisor.\n");
 
 	/* TODO: need to restore gfx states */
 }
-- 
2.11.0

