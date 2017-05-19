From: Colin King <colin.king@canonical.com>
Date: Fri, 19 May 2017 17:56:17 +0000
Subject: [PATCH][drm-next] drm/i915: Check for allocation failure
Message-Id: <20170519175617.7036-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, Chris Wilson <chris@chris-wilson.co.uk>, Mika Kuoppala <mika.kuoppala@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The memory allocation for C is not being null checked and hence we
could end up with a null pointer dereference. Fix this with a null
pointer check. (I really should have noticed this when I was fixing an
earlier issue.)

Detected by CoverityScan, CID#1436406 ("Dereference null return")

Fixes: 47624cc3301b60 ("drm/i915: Import the kfence selftests for i915_sw_fence")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
index c31d439fae3a..33128be77bbe 100644
--- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
@@ -123,6 +123,10 @@ static int test_dag(void *arg)
 	}
 
 	C = alloc_fence();
+	if (!C) {
+		ret = -ENOMEM;
+		goto err_B;
+	}
 	if (i915_sw_fence_await_sw_fence_gfp(B, C, GFP_KERNEL) = -EINVAL) {
 		pr_err("invalid cycle detected\n");
 		goto err_C;
-- 
2.11.0

