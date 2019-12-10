From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Dec 2019 14:32:05 +0000
Subject: [PATCH][next] drm/i915/selftests: fix uninitialized variable sum when summing up values
Message-Id: <20191210143205.338308-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the variable sum is not uninitialized and hence will cause an
incorrect result in the summation values.  Fix this by initializing
sum to the first item in the summation.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 3c7a44bbbfa7 ("drm/i915/selftests: Perform some basic cycle counting of MI ops")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
index 761d81f4bd68..f88e445a1cae 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
@@ -108,7 +108,7 @@ static u32 trifilter(u32 *a)
 
 	sort(a, COUNT, sizeof(*a), cmp_u32, NULL);
 
-	sum += mul_u32_u32(a[2], 2);
+	sum = mul_u32_u32(a[2], 2);
 	sum += a[1];
 	sum += a[3];
 
-- 
2.24.0
