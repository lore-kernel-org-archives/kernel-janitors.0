From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2019 08:33:36 +0000
Subject: [PATCH] drm/i915/tgl: Fix TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT() macro
Message-Id: <20190815083336.GE27238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

This macro doesn't work because the right shift has higher precedence
than bitwise AND.

Fixes: 9749a5b6c09f ("drm/i915/tgl: Fix the read of the DDI that transcoder is attached to")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 4a947bd0a294..def6dbdc7e2e 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9433,7 +9433,7 @@ enum skl_power_gate {
 #define  TRANS_DDI_SELECT_PORT(x)	((x) << TRANS_DDI_PORT_SHIFT)
 #define  TGL_TRANS_DDI_SELECT_PORT(x)	(((x) + 1) << TGL_TRANS_DDI_PORT_SHIFT)
 #define  TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val)	 (((val) & TRANS_DDI_PORT_MASK) >> TRANS_DDI_PORT_SHIFT)
-#define  TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val) (((val) & TGL_TRANS_DDI_PORT_MASK >> TGL_TRANS_DDI_PORT_SHIFT) - 1)
+#define  TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT(val) ((((val) & TGL_TRANS_DDI_PORT_MASK) >> TGL_TRANS_DDI_PORT_SHIFT) - 1)
 #define  TRANS_DDI_MODE_SELECT_MASK	(7 << 24)
 #define  TRANS_DDI_MODE_SELECT_HDMI	(0 << 24)
 #define  TRANS_DDI_MODE_SELECT_DVI	(1 << 24)
-- 
2.20.1
