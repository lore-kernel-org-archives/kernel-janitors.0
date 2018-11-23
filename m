From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Nov 2018 07:22:19 +0000
Subject: [PATCH] drm/i915/gvt: Use after free in intel_vgpu_destroy_ggtt_mm()
Message-Id: <20181123072219.m3xfwlg2o4iujfk5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Hang Yuan <hang.yuan@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org

We need to use the _safe() version of this macro so that we don't
dereference "pos" when it is freed.

Fixes: bc0686ff5fad ("drm/i915/gvt: support inconsecutive partial gtt entry write")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 58e166effa45..3f416341ae5f 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2447,9 +2447,9 @@ static void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
 
 static void intel_vgpu_destroy_ggtt_mm(struct intel_vgpu *vgpu)
 {
-	struct intel_gvt_partial_pte *pos;
+	struct intel_gvt_partial_pte *pos, *n;
 
-	list_for_each_entry(pos,
+	list_for_each_entry_safe(pos, n,
 			&vgpu->gtt.ggtt_mm->ggtt_mm.partial_pte_list, list) {
 		gvt_dbg_mm("partial PTE update on hold 0x%lx : 0x%llx\n",
 			pos->offset, pos->data);
-- 
2.11.0
