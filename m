From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Apr 2017 19:52:17 +0000
Subject: [PATCH] drm/i915: checking for NULL instead of IS_ERR() in mock selftests
Message-Id: <20170413195217.GA26108@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>

i915_gem_request_alloc() uses error pointers.  It never returns NULLs.

Fixes: 0daf0113cff6 ("drm/i915: Mock infrastructure for request emission")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/selftests/mock_request.c b/drivers/gpu/drm/i915/selftests/mock_request.c
index 0e8d2e7f8c70..8097e3693ec4 100644
--- a/drivers/gpu/drm/i915/selftests/mock_request.c
+++ b/drivers/gpu/drm/i915/selftests/mock_request.c
@@ -35,7 +35,7 @@ mock_request(struct intel_engine_cs *engine,
 
 	/* NB the i915->requests slab cache is enlarged to fit mock_request */
 	request = i915_gem_request_alloc(engine, context);
-	if (!request)
+	if (IS_ERR(request))
 		return NULL;
 
 	mock = container_of(request, typeof(*mock), base);
