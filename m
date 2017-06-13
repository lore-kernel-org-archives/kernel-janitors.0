From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Jun 2017 13:47:51 +0000
Subject: [PATCH][drm-next] drm/i915/cnl: make function cnl_ddi_dp_set_dpll_hw_state static
Message-Id: <20170613134751.29196-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function cnl_ddi_dp_set_dpll_hw_state does not need to be in global
scope, so make it static.

Cleans up sparse warning:
"symbol 'cnl_ddi_dp_set_dpll_hw_state' was not declared. Should it
 be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/intel_dpll_mgr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dpll_mgr.c b/drivers/gpu/drm/i915/intel_dpll_mgr.c
index 8e669b6254ae..2f7b0e64f628 100644
--- a/drivers/gpu/drm/i915/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/intel_dpll_mgr.c
@@ -2292,8 +2292,9 @@ static bool cnl_ddi_hdmi_pll_dividers(struct intel_crtc *crtc,
 	return true;
 }
 
-bool cnl_ddi_dp_set_dpll_hw_state(int clock,
-				  struct intel_dpll_hw_state *dpll_hw_state)
+static bool
+cnl_ddi_dp_set_dpll_hw_state(int clock,
+			     struct intel_dpll_hw_state *dpll_hw_state)
 {
 	uint32_t cfgcr0;
 
-- 
2.11.0

