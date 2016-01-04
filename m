From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 20:42:01 +0000
Subject: [patch] drm/amdgpu: double unlock in amdgpu_set_dpm_forced_performance_level()
Message-Id: <20160104204201.GA19867@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sonny Jiang <sonny.jiang@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We recently moved the locking around and accidentally introduced a
double unlock bug.

Fixes: 1b5708ffb103 ('drm/amdgpu: export amd_powerplay_func to amdgpu and other ip block')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index 3b78982..872e586 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -147,8 +147,7 @@ static ssize_t amdgpu_set_dpm_forced_performance_level(struct device *dev,
 	} else if (strncmp("auto", buf, strlen("auto")) = 0) {
 		level = AMDGPU_DPM_FORCED_LEVEL_AUTO;
 	} else {
-		count = -EINVAL;
-		goto fail;
+		return -EINVAL;
 	}
 
 	if (adev->pp_enabled)
@@ -157,18 +156,18 @@ static ssize_t amdgpu_set_dpm_forced_performance_level(struct device *dev,
 		mutex_lock(&adev->pm.mutex);
 		if (adev->pm.dpm.thermal_active) {
 			count = -EINVAL;
-			goto fail;
+			goto unlock;
 		}
 		ret = amdgpu_dpm_force_performance_level(adev, level);
-		if (ret)
+		if (ret) {
 			count = -EINVAL;
-		else
-			adev->pm.dpm.forced_level = level;
+			goto unlock;
+		}
+		adev->pm.dpm.forced_level = level;
+
+unlock:
 		mutex_unlock(&adev->pm.mutex);
 	}
-fail:
-	mutex_unlock(&adev->pm.mutex);
-
 	return count;
 }
 
