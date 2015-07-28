From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Jul 2015 15:51:29 +0000
Subject: [patch] drm/amdgpu: information leak in amdgpu_info_ioctl()
Message-Id: <20150728155129.GC25739@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Leo Liu <leo.liu@amd.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, yanyang1 <young.yang@amd.com>, Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We recently changed the drm_amdgpu_info_device struct so now there is
a 4 byte hole at the end.  We need to initialize it so we don't disclose
secret information from the stack.

Fixes: fa92754e9c47 ('drm/amdgpu: add VCE harvesting instance query')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index d9de73a..81d60a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -423,7 +423,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 		return n ? -EFAULT : 0;
 	}
 	case AMDGPU_INFO_DEV_INFO: {
-		struct drm_amdgpu_info_device dev_info;
+		struct drm_amdgpu_info_device dev_info = {};
 		struct amdgpu_cu_info cu_info;
 
 		dev_info.device_id = dev->pdev->device;
