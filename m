From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jun 2020 08:52:07 +0000
Subject: [PATCH][next] drm/i915/selftests: fix spelling mistake "submited" -> "submitted"
Message-Id: <20200617085207.167552-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index b8b7b91019f4..547edf3d902b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -482,7 +482,7 @@ static int live_unlite_ring(void *arg)
 		err = wait_for_submit(engine, rq, HZ / 2);
 		i915_request_put(rq);
 		if (err) {
-			pr_err("%s: preemption request was not submited\n",
+			pr_err("%s: preemption request was not submitted\n",
 			       engine->name);
 			err = -ETIME;
 		}
-- 
2.27.0.rc0
