From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Mar 2018 08:32:57 +0000
Subject: [PATCH][next] drm/amd/pp: Fix spelling mistake: "suppported" -> "supported"
Message-Id: <20180327083257.28777-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_warn warning message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c b/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c
index 0f2851b5b368..308bff2b5d1d 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c
@@ -46,7 +46,7 @@ int psm_init_power_state_table(struct pp_hwmgr *hwmgr)
 					  sizeof(struct pp_power_state);
 
 	if (table_entries = 0 || size = 0) {
-		pr_warn("Please check whether power state management is suppported on this asic\n");
+		pr_warn("Please check whether power state management is supported on this asic\n");
 		return 0;
 	}
 
-- 
2.15.1

