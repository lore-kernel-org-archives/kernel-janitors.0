From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Aug 2020 11:19:22 +0000
Subject: [PATCH 2/3] drm/amdgpu/cik: fix buffer overflow in cik_get_register_value()
Message-Id: <20200825111922.GB285523@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200825111843.GA285523@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Frederick Lawler <fred@fredlawl.com>, David Airlie <airlied@linux.ie>, Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, Wenhui Sheng <Wenhui.Sheng@amd.com>, amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Evan Quan <evan.quan@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

The values for "se_num" and "sh_num" come from the user in the ioctl.
They can be in the 0-255 range but if they're more than
AMDGPU_GFX_MAX_SE (4) or AMDGPU_GFX_MAX_SH_PER_SE (2) then it results in
an out of bounds read.

I split this function into to two to make the error handling simpler.

Fixes: aca31681b1a5 ("drm/amdgpu: used cached gca values for cik_read_register")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/cik.c | 195 ++++++++++++++++---------------
 1 file changed, 103 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 7e71ffbca93d..91ebfa485333 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -1042,100 +1042,108 @@ static const struct amdgpu_allowed_register_entry cik_allowed_read_registers[]  	{mmPA_SC_RASTER_CONFIG_1, true},
 };
 
+static int cik_get_register_value_indexed(struct amdgpu_device *adev,
+					  u32 se_num, u32 sh_num,
+					  u32 reg_offset, u32 *value)
+{
+	unsigned se_idx = (se_num = 0xffffffff) ? 0 : se_num;
+	unsigned sh_idx = (sh_num = 0xffffffff) ? 0 : sh_num;
 
-static uint32_t cik_get_register_value(struct amdgpu_device *adev,
-				       bool indexed, u32 se_num,
-				       u32 sh_num, u32 reg_offset)
-{
-	if (indexed) {
-		uint32_t val;
-		unsigned se_idx = (se_num = 0xffffffff) ? 0 : se_num;
-		unsigned sh_idx = (sh_num = 0xffffffff) ? 0 : sh_num;
-
-		switch (reg_offset) {
-		case mmCC_RB_BACKEND_DISABLE:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
-		case mmGC_USER_RB_BACKEND_DISABLE:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
-		case mmPA_SC_RASTER_CONFIG:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
-		case mmPA_SC_RASTER_CONFIG_1:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].raster_config_1;
-		}
+	if (se_idx >= AMDGPU_GFX_MAX_SE ||
+	    sh_idx >= AMDGPU_GFX_MAX_SH_PER_SE)
+		return -EINVAL;
+
+	switch (reg_offset) {
+	case mmCC_RB_BACKEND_DISABLE:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
+		return 0;
+	case mmGC_USER_RB_BACKEND_DISABLE:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
+		return 0;
+	case mmPA_SC_RASTER_CONFIG:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
+		return 0;
+	case mmPA_SC_RASTER_CONFIG_1:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].raster_config_1;
+		return 0;
+	}
 
-		mutex_lock(&adev->grbm_idx_mutex);
-		if (se_num != 0xffffffff || sh_num != 0xffffffff)
-			amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
+	mutex_lock(&adev->grbm_idx_mutex);
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
 
-		val = RREG32(reg_offset);
+	*value = RREG32(reg_offset);
 
-		if (se_num != 0xffffffff || sh_num != 0xffffffff)
-			amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
-		mutex_unlock(&adev->grbm_idx_mutex);
-		return val;
-	} else {
-		unsigned idx;
-
-		switch (reg_offset) {
-		case mmGB_ADDR_CONFIG:
-			return adev->gfx.config.gb_addr_config;
-		case mmMC_ARB_RAMCFG:
-			return adev->gfx.config.mc_arb_ramcfg;
-		case mmGB_TILE_MODE0:
-		case mmGB_TILE_MODE1:
-		case mmGB_TILE_MODE2:
-		case mmGB_TILE_MODE3:
-		case mmGB_TILE_MODE4:
-		case mmGB_TILE_MODE5:
-		case mmGB_TILE_MODE6:
-		case mmGB_TILE_MODE7:
-		case mmGB_TILE_MODE8:
-		case mmGB_TILE_MODE9:
-		case mmGB_TILE_MODE10:
-		case mmGB_TILE_MODE11:
-		case mmGB_TILE_MODE12:
-		case mmGB_TILE_MODE13:
-		case mmGB_TILE_MODE14:
-		case mmGB_TILE_MODE15:
-		case mmGB_TILE_MODE16:
-		case mmGB_TILE_MODE17:
-		case mmGB_TILE_MODE18:
-		case mmGB_TILE_MODE19:
-		case mmGB_TILE_MODE20:
-		case mmGB_TILE_MODE21:
-		case mmGB_TILE_MODE22:
-		case mmGB_TILE_MODE23:
-		case mmGB_TILE_MODE24:
-		case mmGB_TILE_MODE25:
-		case mmGB_TILE_MODE26:
-		case mmGB_TILE_MODE27:
-		case mmGB_TILE_MODE28:
-		case mmGB_TILE_MODE29:
-		case mmGB_TILE_MODE30:
-		case mmGB_TILE_MODE31:
-			idx = (reg_offset - mmGB_TILE_MODE0);
-			return adev->gfx.config.tile_mode_array[idx];
-		case mmGB_MACROTILE_MODE0:
-		case mmGB_MACROTILE_MODE1:
-		case mmGB_MACROTILE_MODE2:
-		case mmGB_MACROTILE_MODE3:
-		case mmGB_MACROTILE_MODE4:
-		case mmGB_MACROTILE_MODE5:
-		case mmGB_MACROTILE_MODE6:
-		case mmGB_MACROTILE_MODE7:
-		case mmGB_MACROTILE_MODE8:
-		case mmGB_MACROTILE_MODE9:
-		case mmGB_MACROTILE_MODE10:
-		case mmGB_MACROTILE_MODE11:
-		case mmGB_MACROTILE_MODE12:
-		case mmGB_MACROTILE_MODE13:
-		case mmGB_MACROTILE_MODE14:
-		case mmGB_MACROTILE_MODE15:
-			idx = (reg_offset - mmGB_MACROTILE_MODE0);
-			return adev->gfx.config.macrotile_mode_array[idx];
-		default:
-			return RREG32(reg_offset);
-		}
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+	mutex_unlock(&adev->grbm_idx_mutex);
+	return 0;
+}
+
+static uint32_t cik_get_register_value(struct amdgpu_device *adev,
+				       u32 reg_offset)
+{
+	unsigned idx;
+
+	switch (reg_offset) {
+	case mmGB_ADDR_CONFIG:
+		return adev->gfx.config.gb_addr_config;
+	case mmMC_ARB_RAMCFG:
+		return adev->gfx.config.mc_arb_ramcfg;
+	case mmGB_TILE_MODE0:
+	case mmGB_TILE_MODE1:
+	case mmGB_TILE_MODE2:
+	case mmGB_TILE_MODE3:
+	case mmGB_TILE_MODE4:
+	case mmGB_TILE_MODE5:
+	case mmGB_TILE_MODE6:
+	case mmGB_TILE_MODE7:
+	case mmGB_TILE_MODE8:
+	case mmGB_TILE_MODE9:
+	case mmGB_TILE_MODE10:
+	case mmGB_TILE_MODE11:
+	case mmGB_TILE_MODE12:
+	case mmGB_TILE_MODE13:
+	case mmGB_TILE_MODE14:
+	case mmGB_TILE_MODE15:
+	case mmGB_TILE_MODE16:
+	case mmGB_TILE_MODE17:
+	case mmGB_TILE_MODE18:
+	case mmGB_TILE_MODE19:
+	case mmGB_TILE_MODE20:
+	case mmGB_TILE_MODE21:
+	case mmGB_TILE_MODE22:
+	case mmGB_TILE_MODE23:
+	case mmGB_TILE_MODE24:
+	case mmGB_TILE_MODE25:
+	case mmGB_TILE_MODE26:
+	case mmGB_TILE_MODE27:
+	case mmGB_TILE_MODE28:
+	case mmGB_TILE_MODE29:
+	case mmGB_TILE_MODE30:
+	case mmGB_TILE_MODE31:
+		idx = (reg_offset - mmGB_TILE_MODE0);
+		return adev->gfx.config.tile_mode_array[idx];
+	case mmGB_MACROTILE_MODE0:
+	case mmGB_MACROTILE_MODE1:
+	case mmGB_MACROTILE_MODE2:
+	case mmGB_MACROTILE_MODE3:
+	case mmGB_MACROTILE_MODE4:
+	case mmGB_MACROTILE_MODE5:
+	case mmGB_MACROTILE_MODE6:
+	case mmGB_MACROTILE_MODE7:
+	case mmGB_MACROTILE_MODE8:
+	case mmGB_MACROTILE_MODE9:
+	case mmGB_MACROTILE_MODE10:
+	case mmGB_MACROTILE_MODE11:
+	case mmGB_MACROTILE_MODE12:
+	case mmGB_MACROTILE_MODE13:
+	case mmGB_MACROTILE_MODE14:
+	case mmGB_MACROTILE_MODE15:
+		idx = (reg_offset - mmGB_MACROTILE_MODE0);
+		return adev->gfx.config.macrotile_mode_array[idx];
+	default:
+		return RREG32(reg_offset);
 	}
 }
 
@@ -1151,8 +1159,11 @@ static int cik_read_register(struct amdgpu_device *adev, u32 se_num,
 		if (reg_offset != cik_allowed_read_registers[i].reg_offset)
 			continue;
 
-		*value = cik_get_register_value(adev, indexed, se_num, sh_num,
-						reg_offset);
+		if (indexed)
+			return cik_get_register_value_indexed(adev, se_num, sh_num,
+						reg_offset, value);
+
+		*value = cik_get_register_value(adev, reg_offset);
 		return 0;
 	}
 	return -EINVAL;
-- 
2.28.0
