From: Dan Carpenter <error27@gmail.com>
Date: Wed, 25 May 2011 09:56:56 +0000
Subject: [patch] drm/i915: fix if statement in ivybridge irq handler
Message-Id: <20110525095656.GC1358@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Packard <keithp@keithp.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The extra semicolon was not intended.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index b79619a..b9fafe3 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -517,7 +517,7 @@ irqreturn_t ivybridge_irq_handler(DRM_IRQ_ARGS)
 	if (de_iir & DE_PIPEA_VBLANK_IVB)
 		drm_handle_vblank(dev, 0);
 
-	if (de_iir & DE_PIPEB_VBLANK_IVB);
+	if (de_iir & DE_PIPEB_VBLANK_IVB)
 		drm_handle_vblank(dev, 1);
 
 	/* check event from PCH */
