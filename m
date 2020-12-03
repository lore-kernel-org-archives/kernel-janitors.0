From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:45:17 +0000
Subject: [PATCH] drm/i915: Check the correct variable
Message-Id: <X8ilneOcJAjwqU4t@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Andi Shyti <andi.shyti@intel.com>, David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

There is a copy and paste bug in this code.  It's supposed to check
"obj2" instead of checking "obj" a second time.

Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 23a6132c5f4e..412e21604a05 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
 		return PTR_ERR(obj);
 
 	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
-	if (IS_ERR(obj)) {
-		err = PTR_ERR(obj);
+	if (IS_ERR(obj2)) {
+		err = PTR_ERR(obj2);
 		goto put1;
 	}
 
-- 
2.29.2
