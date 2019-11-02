From: Colin King <colin.king@canonical.com>
Date: Sat, 02 Nov 2019 22:33:23 +0000
Subject: [PATCH] drm/amd/powerplay: fix spelling mistake "Attemp" -> "Attempt"
Message-Id: <20191102223323.8453-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180428222155.20242-1-colin.king@canonical.com>
In-Reply-To: <20180428222155.20242-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in assert messages, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c | 12 ++++++------
 drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
index 90c782c132d2..43190fa2bb33 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
@@ -125,20 +125,20 @@ int vega12_enable_smc_features(struct pp_hwmgr *hwmgr,
 	if (enable) {
 		PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low) = 0,
-				"[EnableDisableSMCFeatures] Attemp to enable SMU features Low failed!",
+				"[EnableDisableSMCFeatures] Attempt to enable SMU features Low failed!",
 				return -EINVAL);
 		PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high) = 0,
-				"[EnableDisableSMCFeatures] Attemp to enable SMU features High failed!",
+				"[EnableDisableSMCFeatures] Attempt to enable SMU features High failed!",
 				return -EINVAL);
 	} else {
 		PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low) = 0,
-				"[EnableDisableSMCFeatures] Attemp to disable SMU features Low failed!",
+				"[EnableDisableSMCFeatures] Attempt to disable SMU features Low failed!",
 				return -EINVAL);
 		PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high) = 0,
-				"[EnableDisableSMCFeatures] Attemp to disable SMU features High failed!",
+				"[EnableDisableSMCFeatures] Attempt to disable SMU features High failed!",
 				return -EINVAL);
 	}
 
@@ -155,13 +155,13 @@ int vega12_get_enabled_smc_features(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc(hwmgr,
 			PPSMC_MSG_GetEnabledSmuFeaturesLow) = 0,
-			"[GetEnabledSMCFeatures] Attemp to get SMU features Low failed!",
+			"[GetEnabledSMCFeatures] Attempt to get SMU features Low failed!",
 			return -EINVAL);
 	smc_features_low = smu9_get_argument(hwmgr);
 
 	PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc(hwmgr,
 			PPSMC_MSG_GetEnabledSmuFeaturesHigh) = 0,
-			"[GetEnabledSMCFeatures] Attemp to get SMU features High failed!",
+			"[GetEnabledSMCFeatures] Attempt to get SMU features High failed!",
 			return -EINVAL);
 	smc_features_high = smu9_get_argument(hwmgr);
 
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
index f604612f411f..562cb221f186 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
@@ -310,20 +310,20 @@ int vega20_enable_smc_features(struct pp_hwmgr *hwmgr,
 	if (enable) {
 		PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low)) = 0,
-				"[EnableDisableSMCFeatures] Attemp to enable SMU features Low failed!",
+				"[EnableDisableSMCFeatures] Attempt to enable SMU features Low failed!",
 				return ret);
 		PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high)) = 0,
-				"[EnableDisableSMCFeatures] Attemp to enable SMU features High failed!",
+				"[EnableDisableSMCFeatures] Attempt to enable SMU features High failed!",
 				return ret);
 	} else {
 		PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low)) = 0,
-				"[EnableDisableSMCFeatures] Attemp to disable SMU features Low failed!",
+				"[EnableDisableSMCFeatures] Attempt to disable SMU features Low failed!",
 				return ret);
 		PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high)) = 0,
-				"[EnableDisableSMCFeatures] Attemp to disable SMU features High failed!",
+				"[EnableDisableSMCFeatures] Attempt to disable SMU features High failed!",
 				return ret);
 	}
 
@@ -341,12 +341,12 @@ int vega20_get_enabled_smc_features(struct pp_hwmgr *hwmgr,
 
 	PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc(hwmgr,
 			PPSMC_MSG_GetEnabledSmuFeaturesLow)) = 0,
-			"[GetEnabledSMCFeatures] Attemp to get SMU features Low failed!",
+			"[GetEnabledSMCFeatures] Attempt to get SMU features Low failed!",
 			return ret);
 	smc_features_low = vega20_get_argument(hwmgr);
 	PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc(hwmgr,
 			PPSMC_MSG_GetEnabledSmuFeaturesHigh)) = 0,
-			"[GetEnabledSMCFeatures] Attemp to get SMU features High failed!",
+			"[GetEnabledSMCFeatures] Attempt to get SMU features High failed!",
 			return ret);
 	smc_features_high = vega20_get_argument(hwmgr);
 
-- 
2.20.1
