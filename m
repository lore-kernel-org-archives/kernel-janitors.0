From: Dan Carpenter <error27@gmail.com>
Date: Fri, 07 May 2010 08:40:09 +0000
Subject: [patch -next] i915/intel_sdvo: remove unneeded null check
Message-Id: <20100507084009.GZ27064@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Eric Anholt <eric@anholt.net>, Zhao Yakui <yakui.zhao@intel.com>, Ma Ling <ling.ma@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Keith Packard <keithp@keithp.com>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "connector" variable is used as the cursor in a
list_for_each_entry() and it's always non-null so we don't need to check
it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
index 42ceb15..179d146 100644
--- a/drivers/gpu/drm/i915/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/intel_sdvo.c
@@ -1479,7 +1479,7 @@ intel_find_analog_connector(struct drm_device *dev)
 		intel_encoder = enc_to_intel_encoder(encoder);
 		if (intel_encoder->type = INTEL_OUTPUT_ANALOG) {
 			list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-				if (connector && encoder = intel_attached_encoder(connector))
+				if (encoder = intel_attached_encoder(connector))
 					return connector;
 			}
 		}
