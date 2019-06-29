From: Colin King <colin.king@canonical.com>
Date: Sat, 29 Jun 2019 13:55:34 +0000
Subject: [PATCH] drm/amd/pp: fix a dereference of a pointer before it is null checked
Message-Id: <20190629135534.15116-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer hwmgr is dereferenced when initializing pointer adev however
it is a little later hwmgr is null checked, implying it could potentially
be null hence the assignment of adev may cause a null pointer dereference.
Fix this by moving the assignment after the null check. Note that I did
think of removing adev as it is only used once, however, hwmgr->adev is
a void * pointer, so using adev avoids some ugly casting so it makes sense
to still use it.

Addresses-Coverity: ("Dereference before null check")
Fixes: 59156faf810e ("drm/amd/pp: Remove the cgs wrapper for notify smu version on APU")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
index 8189fe402c6d..12815b3830e4 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
@@ -722,13 +722,11 @@ static int smu8_request_smu_load_fw(struct pp_hwmgr *hwmgr)
 
 static int smu8_start_smu(struct pp_hwmgr *hwmgr)
 {
-	struct amdgpu_device *adev = hwmgr->adev;
-
+	struct amdgpu_device *adev;
 	uint32_t index = SMN_MP1_SRAM_START_ADDR +
 			 SMU8_FIRMWARE_HEADER_LOCATION +
 			 offsetof(struct SMU8_Firmware_Header, Version);
 
-
 	if (hwmgr = NULL || hwmgr->device = NULL)
 		return -EINVAL;
 
@@ -738,6 +736,7 @@ static int smu8_start_smu(struct pp_hwmgr *hwmgr)
 		((hwmgr->smu_version >> 16) & 0xFF),
 		((hwmgr->smu_version >> 8) & 0xFF),
 		(hwmgr->smu_version & 0xFF));
+	adev = hwmgr->adev;
 	adev->pm.fw_version = hwmgr->smu_version >> 8;
 
 	return smu8_request_smu_load_fw(hwmgr);
-- 
2.20.1
