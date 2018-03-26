From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Mar 2018 14:13:54 +0000
Subject: [PATCH][next] drm/amd/pp: fix logical or'ing of garbage in result by initializing result to zero
Message-Id: <20180326141354.31247-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, Evan Quan <evan.quan@amd.com>, Tom St Denis <tom.stdenis@amd.com>, Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently result is not initialized, so it contains a garbage value and
this is or'd with data from vega10_program_didt_config_registers() which
can end up with a non-zero value when the result should be zero.  Fix
this by ensuring result is initialized to zero.

Detected by CoverityScan, CID#1466088 ("Uninitialized scalar variable")

Fixes: 9b7b8154cdb8 ("drm/amd/powerplay: added didt support for vega10")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
index b1f74c7f0943..49822ea3ddd5 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
@@ -1091,7 +1091,7 @@ static int vega10_disable_se_edc_config(struct pp_hwmgr *hwmgr)
 
 static int vega10_enable_psm_gc_edc_config(struct pp_hwmgr *hwmgr)
 {
-	int result;
+	int result = 0;
 	uint32_t num_se = 0;
 	uint32_t count, data;
 	struct amdgpu_device *adev = hwmgr->adev;
-- 
2.15.1

