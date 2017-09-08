From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Sep 2017 14:13:33 +0000
Subject: [PATCH] drm/amdkfd: check for null dev to avoid a null pointer dereference
Message-Id: <20170908141333.1563-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to kfd_device_by_id can potentially return null, so check that
dev is null and return with -EINVAL to avoid a null pointer dereference.

Detected by CoverityScan CID#1454629 ("Dereference null return value")

Fixes: 5d71dbc3a588 ("drm/amdkfd: Implement image tiling mode support v2")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e4a8c2e52cb2..660b3fbade41 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -892,6 +892,8 @@ static int kfd_ioctl_get_tile_config(struct file *filep,
 	int err = 0;
 
 	dev = kfd_device_by_id(args->gpu_id);
+	if (!dev)
+		return -EINVAL;
 
 	dev->kfd2kgd->get_tile_config(dev->kgd, &config);
 
-- 
2.14.1

