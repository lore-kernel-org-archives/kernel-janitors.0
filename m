From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 21:33:22 +0000
Subject: [PATCH] drm/amdkfd: Delete an error message for a failed memory allocation in kfd_topology_init()
Message-Id: <94b486c9-92ce-dae8-3d5e-db1943fc0119@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Oded Gabbay <oded.gabbay@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 22:23:57 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 19ce59028d6b..610e3d4ac575 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1019,7 +1019,6 @@ int kfd_topology_init(void)
 		crat_image = kmalloc(image_size, GFP_KERNEL);
 		if (!crat_image) {
 			ret = -ENOMEM;
-			pr_err("No memory for allocating CRAT image\n");
 			goto err;
 		}
 		ret = kfd_topology_get_crat_acpi(crat_image, &image_size);
-- 
2.16.1

