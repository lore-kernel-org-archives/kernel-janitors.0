From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Apr 2017 19:54:25 +0000
Subject: [PATCH v2] drm/i915: set "ret" correctly on error paths
Message-Id: <20170414195425.GA8144@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413202924.GY12532@nuc-i3427.alporthouse.com>
In-Reply-To: <20170413202924.GY12532@nuc-i3427.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

If "crtc" is NULL, then my static checker complains that "ret" isn't
initialized on that path.  It doesn't really cause a problem unless
"ret" is somehow set to -EDEADLK which is not likely.

Chris Wilson also noticed another error path where "ret" isn't set
correctly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 48a546210d8b..2c66de875d3d 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -9563,6 +9563,7 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 	 */
 	if (!crtc) {
 		DRM_DEBUG_KMS("no pipe available for load-detect\n");
+		ret = -ENODEV;
 		goto fail;
 	}
 
@@ -9619,6 +9620,7 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
 		DRM_DEBUG_KMS("reusing fbdev for load-detection framebuffer\n");
 	if (IS_ERR(fb)) {
 		DRM_DEBUG_KMS("failed to allocate framebuffer for load-detection\n");
+		ret = PTR_ERR(fb);
 		goto fail;
 	}
 
