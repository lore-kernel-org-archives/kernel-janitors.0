From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 20:46:40 +0000
Subject: [PATCH 3/3] drm/amd/powerplay/hwmgr: Delete an unnecessary return statement in three functions
Message-Id: <5a8388c9-7d55-0e15-5d36-c3057c4b2945@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e5850db-c07f-add1-919a-be29be9c553d@users.sourceforge.net>
In-Reply-To: <1e5850db-c07f-add1-919a-be29be9c553d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Colin Ian King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, Eric Huang <JinHuiEric.Huang@amd.com>, Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Himanshu Jha <himanshujha199640@gmail.com>, Junwei Zhang <Jerry.Zhang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 21:10:58 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c        | 3 ---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
index 2681c9317d25..e07b32491092 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
@@ -653,8 +653,6 @@ void phm_trim_voltage_table_to_fit_state_table(uint32_t max_vol_steps,
 		vol_table->entries[i] = vol_table->entries[i + diff];
 
 	vol_table->count = max_vol_steps;
-
-	return;
 }
 
 int phm_reset_single_dpm_table(void *table,
@@ -906,7 +904,6 @@ void hwmgr_init_default_caps(struct pp_hwmgr *hwmgr)
 
 	phm_cap_set(hwmgr->platform_descriptor.platformCaps,
 						PHM_PlatformCaps_FanSpeedInTableIsRPM);
-	return;
 }
 
 int hwmgr_set_user_specify_caps(struct pp_hwmgr *hwmgr)
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index 2d55dabc77d4..fcdb3563d860 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -3618,7 +3618,6 @@ static uint32_t vega10_find_highest_dpm_level(
 static void vega10_apply_dal_minimum_voltage_request(
 		struct pp_hwmgr *hwmgr)
 {
-	return;
 }
 
 static int vega10_get_soc_index_for_max_uclk(struct pp_hwmgr *hwmgr)
-- 
2.16.1

