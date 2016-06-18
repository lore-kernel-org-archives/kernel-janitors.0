From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Jun 2016 08:38:44 +0000
Subject: [patch] drm/amdgpu: precedence bug in amdgpu_device_init()
Message-Id: <20160618083844.GA21713@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Andres Rodriguez <andres.rodriguez@amd.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Flora Cui <Flora.Cui@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>

! has higher precedence than bitwise & so we need to add parenthesis
for this to work as intended.

Fixes: 048765ad5af7 ('amdgpu: fix asic initialization for virtualized environments (v2)')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 66482b4..6e92008 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1535,7 +1535,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	/* Post card if necessary */
 	if (!amdgpu_card_posted(adev) ||
 	    (adev->virtualization.is_virtual &&
-	     !adev->virtualization.caps & AMDGPU_VIRT_CAPS_SRIOV_EN)) {
+	     !(adev->virtualization.caps & AMDGPU_VIRT_CAPS_SRIOV_EN))) {
 		if (!adev->bios) {
 			dev_err(adev->dev, "Card not posted and no BIOS - ignoring\n");
 			return -EINVAL;
