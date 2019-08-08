From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Aug 2019 10:32:36 +0000
Subject: [PATCH] drm/i915: Use after free in error path in intel_vgpu_create_workload()
Message-Id: <20190808103236.GB30506@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Xiong Zhang <xiong.y.zhang@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>

We can't free "workload" until after the printk or it's a use after
free.

Fixes: 2089a76ade90 ("drm/i915/gvt: Checking workload's gma earlier")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 32ae6b5b7e16..ac1dbb176874 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1525,9 +1525,9 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu, int ring_id,
 			if (!intel_gvt_ggtt_validate_range(vgpu,
 				workload->wa_ctx.indirect_ctx.guest_gma,
 				workload->wa_ctx.indirect_ctx.size)) {
-				kmem_cache_free(s->workloads, workload);
 				gvt_vgpu_err("invalid wa_ctx at: 0x%lx\n",
 				    workload->wa_ctx.indirect_ctx.guest_gma);
+				kmem_cache_free(s->workloads, workload);
 				return ERR_PTR(-EINVAL);
 			}
 		}
@@ -1539,9 +1539,9 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu, int ring_id,
 			if (!intel_gvt_ggtt_validate_range(vgpu,
 				workload->wa_ctx.per_ctx.guest_gma,
 				CACHELINE_BYTES)) {
-				kmem_cache_free(s->workloads, workload);
 				gvt_vgpu_err("invalid per_ctx at: 0x%lx\n",
 					workload->wa_ctx.per_ctx.guest_gma);
+				kmem_cache_free(s->workloads, workload);
 				return ERR_PTR(-EINVAL);
 			}
 		}
-- 
2.20.1
