From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 30 Mar 2018 02:25:17 +0000
Subject: [PATCH -next] drm/amdkfd: Fix the error return code in kfd_ioctl_unmap_memory_from_gpu()
Message-Id: <1522376717-136486-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oded.gabbay@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Passing NULL pointer to PTR_ERR will result in return value of 0
indicating success which is clearly not what it is intended here.
This patch returns -EINVAL instead.

Fixes: 5ec7e02854b3 ("drm/amdkfd: Add ioctls for GPUVM memory management")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index cd679cf..c32a341 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1421,7 +1421,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 
 	pdd = kfd_get_process_device_data(dev, p);
 	if (!pdd) {
-		err = PTR_ERR(pdd);
+		err = -EINVAL;
 		goto bind_process_to_device_failed;
 	}

