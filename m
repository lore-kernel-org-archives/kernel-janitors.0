From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2020 12:00:54 +0000
Subject: [PATCH] drm/amdgpu: off by on in amdgpu_device_attr_create_groups() error handling
Message-Id: <20200520120054.GB172354@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Hawking Zhang <Hawking.Zhang@amd.com>, Rui Huang <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Yintian Tao <yttao@amd.com>

This loop in the error handling code should start a "i - 1" and end at
"i = 0".  Currently it starts a "i" and ends at "i = 1".  The result
is that it removes one attribute that wasn't created yet, and leaks the
zeroeth attribute.

Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index b75362bf0742..ee4a8e44fbeb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -1931,7 +1931,7 @@ static int amdgpu_device_attr_create_groups(struct amdgpu_device *adev,
 					    uint32_t mask)
 {
 	int ret = 0;
-	uint32_t i = 0;
+	int i;
 
 	for (i = 0; i < counts; i++) {
 		ret = amdgpu_device_attr_create(adev, &attrs[i], mask);
@@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struct amdgpu_device *adev,
 	return 0;
 
 failed:
-	for (; i > 0; i--) {
+	while (--i >= 0)
 		amdgpu_device_attr_remove(adev, &attrs[i]);
-	}
 
 	return ret;
 }
-- 
2.26.2
