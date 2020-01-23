From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 15:14:06 +0000
Subject: [PATCH][next] drm/i915/gem: fix null pointer dereference on vm
Message-Id: <20200123151406.51679-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Michael J . Ruhl" <michael.j.ruhl@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the call to function context_get_vm_rcu returns
a null pointer for vm then the error exit path via label err_put
will call i915_vm_put on the null vm, causing a null pointer
dereference.  Fix this by adding a null check on vm and returning
without calling the i915_vm_put.

Fixes: 5dbd2b7be61e ("drm/i915/gem: Convert vm idr to xarray")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5d4157e1ccf7..3e6e34ec9fa8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1005,9 +1005,12 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
 	err = -ENODEV;
 	rcu_read_lock();
 	vm = context_get_vm_rcu(ctx);
-	if (vm)
-		err = xa_alloc(&file_priv->vm_xa, &id, vm,
-			       xa_limit_32b, GFP_KERNEL);
+	if (!vm) {
+		rcu_read_unlock();
+		return err;
+	}
+	err = xa_alloc(&file_priv->vm_xa, &id, vm,
+		       xa_limit_32b, GFP_KERNEL);
 	rcu_read_unlock();
 	if (err)
 		goto err_put;
-- 
2.24.0
