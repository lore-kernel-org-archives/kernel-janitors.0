From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:16:31 +0000
Subject: [patch] drm/i915/gvt/kvmgt: remove some dead code
Message-Id: <20170207131630.GA28207@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Jike Song <jike.song@intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>

If "caps.buf" is already NULL then it doesn't need to be freed or set to
NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3f656e3a6e5a..de2a55178a37 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -965,11 +965,8 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 			sparse->areas[0].offset  					PAGE_ALIGN(vgpu_aperture_offset(vgpu));
 			sparse->areas[0].size = vgpu_aperture_sz(vgpu);
-			if (!caps.buf) {
-				kfree(caps.buf);
-				caps.buf = NULL;
+			if (!caps.buf)
 				caps.size = 0;
-			}
 			break;
 
 		case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
