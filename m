From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 27 Jun 2017 05:38:54 +0000
Subject: [PATCH] drm/i915: Fix an error checking test
Message-Id: <20170627053854.21152-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel.vetter@intel.com, jani.nikula@linux.intel.com, airlied@linux.ie, chris@chris-wilson.co.uk, joonas.lahtinen@linux.intel.com, matthew.auld@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'dma_buf_vmap' returns NULL on error, not an error pointer.

Fixes: 6cca22ede8a4 ("drm/i915: Add some mock tests for dmabuf interop")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/i915/selftests/i915_gem_dmabuf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/selftests/i915_gem_dmabuf.c
index d15cc9d3a5cd..89dc25a5a53b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_dmabuf.c
@@ -246,9 +246,9 @@ static int igt_dmabuf_export_vmap(void *arg)
 	i915_gem_object_put(obj);
 
 	ptr = dma_buf_vmap(dmabuf);
-	if (IS_ERR(ptr)) {
-		err = PTR_ERR(ptr);
-		pr_err("dma_buf_vmap failed with err=%d\n", err);
+	if (!ptr) {
+		pr_err("dma_buf_vmap failed\n");
+		err = -ENOMEM;
 		goto out;
 	}
 
-- 
2.11.0

