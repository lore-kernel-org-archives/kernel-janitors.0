From: Colin King <colin.king@canonical.com>
Date: Wed, 07 Nov 2018 10:22:11 +0000
Subject: [PATCH][drm-next] drm/i915/csr: fix spelling mistake "firmare" -> "firmware"
Message-Id: <20181107102211.19758-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DRM_INFO message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/intel_csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_csr.c b/drivers/gpu/drm/i915/intel_csr.c
index fc7bd21fa586..c1ca6596ff5c 100644
--- a/drivers/gpu/drm/i915/intel_csr.c
+++ b/drivers/gpu/drm/i915/intel_csr.c
@@ -499,7 +499,7 @@ void intel_csr_ucode_init(struct drm_i915_private *dev_priv)
 	if (i915_modparams.dmc_firmware_path) {
 		if (strlen(i915_modparams.dmc_firmware_path) = 0) {
 			csr->fw_path = NULL;
-			DRM_INFO("Disabling CSR firmare and runtime PM\n");
+			DRM_INFO("Disabling CSR firmware and runtime PM\n");
 			return;
 		}
 
-- 
2.19.1
