From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Aug 2017 07:07:00 +0000
Subject: [PATCH v2] drm/i915: Fix integer overflow tests
Message-Id: <20170818064054.tjp7mqxzuwbruvj7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOFGe948rzTWPr0ZNg7VP-nxDkMNdEU0qSfUA90XzsaEfyO2mg@mail.gmail.com>
In-Reply-To: <CAOFGe948rzTWPr0ZNg7VP-nxDkMNdEU0qSfUA90XzsaEfyO2mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

There are some potential integer overflows here on 64 bit systems.

The condition "if (nfences > SIZE_MAX / sizeof(*fences))" can only be
true on 32 bit systems, it's a no-op on 64 bit, so let's ignore the
check for now and look a couple lines after:

        if (!access_ok(VERIFY_READ, user, nfences * 2 * sizeof(u32)))
                                          ^^^^^^^^^^^
"nfences" is an unsigned int, so if we set it to UINT_MAX and multiply
by two, it's going to have an integer overflow.  The multiplication by
sizeof(u32) is OK because that gets type promoted to size_t.  This patch
changes the access_ok() check to use sizeof(*user) which fixes the
integer overflow and is also more readable.

The "args->buffer_count" variable is an unsigned int as well so it could
overflow if it's set to UINT_MAX when we do:

        exec2_list = kvmalloc_array(args->buffer_count + 1, sz,
                                    ^^^^^^^^^^^^^^^^^^^^^^

Originally, those two integer overflow checks were against UINT_MAX
instead of SIZE_MAX and this patch changes them back.

Fixes: 2889caa92321 ("drm/i915: Eliminate lots of iterations over the execobjects array")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use sizeof(*users)

diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
index 15ab3e6792f9..11419b81cf13 100644
--- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
@@ -2156,7 +2156,7 @@ get_fence_array(struct drm_i915_gem_execbuffer2 *args,
 		return ERR_PTR(-EINVAL);
 
 	user = u64_to_user_ptr(args->cliprects_ptr);
-	if (!access_ok(VERIFY_READ, user, nfences * 2 * sizeof(u32)))
+	if (!access_ok(VERIFY_READ, user, nfences * sizeof(*user)))
 		return ERR_PTR(-EFAULT);
 
 	fences = kvmalloc_array(args->num_cliprects, sizeof(*fences),
@@ -2520,7 +2520,7 @@ i915_gem_execbuffer(struct drm_device *dev, void *data,
 	unsigned int i;
 	int err;
 
-	if (args->buffer_count < 1 || args->buffer_count > SIZE_MAX / sz - 1) {
+	if (args->buffer_count < 1 || args->buffer_count > UINT_MAX / sz - 1) {
 		DRM_DEBUG("execbuf2 with %d buffers\n", args->buffer_count);
 		return -EINVAL;
 	}
@@ -2609,7 +2609,7 @@ i915_gem_execbuffer2(struct drm_device *dev, void *data,
 	struct drm_syncobj **fences = NULL;
 	int err;
 
-	if (args->buffer_count < 1 || args->buffer_count > SIZE_MAX / sz - 1) {
+	if (args->buffer_count < 1 || args->buffer_count > UINT_MAX / sz - 1) {
 		DRM_DEBUG("execbuf2 with %d buffers\n", args->buffer_count);
 		return -EINVAL;
 	}
