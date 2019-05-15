From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2019 09:51:30 +0000
Subject: [PATCH] drm/amd/powerplay: fix locking in smu_feature_set_supported()
Message-Id: <20190515095130.GF3409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Cc: Chengming Gui <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, Likun Gao <Likun.Gao@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

There is a typo so the code unlocks twice instead of taking the lock and
then releasing it.

Fixes: f14a323db5b0 ("drm/amd/powerplay: implement update enabled feature state to smc for smu11")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 52d919a8b70a..85ac29af5363 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -310,7 +310,7 @@ int smu_feature_set_supported(struct smu_context *smu, int feature_id,
 
 	WARN_ON(feature_id > feature->feature_num);
 
-	mutex_unlock(&feature->mutex);
+	mutex_lock(&feature->mutex);
 	if (enable)
 		test_and_set_bit(feature_id, feature->supported);
 	else
-- 
2.20.1
