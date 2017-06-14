From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 09:14:52 +0000
Subject: [PATCH] drm/i915/selftests: silence a bogus spammy warning
Message-Id: <20170614091452.GE29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>

These tests are reversed so it complains on every successful call and
stays quiet for every failure.  Also we may as well preserve the error
code.

Fixes: f40a7b7558ef ("drm/i915: Initial selftests for exercising eviction")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested.

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index 14e9c2fbc4e6..0448ef9ee807 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -152,9 +152,9 @@ static int igt_overcommit(void *arg)
 	list_move(&obj->global_link, &i915->mm.unbound_list);
 
 	vma = i915_gem_object_ggtt_pin(obj, NULL, 0, 0, 0);
-	if (!IS_ERR(vma) || PTR_ERR(vma) != -ENOSPC) {
+	if (IS_ERR(vma) && PTR_ERR(vma) != -ENOSPC) {
 		pr_err("Failed to evict+insert, i915_gem_object_ggtt_pin returned err=%d\n", (int)PTR_ERR(vma));
-		err = -EINVAL;
+		err = PTR_ERR(vma);
 		goto cleanup;
 	}
 
