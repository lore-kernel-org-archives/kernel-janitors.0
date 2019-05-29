From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2019 11:03:55 +0000
Subject: [PATCH] drm/i915: selftest_lrc: Check the correct variable
Message-Id: <20190529110355.GA19119@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org

We should check "request[n]" instead of just "request".

Fixes: 78e41ddd2198 ("drm/i915: Apply an execution_mask to the virtual_engine")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index a8c50900e2d4..13674f836955 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1526,8 +1526,8 @@ static int mask_virtual_engine(struct drm_i915_private *i915,
 
 	for (n = 0; n < nsibling; n++) {
 		request[n] = i915_request_create(ve);
-		if (IS_ERR(request)) {
-			err = PTR_ERR(request);
+		if (IS_ERR(request[n])) {
+			err = PTR_ERR(request[n]);
 			nsibling = n;
 			goto out;
 		}
-- 
2.20.1
