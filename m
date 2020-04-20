From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Apr 2020 14:08:46 +0000
Subject: [PATCH][next] drm/amdgpu: fix a dereference on pointer hive before it is null checked
Message-Id: <20200420140846.78062-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer hive is being dereferenced before it is being null
checked and hence can lead to null pointer dereference issues. Fix this
by only dereferencing pointer hive after it has been null checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: 25d4275e1931 ("drm/amdgpu: fix race between pstate and remote buffer map")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 54d8a3e7e75c..2c0a59ba2826 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -389,15 +389,17 @@ int amdgpu_xgmi_set_pstate(struct amdgpu_device *adev, int pstate)
 {
 	int ret = 0;
 	struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev, 0);
-	struct amdgpu_device *request_adev = hive->hi_req_gpu ?
-						hive->hi_req_gpu : adev;
+	struct amdgpu_device *request_adev;
 	bool is_hi_req = pstate = AMDGPU_XGMI_PSTATE_MAX_VEGA20;
-	bool init_low = hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
+	bool init_low;
 
 	/* fw bug so temporarily disable pstate switching */
 	if (!hive || adev->asic_type = CHIP_VEGA20)
 		return 0;
 
+	request_adev = hive->hi_req_gpu ? hive->hi_req_gpu : adev;
+	init_low = hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
+
 	mutex_lock(&hive->hive_lock);
 
 	if (is_hi_req)
-- 
2.25.1
