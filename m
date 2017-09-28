From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Sep 2017 10:35:52 +0000
Subject: [PATCH][drm-next] drm/amd/powerplay: fix spelling mistake: "dividable" -> "divisible"
Message-Id: <20170928103552.7755-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, Xiangliang Yu <Xiangliang.Yu@amd.com>, Monk Liu <Monk.Liu@amd.com>, Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes in pr_err error message and ASSERT
messages.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c         | 2 +-
 drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c | 2 +-
 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c
index fcf88b8fc738..9d1086894d2b 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smc.c
@@ -2332,7 +2332,7 @@ static int ci_load_smc_ucode(struct pp_hwmgr *hwmgr)
 	PHM_WRITE_FIELD(hwmgr->device, SMC_IND_ACCESS_CNTL, AUTO_INCREMENT_IND_0, 0);
 
 	if (0 != byte_count) {
-		pr_err("SMC size must be dividable by 4\n");
+		pr_err("SMC size must be divisible by 4\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
index 78aa1122eacc..a778e174ba01 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
@@ -108,7 +108,7 @@ static int iceland_upload_smc_firmware_data(struct pp_hwmgr *hwmgr,
 
 	PHM_WRITE_FIELD(hwmgr->device, SMC_IND_ACCESS_CNTL, AUTO_INCREMENT_IND_0, 0);
 
-	PP_ASSERT_WITH_CODE((0 = byte_count), "SMC size must be dividable by 4.", return -EINVAL);
+	PP_ASSERT_WITH_CODE((0 = byte_count), "SMC size must be divisible by 4.", return -EINVAL);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
index 2ae05bbdb974..c997117f2461 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c
@@ -513,7 +513,7 @@ static int smu7_upload_smc_firmware_data(struct pp_hwmgr *hwmgr, uint32_t length
 
 	PHM_WRITE_FIELD(hwmgr->device, SMC_IND_ACCESS_CNTL, AUTO_INCREMENT_IND_11, 0);
 
-	PP_ASSERT_WITH_CODE((0 = byte_count), "SMC size must be dividable by 4.", return -EINVAL);
+	PP_ASSERT_WITH_CODE((0 = byte_count), "SMC size must be divisible by 4.", return -EINVAL);
 
 	return 0;
 }
-- 
2.14.1

