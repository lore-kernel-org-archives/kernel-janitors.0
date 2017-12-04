From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Dec 2017 17:21:06 +0000
Subject: [PATCH][next] drm/i915/gvt: fix off-by-one comparison of ring_id
Message-Id: <20171204172106.14950-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The ring_id maximum boundary is being compared using the > operator
instead of >=, leading to an off-by-one error and an out of bounds
write into array vgpu->hws_pga[].  Fix this by simply using the
correct comparison operator. Also re-work another comparison that
uses the comparison > I915_NUM_ENGINES - 1 to use the >= idiom using
to keep this consistent in this code.

Detected by CoverityScan, CID#1462404 ("Out-of-bounds write")

Fixes: a2ae95af9646 ("drm/i915/gvt: update CSB and CSB write pointer in virtual HWSP")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 7354ed816f92..c982867e7c2b 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1398,7 +1398,7 @@ static int hws_pga_write(struct intel_vgpu *vgpu, unsigned int offset,
 	 * update the VM CSB status correctly. Here listed registers can
 	 * support BDW, SKL or other platforms with same HWSP registers.
 	 */
-	if (unlikely(ring_id < 0 || ring_id > I915_NUM_ENGINES)) {
+	if (unlikely(ring_id < 0 || ring_id >= I915_NUM_ENGINES)) {
 		gvt_vgpu_err("VM(%d) access unknown hardware status page register:0x%x\n",
 			     vgpu->id, offset);
 		return -EINVAL;
@@ -1473,7 +1473,7 @@ static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	u32 data = *(u32 *)p_data;
 	int ret = 0;
 
-	if (WARN_ON(ring_id < 0 || ring_id > I915_NUM_ENGINES - 1))
+	if (WARN_ON(ring_id < 0 || ring_id >= I915_NUM_ENGINES))
 		return -EINVAL;
 
 	execlist = &vgpu->submission.execlist[ring_id];
-- 
2.14.1

