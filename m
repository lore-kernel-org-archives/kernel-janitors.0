From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Jan 2021 15:09:57 +0000
Subject: [PATCH][next] drm/i915/hdcp: Fix return of value in uninitialized variable ret
Message-Id: <20210122150957.209779-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ramalingam C <ramalingam.c@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>, Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when there are other connectors on the port using HDCP the
function _intel_hdcp_disable returns a garbage uninitialized value in
variable ret.  I believe the intention is to return 0, so return this
literal value instead of the value in ret.

Addresses-Coverity: ("Uninitialized scalar return")
Fixes: 899c8762f981 ("drm/i915/hdcp: Configure HDCP2.2 MST steram encryption status")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index db8dff2eeb0a..a0e7b0bf892b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -883,7 +883,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	 * until it disabled HDCP encryption for all connectors in MST topology.
 	 */
 	if (dig_port->num_hdcp_streams > 0)
-		return ret;
+		return 0;
 
 	hdcp->hdcp_encrypted = false;
 	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
-- 
2.29.2
