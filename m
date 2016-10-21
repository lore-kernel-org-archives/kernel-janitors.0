From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Oct 2016 08:06:01 +0000
Subject: [patch] drm/i915/gvt: cleanup a type issue in submit_context()
Message-Id: <20161021080601.GA28738@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Yulei Zhang <yulei.zhang@intel.com>, Zhi Wang <zhi.a.wang@intel.com>

submit_context() should return negative error codes and zero on success
but by mistake we made it a bool.  I've changed it to int.  Also I made
it static because this isn't referenced in any other files.

This doesn't affect runtime because the return is eventually propogated
to elsp_mmio_write() where it is ignored.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index c50a3d1a5131..bc69ba1842ea 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -616,7 +616,7 @@ static int prepare_mm(struct intel_vgpu_workload *workload)
 	(list_empty(q) ? NULL : container_of(q->prev, \
 	struct intel_vgpu_workload, list))
 
-bool submit_context(struct intel_vgpu *vgpu, int ring_id,
+static int submit_context(struct intel_vgpu *vgpu, int ring_id,
 		struct execlist_ctx_descriptor_format *desc,
 		bool emulate_schedule_in)
 {
