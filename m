From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Apr 2017 19:53:11 +0000
Subject: [PATCH] drm/i915: uninitialized value on error path
Message-Id: <20170413195311.GB26108@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

"ret" isn't initialized on this error path.  It doesn't really cause
any problems unless it's randomly set to -EDEADLK which is not likely.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 48a546210d8b..d0e9578952d5 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -9563,6 +9563,7 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 	 */
 	if (!crtc) {
 		DRM_DEBUG_KMS("no pipe available for load-detect\n");
+		ret = -ENODEV;
 		goto fail;
 	}
 
