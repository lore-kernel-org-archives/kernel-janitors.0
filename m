From: Colin King <colin.king@canonical.com>
Date: Wed, 09 May 2018 09:19:08 +0000
Subject: [PATCH] drm/i915/dp: fix spelling mistake: "seqeuncer" -> "sequencer"
Message-Id: <20180509091908.13804-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in WARN warning message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
index dde92e4af5d3..914389f67458 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -513,7 +513,7 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 	uint32_t DP;
 
 	if (WARN(I915_READ(intel_dp->output_reg) & DP_PORT_EN,
-		 "skipping pipe %c power seqeuncer kick due to port %c being active\n",
+		 "skipping pipe %c power sequencer kick due to port %c being active\n",
 		 pipe_name(pipe), port_name(intel_dig_port->base.port)))
 		return;
 
-- 
2.17.0

