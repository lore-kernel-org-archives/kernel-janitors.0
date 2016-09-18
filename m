From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 16:53:06 +0000
Subject: [PATCH 4/5] drm/amdgpu: Rename a jump label in amdgpu_device_init()
Message-Id: <ebf7ea58-174a-572f-3da8-3ee624d9b82f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
In-Reply-To: <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Monk Liu <Monk.Liu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 17:50:09 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2b8ba97..fed4854 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1566,18 +1566,18 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* Read BIOS */
 	if (!amdgpu_get_bios(adev)) {
 		r = -EINVAL;
-		goto failed;
+		goto check_runtime;
 	}
 	/* Must be an ATOMBIOS */
 	if (!adev->is_atom_bios) {
 		dev_err(adev->dev, "Expecting atombios for GPU\n");
 		r = -EINVAL;
-		goto failed;
+		goto check_runtime;
 	}
 	r = amdgpu_atombios_init(adev);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_atombios_init failed\n");
-		goto failed;
+		goto check_runtime;
 	}
 
 	/* See if the asic supports SR-IOV */
@@ -1595,7 +1595,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		if (!adev->bios) {
 			dev_err(adev->dev, "Card not posted and no BIOS - ignoring\n");
 			r = -EINVAL;
-			goto failed;
+			goto check_runtime;
 		}
 		DRM_INFO("GPU not posted. posting now...\n");
 		amdgpu_atom_asic_init(adev->mode_info.atom_context);
@@ -1605,7 +1605,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	r = amdgpu_atombios_get_clock_info(adev);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_atombios_get_clock_info failed\n");
-		goto failed;
+		goto check_runtime;
 	}
 	/* init i2c buses */
 	amdgpu_atombios_i2c_init(adev);
@@ -1614,7 +1614,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	r = amdgpu_fence_driver_init(adev);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_fence_driver_init failed\n");
-		goto failed;
+		goto check_runtime;
 	}
 
 	/* init the mode config */
@@ -1624,7 +1624,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (r) {
 		dev_err(adev->dev, "amdgpu_init failed\n");
 		amdgpu_fini(adev);
-		goto failed;
+		goto check_runtime;
 	}
 
 	adev->accel_working = true;
@@ -1634,7 +1634,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	r = amdgpu_ib_pool_init(adev);
 	if (r) {
 		dev_err(adev->dev, "IB initialization failed (%d).\n", r);
-		goto failed;
+		goto check_runtime;
 	}
 
 	r = amdgpu_ib_ring_tests(adev);
@@ -1682,12 +1682,11 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	r = amdgpu_late_init(adev);
 	if (r) {
 		dev_err(adev->dev, "amdgpu_late_init failed\n");
-		goto failed;
+		goto check_runtime;
 	}
 
 	return 0;
-
-failed:
+ check_runtime:
 	if (runtime)
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
 	return r;
-- 
2.10.0

