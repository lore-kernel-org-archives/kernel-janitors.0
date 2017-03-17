From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Mar 2017 14:37:22 +0000
Subject: [PATCH] drm/amdgpu: remove redundant outer loop and remove commented out code
Message-Id: <20170317143722.13473-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, Tom St Denis <tom.stdenis@amd.com>, jimqu <Jim.Qu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The outer loop is redundant and can be removed as it is doing nothing
useful. Also remove some commented out code that is not being used.

Detected by CoverityScan, CID#1402073

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index 9ea99348e493..72dea663f113 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -273,24 +273,14 @@ static int vce_v2_0_start(struct amdgpu_device *adev)
 
 static int vce_v2_0_stop(struct amdgpu_device *adev)
 {
-	int i, j;
+	int i;
 	int status;
 
 	if (vce_v2_0_lmi_clean(adev)) {
 		DRM_INFO("vce is not idle \n");
 		return 0;
 	}
-/*
-	for (i = 0; i < 10; ++i) {
-		for (j = 0; j < 100; ++j) {
-			status = RREG32(mmVCE_FW_REG_STATUS);
-			if (!(status & 1))
-				break;
-			mdelay(1);
-		}
-		break;
-	}
-*/
+
 	if (vce_v2_0_wait_for_idle(adev)) {
 		DRM_INFO("VCE is busy, Can't set clock gateing");
 		return 0;
@@ -299,14 +289,11 @@ static int vce_v2_0_stop(struct amdgpu_device *adev)
 	/* Stall UMC and register bus before resetting VCPU */
 	WREG32_P(mmVCE_LMI_CTRL2, 1 << 8, ~(1 << 8));
 
-	for (i = 0; i < 10; ++i) {
-		for (j = 0; j < 100; ++j) {
-			status = RREG32(mmVCE_LMI_STATUS);
-			if (status & 0x240)
-				break;
-			mdelay(1);
-		}
-		break;
+	for (i = 0; i < 100; ++i) {
+		status = RREG32(mmVCE_LMI_STATUS);
+		if (status & 0x240)
+			break;
+		mdelay(1);
 	}
 
 	WREG32_P(mmVCE_VCPU_CNTL, 0, ~0x80001);
-- 
2.11.0

