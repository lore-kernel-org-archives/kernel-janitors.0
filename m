From: Colin King <colin.king@canonical.com>
Date: Wed, 17 May 2017 18:13:46 +0000
Subject: [PATCH] drm/amd/powerplay: ensure loop does not wraparound on decrement
Message-Id: <20170517181346.11715-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, Eric Huang <JinHuiEric.Huang@amd.com>, Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current for loop decrements i when it is zero and this causes
a wrap-around back to ~0 because i is unsigned. In the unlikely event
that mask is 0, the loop will run forever. Fix this so we can't loop
forever.

Detected by CoverityScan, CID#1435469 ("Unsigned compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index ad30f5d3a10d..d92c9b9b15be 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -4199,7 +4199,7 @@ static int vega10_force_clock_level(struct pp_hwmgr *hwmgr,
 		}
 		data->smc_state_table.gfx_boot_level = i;
 
-		for (i = 31; i >= 0; i--) {
+		for (i = 32; --i; ) {
 			if (mask & (1 << i))
 				break;
 		}
-- 
2.11.0

