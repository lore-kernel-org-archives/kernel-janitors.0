From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 08:19:24 +0000
Subject: [patch] drm/amdgpu: remove an unnecessary condition
Message-Id: <20150611081924.GA27090@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, yanyang1 <young.yang@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

We already checked "if (r)" so there is no need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 5533434..b7d0425 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -111,12 +111,9 @@ int amdgpu_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	/* Call ACPI methods: require modeset init
 	 * but failure is not fatal
 	 */
-	if (!r) {
-		acpi_status = amdgpu_acpi_init(adev);
-		if (acpi_status)
-		dev_dbg(&dev->pdev->dev,
-				"Error during ACPI methods call\n");
-	}
+	acpi_status = amdgpu_acpi_init(adev);
+	if (acpi_status)
+		dev_dbg(&dev->pdev->dev, "Error during ACPI methods call\n");
 
 	if (amdgpu_device_is_px(dev)) {
 		pm_runtime_use_autosuspend(dev->dev);
