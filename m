From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 May 2018 10:53:22 +0000
Subject: [PATCH] drm/i915/dp: silence a static checker warning
Message-Id: <20180503105306.GA5315@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

Smatch warns that "n_entries" isn't always set.  It would trigger a
some WARN_ON()s on that path so presumably it can't happen but it's
simple enough to initialize it to zero just to silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/intel_ddi.c b/drivers/gpu/drm/i915/intel_ddi.c
index 8225d223f452..f4951ae33ac2 100644
--- a/drivers/gpu/drm/i915/intel_ddi.c
+++ b/drivers/gpu/drm/i915/intel_ddi.c
@@ -2062,7 +2062,7 @@ u8 intel_ddi_dp_voltage_max(struct intel_encoder *encoder)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	enum port port = encoder->port;
-	int n_entries;
+	int n_entries = 0;
 
 	if (IS_ICELAKE(dev_priv)) {
 		if (port = PORT_A || port = PORT_B)
