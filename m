From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Oct 2020 11:29:47 +0000
Subject: [PATCH 2/2] vfio/fsl-mc: prevent underflow in vfio_fsl_mc_mmap()
Message-Id: <20201023112947.GF282278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diana Craciun <diana.craciun@oss.nxp.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static analsysis tool complains that the "index" can be negative.
There are some checks in do_mmap() which try to prevent underflows but
I don't know if they are sufficient for this situation.  Either way,
making "index" unsigned is harmless so let's do it just to be safe.

Fixes: 67247289688d ("vfio/fsl-mc: Allow userspace to MMAP fsl-mc device MMIO regions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 21f22e3da11f..f27e25112c40 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -472,7 +472,7 @@ static int vfio_fsl_mc_mmap(void *device_data, struct vm_area_struct *vma)
 {
 	struct vfio_fsl_mc_device *vdev = device_data;
 	struct fsl_mc_device *mc_dev = vdev->mc_dev;
-	int index;
+	unsigned int index;
 
 	index = vma->vm_pgoff >> (VFIO_FSL_MC_OFFSET_SHIFT - PAGE_SHIFT);
 
-- 
2.28.0
