From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Mar 2019 09:24:51 +0000
Subject: [PATCH v2] drm/i915/selftests: fix NULL vs IS_ERR() check in mock_context_barrier()
Message-Id: <20190321092451.GK2202@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8736ng1u4f.fsf@gaia.fi.intel.com>
In-Reply-To: <8736ng1u4f.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>

The mock_context() function returns NULL on error, it doesn't return
error pointers.

Fixes: 85fddf0b0027 ("drm/i915: Introduce a context barrier callback")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
V2: I accidentally sent a bunch of unrelated stuff...

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
index 4399ef9ebf15..a172dbd9cb9e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_context.c
@@ -1620,8 +1620,8 @@ static int mock_context_barrier(void *arg)
 	mutex_lock(&i915->drm.struct_mutex);
 
 	ctx = mock_context(i915, "mock");
-	if (IS_ERR(ctx)) {
-		err = PTR_ERR(ctx);
+	if (!ctx) {
+		err = -ENOMEM;
 		goto unlock;
 	}
 
