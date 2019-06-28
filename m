From: Colin King <colin.king@canonical.com>
Date: Fri, 28 Jun 2019 14:33:20 +0000
Subject: [PATCH] drm/amdgpu: fix a missing break in a switch statement
Message-Id: <20190628143320.5182-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently for the AMDGPU_IRQ_STATE_DISABLE there is a missing break
causing the code to fall through to the AMDGPU_IRQ_STATE_ENABLE case.
Fix this by adding in the missing break statement.

Addresses-Coverity: ("Missing break in switch")
Fixes: a644d85a5cd4 ("drm/amdgpu: add gfx v10 implementation (v10)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 2932ade7dbd0..c165200361b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4608,6 +4608,7 @@ gfx_v10_0_set_gfx_eop_interrupt_state(struct amdgpu_device *adev,
 		cp_int_cntl = REG_SET_FIELD(cp_int_cntl, CP_INT_CNTL_RING0,
 					    TIME_STAMP_INT_ENABLE, 0);
 		WREG32(cp_int_cntl_reg, cp_int_cntl);
+		break;
 	case AMDGPU_IRQ_STATE_ENABLE:
 		cp_int_cntl = RREG32(cp_int_cntl_reg);
 		cp_int_cntl = REG_SET_FIELD(cp_int_cntl, CP_INT_CNTL_RING0,
-- 
2.20.1
