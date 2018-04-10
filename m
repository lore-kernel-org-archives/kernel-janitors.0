From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Apr 2018 12:33:12 +0000
Subject: [PATCH] drm/i915/gvt: fix memory leak of a cmd_entry struct on error exit path
Message-Id: <20180410123312.24631-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error exit path when a duplicate is found does not kfree and cmd_entry
struct and hence there is a small memory leak.  Fix this by kfree'ing it.

Detected by CoverityScan, CID#1370198 ("Resource Leak")

Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index d85939bd7b47..3b6d26c44e37 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -2864,6 +2864,7 @@ static int init_cmd_table(struct intel_gvt *gvt)
 		if (info) {
 			gvt_err("%s %s duplicated\n", e->info->name,
 					info->name);
+			kfree(e);
 			return -EEXIST;
 		}
 
-- 
2.15.1

