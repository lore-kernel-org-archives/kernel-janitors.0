From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 14:53:07 +0000
Subject: [patch v2] drm/i915/gvt/kvmgt: remove some dead code
Message-Id: <20170207145307.GA28648@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1486478097.3121.120.camel@linux.intel.com>
In-Reply-To: <1486478097.3121.120.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Jike Song <jike.song@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org

"caps.buf" is always NULL here and "caps.size" is always zero.  The code
is a no-op and can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3f656e3a6e5a..773a45aa18f8 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -965,11 +965,6 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 			sparse->areas[0].offset  					PAGE_ALIGN(vgpu_aperture_offset(vgpu));
 			sparse->areas[0].size = vgpu_aperture_sz(vgpu);
-			if (!caps.buf) {
-				kfree(caps.buf);
-				caps.buf = NULL;
-				caps.size = 0;
-			}
 			break;
 
 		case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
