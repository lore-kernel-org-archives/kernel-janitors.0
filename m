From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Aug 2018 06:46:02 +0000
Subject: [PATCH] drm/i915/gvt: Off by one in intel_vgpu_write_fence()
Message-Id: <20180807064602.sagf25ettlvfpidm@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180807023944.GZ22630@zhen-hp.sh.intel.com>
In-Reply-To: <20180807023944.GZ22630@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org

The > should be >= here so that we don't read one element beyond the
end of the array.

Fixes: 28a60dee2ce6 ("drm/i915/gvt: vGPU HW resource management")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 380eeb2a0e83..fe754022e356 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -131,7 +131,7 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
 
 	assert_rpm_wakelock_held(dev_priv);
 
-	if (WARN_ON(fence > vgpu_fence_sz(vgpu)))
+	if (WARN_ON(fence >= vgpu_fence_sz(vgpu)))
 		return;
 
 	reg = vgpu->fence.regs[fence];
