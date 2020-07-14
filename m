From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 14:36:52 +0000
Subject: [PATCH v2] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-Id: <20200714143652.GA337376@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

The error code needs to be set on this path.  It currently returns
success.

Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix a different bug instead.  :P  Colin fixed mine already.

 drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index 0aa151501fb3..c232194c60a2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -358,6 +358,7 @@ static int live_noa_gpr(void *arg)
 		cs = intel_ring_begin(rq, 4);
 		if (IS_ERR(cs)) {
 			i915_request_add(rq);
+			err = PTR_ERR(cs);
 			goto out_rq;
 		}
 
-- 
2.27.0
