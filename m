From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jun 2020 11:42:21 +0000
Subject: [PATCH] drm/i915/display: fix missing null check on allocated dsb object
Message-Id: <20200616114221.73971-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Animesh Manna <animesh.manna@intel.com>, Maarten Lankhorst <maarten.lankhorst@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is no null check for a failed memory allocation
on the dsb object and without this a null pointer dereference
error can occur. Fix this by adding a null check.

Note: added a drm_err message in keeping with the error message style
in the function.

Addresses-Coverity: ("Dereference null return")
Fixes: afeda4f3b1c8 ("drm/i915/dsb: Pre allocate and late cleanup of cmd buffer")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 24e6d63e2d47..566fa72427b3 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -271,6 +271,10 @@ void intel_dsb_prepare(struct intel_crtc_state *crtc_state)
 		return;
 
 	dsb = kmalloc(sizeof(*dsb), GFP_KERNEL);
+	if (!dsb) {
+		drm_err(&i915->drm, "DSB object creation failed\n");
+		return;
+	}
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
-- 
2.27.0.rc0
