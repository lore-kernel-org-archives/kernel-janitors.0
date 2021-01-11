From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Jan 2021 14:18:08 +0000
Subject: [PATCH v2] drm/i915: selftest_lrc: Fix error code in live_preempt_user()
Message-Id: <X/xeIMP16sDekYrh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <161037060292.28181.5373987654669273170@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: Andi Shyti <andi.shyti@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

This error path should return a negative error code instead of success.

Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
v2: The first version of the patch fixed some other error paths but
    those have already been fixed.

 drivers/gpu/drm/i915/gt/selftest_lrc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 95d41c01d0e0..e11d6bb26e86 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -3264,8 +3264,10 @@ static int live_preempt_user(void *arg)
 
 			rq = create_gpr_client(engine, global,
 					       NUM_GPR * i * sizeof(u32));
-			if (IS_ERR(rq))
+			if (IS_ERR(rq)) {
+				err = PTR_ERR(rq);
 				goto end_test;
+			}
 
 			client[i] = rq;
 		}
-- 
2.29.2
