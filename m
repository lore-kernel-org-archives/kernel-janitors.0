From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jun 2016 06:54:22 +0000
Subject: [patch] drm/i915/mocs: || vs | typo in get_mocs_settings()
Message-Id: <20160613065422.GB5993@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

It seems pretty clear that bitwise OR was intended here and not logical
OR.

Fixes: 6fc29133eafb ('drm/i915/gen9: Add WaDisableSkipCaching')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_mocs.c b/drivers/gpu/drm/i915/intel_mocs.c
index 8f96c40..3c1482b 100644
--- a/drivers/gpu/drm/i915/intel_mocs.c
+++ b/drivers/gpu/drm/i915/intel_mocs.c
@@ -162,7 +162,7 @@ static bool get_mocs_settings(struct drm_i915_private *dev_priv,
 
 		for (i = 0; i < table->size; i++)
 			if (WARN_ON(table->table[i].l3cc_value &
-				    (L3_ESC(1) || L3_SCC(0x7))))
+				    (L3_ESC(1) | L3_SCC(0x7))))
 				return false;
 	}
 
