From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Jul 2019 11:31:38 +0000
Subject: [PATCH -next] drm/i915: Remove set but not used variable 'intel_dig_port'
Message-Id: <20190705113138.65880-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705113112.64715-1-yuehaibing@huawei.com>
In-Reply-To: <20190705113112.64715-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, lucas.demarchi@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com, jose.souza@intel.com
Cc: YueHaibing <yuehaibing@huawei.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/i915/display/intel_ddi.c: In function 'intel_ddi_get_config':
drivers/gpu/drm/i915/display/intel_ddi.c:3774:29: warning:
 variable 'intel_dig_port' set but not used [-Wunused-but-set-variable]
  struct intel_digital_port *intel_dig_port;

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a4172595c8d8..30e48609db1d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3771,7 +3771,6 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	struct intel_crtc *intel_crtc = to_intel_crtc(pipe_config->base.crtc);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
-	struct intel_digital_port *intel_dig_port;
 	u32 temp, flags = 0;
 
 	/* XXX: DSI transcoder paranoia */
@@ -3810,7 +3809,6 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 	switch (temp & TRANS_DDI_MODE_SELECT_MASK) {
 	case TRANS_DDI_MODE_SELECT_HDMI:
 		pipe_config->has_hdmi_sink = true;
-		intel_dig_port = enc_to_dig_port(&encoder->base);
 
 		pipe_config->infoframes.enable | 			intel_hdmi_infoframes_enabled(encoder, pipe_config);
