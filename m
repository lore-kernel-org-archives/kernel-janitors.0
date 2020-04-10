From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 19:22:52 +0000
Subject: [PATCH] drm/i915/gt: remove redundant assignment to variable x
Message-Id: <20200410192252.76908-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222134755.134209-1-colin.king@canonical.com>
In-Reply-To: <20200222134755.134209-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable x is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3aa8a652c16d..0b597427bde9 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1205,7 +1205,7 @@ static void print_request(struct drm_printer *m,
 {
 	const char *name = rq->fence.ops->get_timeline_name(&rq->fence);
 	char buf[80] = "";
-	int x = 0;
+	int x;
 
 	x = print_sched_attr(rq->i915, &rq->sched.attr, buf, x, sizeof(buf));
 
-- 
2.25.1
