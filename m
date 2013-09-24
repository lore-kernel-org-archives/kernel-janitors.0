From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Sep 2013 07:57:35 +0000
Subject: [patch] drm/i915: precendence bug in GT_PARITY_ERROR()
Message-Id: <20130924075735.GB29141@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The | operation has higher precedence than "?:" so the macro always
returns GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c4f9bef..876666b 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -940,7 +940,7 @@
 
 #define GT_PARITY_ERROR(dev) \
 	(GT_RENDER_L3_PARITY_ERROR_INTERRUPT | \
-	 IS_HASWELL(dev) ? GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1 : 0)
+	 (IS_HASWELL(dev) ? GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1 : 0))
 
 /* These are all the "old" interrupts */
 #define ILK_BSD_USER_INTERRUPT				(1<<5)
