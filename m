From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jun 2018 11:09:11 +0000
Subject: [PATCH] drm/i915/selftests: Don't dereference an error pointer
Message-Id: <20180620110907.pnr5zrqmsko4cyvy@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

There is an error path where "ctx" is an error pointer so we can't
pass it to kernel_context_close().

Fixes: 09a4c02e58c1 ("drm/i915: Look for an active kernel context before switching")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
index 836f1af8b833..e41036fcd97e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
@@ -541,7 +541,8 @@ static int igt_switch_to_kernel_context(void *arg)
 		err = -EIO;
 	mutex_unlock(&i915->drm.struct_mutex);
 
-	kernel_context_close(ctx);
+	if (!IS_ERR(ctx))
+		kernel_context_close(ctx);
 	return err;
 }
 
