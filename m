From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Feb 2021 15:58:27 +0000
Subject: [PATCH] drm/i915/selftest: Fix an error code in mock_context_barrier()
Message-Id: <YCqaI95UW9L7Mg/L@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714141216.GA314989@mwanda>
In-Reply-To: <20200714141216.GA314989@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>

If the igt_request_alloc() call fails then this should return a
negative error code, but currently it returns success.

Fixes: 85fddf0b0027 ("drm/i915: Introduce a context barrier callback")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index d3f87dc4eda3..c30b583522ca 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1942,6 +1942,7 @@ static int mock_context_barrier(void *arg)
 	rq = igt_request_alloc(ctx, i915->gt.engine[RCS0]);
 	if (IS_ERR(rq)) {
 		pr_err("Request allocation failed!\n");
+		err = PTR_ERR(rq);
 		goto out;
 	}
 	i915_request_add(rq);
-- 
2.30.0
