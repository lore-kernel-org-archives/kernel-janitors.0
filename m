From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 14:12:16 +0000
Subject: [PATCH] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-Id: <20200714141216.GA314989@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The error code is not set on this error path.  It's either zero or
uninitialized at this point.

Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index deb6dec1b5ab..7aa73bb03381 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -329,6 +329,7 @@ static int live_noa_gpr(void *arg)
 	cs = intel_ring_begin(rq, 2 * 32 + 2);
 	if (IS_ERR(cs)) {
 		i915_request_add(rq);
+		err = PTR_ERR(cs);
 		goto out_rq;
 	}
 
-- 
2.27.0
