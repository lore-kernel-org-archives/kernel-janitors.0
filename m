From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:07:27 +0000
Subject: [patch] drm/i915: cleanup min_t() casting
Message-Id: <20111018060727.GA27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Packard <keithp@keithp.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Casting "len" from uin32_t to uint8_t in min_t() truncates the upper
bits.  It doesn't matter in this case because "len" is never more
than 0x1f, but Smatch warns about it, so let's change it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 8230cf5..65897be 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -5702,7 +5702,7 @@ static void g4x_write_eld(struct drm_connector *connector,
 	if (!eld[0])
 		return;
 
-	len = min_t(uint8_t, eld[2], len);
+	len = min_t(uint32_t, eld[2], len);
 	DRM_DEBUG_DRIVER("ELD size %d\n", len);
 	for (i = 0; i < len; i++)
 		I915_WRITE(G4X_HDMIW_HDMIEDID, *((uint32_t *)eld + i));
