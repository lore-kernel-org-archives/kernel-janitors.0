From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Oct 2019 08:52:10 +0000
Subject: [PATCH] drm/amdkfd: Fix a && vs || typo
Message-Id: <20191007085210.GC3865@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <Felix.Kuehling@amd.com>, Yong Zhao <Yong.Zhao@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

In the current code if "device_info" is ever NULL then the kernel will
Oops so probably || was intended instead of &&.

Fixes: e392c887df97 ("drm/amdkfd: Use array to probe kfd2kgd_calls")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 0db273587af4..070c9b5593c9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -498,7 +498,7 @@ struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
 	device_info = kfd_supported_devices[asic_type][vf];
 	f2g = kfd2kgd_funcs[asic_type];
 
-	if (!device_info && !f2g) {
+	if (!device_info || !f2g) {
 		dev_err(kfd_device, "%s %s not supported in kfd\n",
 			amdgpu_asic_name[asic_type], vf ? "VF" : "");
 		return NULL;
-- 
2.20.1
