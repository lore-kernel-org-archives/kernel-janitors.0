From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Nov 2018 14:19:43 +0000
Subject: [PATCH] drm/amd/pp: fix spelling mistake "dependancy" -> "dependency"
Message-Id: <20181127141943.27110-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in PP_ASSERT_WITH_CODE messages, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index 88f6b35ea6fe..5dcd21d29dbf 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -269,7 +269,7 @@ static int smu7_construct_voltage_tables(struct pp_hwmgr *hwmgr)
 					hwmgr->dyn_state.mvdd_dependency_on_mclk);
 
 		PP_ASSERT_WITH_CODE((0 = result),
-				"Failed to retrieve SVI2 MVDD table from dependancy table.",
+				"Failed to retrieve SVI2 MVDD table from dependency table.",
 				return result;);
 	}
 
@@ -288,7 +288,7 @@ static int smu7_construct_voltage_tables(struct pp_hwmgr *hwmgr)
 			result = phm_get_svi2_voltage_table_v0(&(data->vddci_voltage_table),
 					hwmgr->dyn_state.vddci_dependency_on_mclk);
 		PP_ASSERT_WITH_CODE((0 = result),
-				"Failed to retrieve SVI2 VDDCI table from dependancy table.",
+				"Failed to retrieve SVI2 VDDCI table from dependency table.",
 				return result);
 	}
 
@@ -317,7 +317,7 @@ static int smu7_construct_voltage_tables(struct pp_hwmgr *hwmgr)
 				table_info->vddc_lookup_table);
 
 		PP_ASSERT_WITH_CODE((0 = result),
-			"Failed to retrieve SVI2 VDDC table from dependancy table.", return result;);
+			"Failed to retrieve SVI2 VDDC table from dependency table.", return result;);
 	}
 
 	tmp = smum_get_mac_definition(hwmgr, SMU_MAX_LEVELS_VDDC);
-- 
2.19.1
