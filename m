From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Aug 2013 06:53:23 +0000
Subject: [patch] drm/i915: use _safe version of list_for_each
Message-Id: <20130819065323.GA28591@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We sometimes call i915_vma_unbind() inside the loop and that can free
the vma.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Untested.

diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
index 9b3b5f8..5249735 100644
--- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
@@ -524,7 +524,7 @@ i915_gem_execbuffer_reserve(struct intel_ring_buffer *ring,
 			    bool *need_relocs)
 {
 	struct drm_i915_gem_object *obj;
-	struct i915_vma *vma;
+	struct i915_vma *vma, *n;
 	struct list_head ordered_vmas;
 	bool has_fenced_gpu_access = INTEL_INFO(ring->dev)->gen < 4;
 	int retry;
@@ -572,7 +572,7 @@ i915_gem_execbuffer_reserve(struct intel_ring_buffer *ring,
 		int ret = 0;
 
 		/* Unbind any ill-fitting objects or pin. */
-		list_for_each_entry(vma, vmas, exec_list) {
+		list_for_each_entry_safe(vma, n, vmas, exec_list) {
 			struct drm_i915_gem_exec_object2 *entry = vma->exec_entry;
 			bool need_fence, need_mappable;
 
