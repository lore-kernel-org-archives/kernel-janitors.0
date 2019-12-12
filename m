From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Dec 2019 09:11:30 +0000
Subject: [PATCH] drm/i915/bios: fix off by one in parse_generic_dtd()
Message-Id: <20191212091130.zf2g53njf5u24wk6@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org

The "num_dtd" variable is the number of elements in the
generic_dtd->dtd[] array so the > needs to be >= to prevent reading one
element beyond the end of the array.

Fixes: 33ef6d4fd8df ("drm/i915/vbt: Handle generic DTD block")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 1aeecdd02293..d1e27ee86e53 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -338,7 +338,7 @@ parse_generic_dtd(struct drm_i915_private *dev_priv,
 
 	num_dtd = (get_blocksize(generic_dtd) -
 		   sizeof(struct bdb_generic_dtd)) / generic_dtd->gdtd_size;
-	if (dev_priv->vbt.panel_type > num_dtd) {
+	if (dev_priv->vbt.panel_type >= num_dtd) {
 		DRM_ERROR("Panel type %d not found in table of %d DTD's\n",
 			  dev_priv->vbt.panel_type, num_dtd);
 		return;
-- 
2.11.0
