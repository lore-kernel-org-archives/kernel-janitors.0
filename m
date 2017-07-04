From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 04 Jul 2017 05:55:15 +0000
Subject: [PATCH] drm/i915: Fix an error hanfling path in 'i915_gem_do_execbuffer'
Message-Id: <20170704055515.2394-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel.vetter@intel.com, jani.nikula@linux.intel.com, airlied@linux.ie
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

if 'eb_create()' fails, we must release some resources as done in all other
error handling paths of this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is just a guess based on surrounding gotos and function names.
(i.e. 'get_unused_fd_flags()' and 'put_unused_fd()')
---
 drivers/gpu/drm/i915/i915_gem_execbuffer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
index 9337446f1068..0746b352f820 100644
--- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/i915_gem_execbuffer.c
@@ -2180,8 +2180,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		}
 	}
 
-	if (eb_create(&eb))
-		return -ENOMEM;
+	err = eb_create(&eb);
+	if (err)
+		goto err_put_unused_fd;
 
 	/*
 	 * Take a local wakeref for preparing to dispatch the execbuf as
@@ -2340,6 +2341,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 err_rpm:
 	intel_runtime_pm_put(eb.i915);
 	eb_destroy(&eb);
+err_put_unused_fd:
 	if (out_fence_fd != -1)
 		put_unused_fd(out_fence_fd);
 err_in_fence:
-- 
2.11.0

