From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Sep 2017 15:55:34 +0000
Subject: [PATCH][drm-next] drm/i915/gvt: ensure -ve return value is handled correctly
Message-Id: <20170919155534.25334-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fred gao <fred.gao@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier fix changed the return type from find_bb_size however the
integer return is being assigned to a unsigned int so the -ve error
check will never be detected. Make bb_size an int to fix this.

Detected by CoverityScan CID#1456886 ("Unsigned compared against 0")

Fixes: 1e3197d6ad73 ("drm/i915/gvt: Refine error handling for perform_bb_shadow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 2c0ccbb817dc..f41cbf664b69 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1628,7 +1628,7 @@ static int perform_bb_shadow(struct parser_exec_state *s)
 	struct intel_shadow_bb_entry *entry_obj;
 	struct intel_vgpu *vgpu = s->vgpu;
 	unsigned long gma = 0;
-	uint32_t bb_size;
+	int bb_size;
 	void *dst = NULL;
 	int ret = 0;
 
-- 
2.14.1

