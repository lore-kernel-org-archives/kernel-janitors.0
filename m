From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 14:03:56 +0000
Subject: [PATCH] drm/amdgpu: Add missing '\n' in log messages
Message-Id: <20200411140356.28211-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com, evan.quan@amd.com, andrey.grodzovsky@amd.com, Monk.Liu@amd.com, kent.russell@amd.com, le.ma@amd.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

While at it, split some long lines that where not that far.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Most of them have been added in commit bd607166af7f ("drm/amdgpu: Enable reading FRU chip via I2C v3")
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 87f7c129c8ce..3d0a50e8c36b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3249,25 +3249,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	r = device_create_file(adev->dev, &dev_attr_pcie_replay_count);
 	if (r) {
-		dev_err(adev->dev, "Could not create pcie_replay_count");
+		dev_err(adev->dev, "Could not create pcie_replay_count\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_product_name);
 	if (r) {
-		dev_err(adev->dev, "Could not create product_name");
+		dev_err(adev->dev, "Could not create product_name\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_product_number);
 	if (r) {
-		dev_err(adev->dev, "Could not create product_number");
+		dev_err(adev->dev, "Could not create product_number\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_serial_number);
 	if (r) {
-		dev_err(adev->dev, "Could not create serial_number");
+		dev_err(adev->dev, "Could not create serial_number\n");
 		return r;
 	}
 
@@ -4270,7 +4270,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		job_signaled = true;
 
 	if (job_signaled) {
-		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
+		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset\n");
 		goto skip_hw_reset;
 	}
 
@@ -4339,10 +4339,12 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 		if (r) {
 			/* bad news, how to tell it to userspace ? */
-			dev_info(tmp_adev->dev, "GPU reset(%d) failed\n", atomic_read(&tmp_adev->gpu_reset_counter));
+			dev_info(tmp_adev->dev, "GPU reset(%d) failed\n",
+				 atomic_read(&tmp_adev->gpu_reset_counter));
 			amdgpu_vf_error_put(tmp_adev, AMDGIM_ERROR_VF_GPU_RESET_FAIL, 0, r);
 		} else {
-			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n", atomic_read(&tmp_adev->gpu_reset_counter));
+			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n",
+				 atomic_read(&tmp_adev->gpu_reset_counter));
 		}
 	}
 
-- 
2.20.1
