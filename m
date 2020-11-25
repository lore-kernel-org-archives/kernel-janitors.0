From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Nov 2020 14:18:06 +0000
Subject: [PATCH][next] drm/amdgpu: Fix sizeof() mismatch in bps_bo kmalloc_array creation
Message-Id: <20201125141806.1881036-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Tao Zhou <tao.zhou1@amd.com>, Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof() is being used, sizeof((*data)->bps_bo) is not
correct, it should be sizeof(*(*data)->bps_bo).  It just so happens
to work because the sizes are the same.  Fix it.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 5278a159cf35 ("drm/amdgpu: support reserve bad page for virt (v3)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 2d51b7694d1f..df15d33e3c5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -283,7 +283,7 @@ static int amdgpu_virt_init_ras_err_handler_data(struct amdgpu_device *adev)
 		return -ENOMEM;
 
 	bps = kmalloc_array(align_space, sizeof((*data)->bps), GFP_KERNEL);
-	bps_bo = kmalloc_array(align_space, sizeof((*data)->bps_bo), GFP_KERNEL);
+	bps_bo = kmalloc_array(align_space, sizeof(*(*data)->bps_bo), GFP_KERNEL);
 
 	if (!bps || !bps_bo) {
 		kfree(bps);
-- 
2.29.2
