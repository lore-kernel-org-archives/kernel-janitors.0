From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 11:39:03 +0000
Subject: [PATCH] drm/amd/pp: silence a static checker warning
Message-Id: <20180323113903.GD28518@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

This has a static checker warning because "frev" and "crev" can be
uninitialized if "info" is NULL.  I just changed the order of the checks
so that we check "info" first.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
index 75a465f771f0..7b26607c646a 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
@@ -319,13 +319,13 @@ static int smu8_get_system_info_data(struct pp_hwmgr *hwmgr)
 			GetIndexIntoMasterTable(DATA, IntegratedSystemInfo),
 			&size, &frev, &crev);
 
-	if (crev != 9) {
-		pr_err("Unsupported IGP table: %d %d\n", frev, crev);
+	if (info = NULL) {
+		pr_err("Could not retrieve the Integrated System Info Table!\n");
 		return -EINVAL;
 	}
 
-	if (info = NULL) {
-		pr_err("Could not retrieve the Integrated System Info Table!\n");
+	if (crev != 9) {
+		pr_err("Unsupported IGP table: %d %d\n", frev, crev);
 		return -EINVAL;
 	}
 
