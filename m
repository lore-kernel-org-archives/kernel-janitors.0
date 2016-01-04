From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 20:44:24 +0000
Subject: [patch] drm/amd/powerplay: precedence bug in init_non_clock_fields()
Message-Id: <20160104204424.GD19867@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Jammy Zhou <Jammy.Zhou@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Tom St Denis <tom.stdenis@amd.com>, kernel-janitors@vger.kernel.org, Rex Zhu <Rex.Zhu@amd.com>, dri-devel@lists.freedesktop.org

The cast to uint8_t happens before the right shift so this always sets
.m3arb to zero.  The cast is actually a no-op so we can remove it.

Fixes: 3bace3591493 ('drm/amd/powerplay: add hardware manager sub-component')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis stuff.  Not tested.

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
index 1d385f4..9031a44 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
@@ -735,8 +735,8 @@ static int init_non_clock_fields(struct pp_hwmgr *hwmgr,
 
 	ps->memory.dllOff = (0 != tmp);
 
-	ps->memory.m3arb = (uint8_t)(le32_to_cpu(pnon_clock_info->ulCapsAndSettings) &
-						ATOM_PPLIB_M3ARB_MASK) >> ATOM_PPLIB_M3ARB_SHIFT;
+	ps->memory.m3arb = (le32_to_cpu(pnon_clock_info->ulCapsAndSettings) &
+			    ATOM_PPLIB_M3ARB_MASK) >> ATOM_PPLIB_M3ARB_SHIFT;
 
 	ps->temperatures.min = PP_TEMPERATURE_UNITS_PER_CENTIGRADES *
 				     pnon_clock_info->ucMinTemperature;
