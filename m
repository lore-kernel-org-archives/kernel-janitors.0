From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 02 Jul 2020 01:55:52 +0000
Subject: [PATCH -next] drm/amdgpu: remove set but not used variable 'adev'
Message-Id: <20200702015552.42377-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542279133-103893-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542279133-103893-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org, tianci.yin@amd.com, kraxel@redhat.com, Likun.Gao@amd.com, Felix.Kuehling@amd.com, jgg@ziepe.ca, Hawking.Zhang@amd.com
Cc: YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_init_mem_type':
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:81:24: warning:
 variable 'adev' set but not used [-Wunused-but-set-variable]
  struct amdgpu_device *adev;
                        ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index bb95627ad2cc..8199702d3354 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -78,10 +78,6 @@
 static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 				struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_device *adev;
-
-	adev = amdgpu_ttm_adev(bdev);
-
 	switch (type) {
 	case TTM_PL_SYSTEM:
 		/* System memory */
