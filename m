From: Colin King <colin.king@canonical.com>
Date: Thu, 18 May 2017 13:39:42 +0000
Subject: [PATCH] drm/i915: Check C for null pointer rather than B
Message-Id: <20170518133942.5660-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two occasions where pointer B is being check for a NULL
when it should be pointer C instead. Fix these.

Detected by CoverityScan, CID#1436348,1436349 ("Logically Dead Code")

Fixes: 47624cc3301b60 ("drm/i915: Import the kfence selftests for i915_sw_fence")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
index 98baf10c28c6..c31d439fae3a 100644
--- a/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/selftests/i915_sw_fence.c
@@ -311,7 +311,7 @@ static int test_AB_C(void *arg)
 	}
 
 	C = alloc_fence();
-	if (!B) {
+	if (!C) {
 		ret = -ENOMEM;
 		goto err_B;
 	}
@@ -388,7 +388,7 @@ static int test_C_AB(void *arg)
 	}
 
 	C = alloc_fence();
-	if (!B) {
+	if (!C) {
 		ret = -ENOMEM;
 		goto err_B;
 	}
-- 
2.11.0

