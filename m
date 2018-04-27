From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Apr 2018 14:06:16 +0000
Subject: [PATCH] drm/i915/selftests: Potential uninitialized return in live_reset_whitelist()
Message-Id: <20180427140616.GC19583@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

Smatch complains that "err" could be uninitialized at the end.  I don't
know the code well but that seems like a reasonable warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/selftests/intel_workarounds.c b/drivers/gpu/drm/i915/selftests/intel_workarounds.c
index 5455b2626627..17444a3abbb9 100644
--- a/drivers/gpu/drm/i915/selftests/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/selftests/intel_workarounds.c
@@ -239,7 +239,7 @@ static int live_reset_whitelist(void *arg)
 	struct intel_engine_cs *engine = i915->engine[RCS];
 	struct i915_gpu_error *error = &i915->gpu_error;
 	struct whitelist w;
-	int err;
+	int err = 0;
 
 	/* If we reset the gpu, we should not lose the RING_NONPRIV */
 
