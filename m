From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 20:45:10 +0000
Subject: [PATCH 2/3] drm/amd/powerplay/hwmgr: Adjust layout for source code from five if statements
Message-Id: <c39f6210-e68c-5f80-0867-47a92b5d5e03@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e5850db-c07f-add1-919a-be29be9c553d@users.sourceforge.net>
In-Reply-To: <1e5850db-c07f-add1-919a-be29be9c553d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Colin Ian King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, Eric Huang <JinHuiEric.Huang@amd.com>, Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Himanshu Jha <himanshujha199640@gmail.com>, Junwei Zhang <Jerry.Zhang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 21:01:24 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: Comparisons should place the constant on the right side
of the test
WARNING: else is not generally useful after a break or return

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c   | 33 +++++++++++-------------
 drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c      | 31 +++++++++++-----------
 drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c |  5 ++--
 3 files changed, 33 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c
index c0699b884894..870c517f2057 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c
@@ -1772,37 +1772,34 @@ static int cz_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 		return 0;
 	case AMDGPU_PP_SENSOR_UVD_VCLK:
 		if (!cz_hwmgr->uvd_power_gated) {
-			if (uvd_index >= CZ_MAX_HARDWARE_POWERLEVELS) {
+			if (uvd_index >= CZ_MAX_HARDWARE_POWERLEVELS)
 				return -EINVAL;
-			} else {
-				vclk = uvd_table->entries[uvd_index].vclk;
-				*((uint32_t *)value) = vclk;
-				return 0;
-			}
+
+			vclk = uvd_table->entries[uvd_index].vclk;
+			*((uint32_t *)value) = vclk;
+			return 0;
 		}
 		*((uint32_t *)value) = 0;
 		return 0;
 	case AMDGPU_PP_SENSOR_UVD_DCLK:
 		if (!cz_hwmgr->uvd_power_gated) {
-			if (uvd_index >= CZ_MAX_HARDWARE_POWERLEVELS) {
+			if (uvd_index >= CZ_MAX_HARDWARE_POWERLEVELS)
 				return -EINVAL;
-			} else {
-				dclk = uvd_table->entries[uvd_index].dclk;
-				*((uint32_t *)value) = dclk;
-				return 0;
-			}
+
+			dclk = uvd_table->entries[uvd_index].dclk;
+			*((uint32_t *)value) = dclk;
+			return 0;
 		}
 		*((uint32_t *)value) = 0;
 		return 0;
 	case AMDGPU_PP_SENSOR_VCE_ECCLK:
 		if (!cz_hwmgr->vce_power_gated) {
-			if (vce_index >= CZ_MAX_HARDWARE_POWERLEVELS) {
+			if (vce_index >= CZ_MAX_HARDWARE_POWERLEVELS)
 				return -EINVAL;
-			} else {
-				ecclk = vce_table->entries[vce_index].ecclk;
-				*((uint32_t *)value) = ecclk;
-				return 0;
-			}
+
+			ecclk = vce_table->entries[vce_index].ecclk;
+			*((uint32_t *)value) = ecclk;
+			return 0;
 		}
 		*((uint32_t *)value) = 0;
 		return 0;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
index ded33ed03f11..2681c9317d25 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
@@ -813,24 +813,23 @@ int phm_initializa_dynamic_state_adjustment_rule_settings(struct pp_hwmgr *hwmgr
 	/* initialize vddc_dep_on_dal_pwrl table */
 	table_size = sizeof(uint32_t) + 4 * sizeof(struct phm_clock_voltage_dependency_record);
 	table_clk_vlt = kzalloc(table_size, GFP_KERNEL);
-
-	if (NULL = table_clk_vlt) {
+	if (!table_clk_vlt)
 		return -ENOMEM;
-	} else {
-		table_clk_vlt->count = 4;
-		table_clk_vlt->entries[0].clk = PP_DAL_POWERLEVEL_ULTRALOW;
-		table_clk_vlt->entries[0].v = 0;
-		table_clk_vlt->entries[1].clk = PP_DAL_POWERLEVEL_LOW;
-		table_clk_vlt->entries[1].v = 720;
-		table_clk_vlt->entries[2].clk = PP_DAL_POWERLEVEL_NOMINAL;
-		table_clk_vlt->entries[2].v = 810;
-		table_clk_vlt->entries[3].clk = PP_DAL_POWERLEVEL_PERFORMANCE;
-		table_clk_vlt->entries[3].v = 900;
-		if (pptable_info != NULL)
-			pptable_info->vddc_dep_on_dal_pwrl = table_clk_vlt;
-		hwmgr->dyn_state.vddc_dep_on_dal_pwrl = table_clk_vlt;
-	}
 
+	table_clk_vlt->count = 4;
+	table_clk_vlt->entries[0].clk = PP_DAL_POWERLEVEL_ULTRALOW;
+	table_clk_vlt->entries[0].v = 0;
+	table_clk_vlt->entries[1].clk = PP_DAL_POWERLEVEL_LOW;
+	table_clk_vlt->entries[1].v = 720;
+	table_clk_vlt->entries[2].clk = PP_DAL_POWERLEVEL_NOMINAL;
+	table_clk_vlt->entries[2].v = 810;
+	table_clk_vlt->entries[3].clk = PP_DAL_POWERLEVEL_PERFORMANCE;
+	table_clk_vlt->entries[3].v = 900;
+
+	if (pptable_info)
+		pptable_info->vddc_dep_on_dal_pwrl = table_clk_vlt;
+
+	hwmgr->dyn_state.vddc_dep_on_dal_pwrl = table_clk_vlt;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
index c6febbf0bf69..df8b3e67307e 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
@@ -1031,8 +1031,9 @@ int atomctrl_calculate_voltage_evv_on_sclk(
 
 			*voltage = (uint16_t)fV_NL.partial.real;
 			break;
-		} else
-			fV_x = fAdd(fV_x, fStepSize);
+		}
+
+		fV_x = fAdd(fV_x, fStepSize);
 	}
 
 	return result;
-- 
2.16.1

