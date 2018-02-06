From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Feb 2018 12:35:00 +0000
Subject: [PATCH] drm/amd/powerplay: delete some dead code
Message-Id: <20180206123500.GA9203@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

We deleted some code in e154162ef75d ("drm/amd/powerplay: refine pp code
for raven") but there were a few related bits that were missed.  Let's
delete them as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
index 565fe0832f41..0b0fbb228edf 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
@@ -608,7 +608,6 @@ struct phm_dynamic_state_info {
 	struct phm_ppm_table                          *ppm_parameter_table;
 	struct phm_cac_tdp_table                      *cac_dtp_table;
 	struct phm_clock_voltage_dependency_table	*vdd_gfx_dependency_on_sclk;
-	struct phm_vq_budgeting_table				*vq_budgeting_table;
 };
 
 struct pp_fan_info {
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
index c3e7e34535e8..7545776a774d 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
@@ -1697,9 +1697,6 @@ static int pp_tables_uninitialize(struct pp_hwmgr *hwmgr)
 	kfree(hwmgr->dyn_state.vdd_gfx_dependency_on_sclk);
 	hwmgr->dyn_state.vdd_gfx_dependency_on_sclk = NULL;
 
-	kfree(hwmgr->dyn_state.vq_budgeting_table);
-	hwmgr->dyn_state.vq_budgeting_table = NULL;
-
 	return 0;
 }
 
