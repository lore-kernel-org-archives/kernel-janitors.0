From: Colin King <colin.king@canonical.com>
Date: Sat, 11 Nov 2017 11:51:10 +0000
Subject: [PATCH] drm/amdgpu/virt: remove redundant variable pf2vf_ver
Message-Id: <20171111115110.3026-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Xiangliang Yu <Xiangliang.Yu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable pf2vf_ver is assigned but never read, it is redundant and
hence can be removed.

Cleans up clang warning:
drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:310:3: warning: Value stored
to 'pf2vf_ver' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 6738df836a70..b1cc179512fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -296,7 +296,6 @@ int amdgpu_virt_fw_reserve_get_checksum(void *obj,
 
 void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)
 {
-	uint32_t pf2vf_ver = 0;
 	uint32_t pf2vf_size = 0;
 	uint32_t checksum = 0;
 	uint32_t checkval;
@@ -309,7 +308,6 @@ void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)
 		adev->virt.fw_reserve.p_pf2vf  			(struct amdgim_pf2vf_info_header *)(
 			adev->fw_vram_usage.va + AMDGIM_DATAEXCHANGE_OFFSET);
-		pf2vf_ver = adev->virt.fw_reserve.p_pf2vf->version;
 		AMDGPU_FW_VRAM_PF2VF_READ(adev, header.size, &pf2vf_size);
 		AMDGPU_FW_VRAM_PF2VF_READ(adev, checksum, &checksum);
 
-- 
2.14.1

