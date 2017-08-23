From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Aug 2017 13:17:40 +0000
Subject: [PATCH][drm-next] drm/amdgpu: remove duplicate return statement
Message-Id: <20170823131740.20930-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove a redundant identical return statement, it has no use.

Detected by CoverityScan, CID#1454586 ("Structurally dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
index fb6e5dbd5a03..309f2419c6d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
@@ -155,7 +155,6 @@ static const struct kfd2kgd_calls kfd2kgd = {
 struct kfd2kgd_calls *amdgpu_amdkfd_gfx_8_0_get_functions(void)
 {
 	return (struct kfd2kgd_calls *)&kfd2kgd;
-	return (struct kfd2kgd_calls *)&kfd2kgd;
 }
 
 static inline struct amdgpu_device *get_amdgpu_device(struct kgd_dev *kgd)
-- 
2.14.1

