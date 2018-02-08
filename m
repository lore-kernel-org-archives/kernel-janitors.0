From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Feb 2018 20:43:45 +0000
Subject: [PATCH 1/3] drm/amd/powerplay/hwmgr: Delete an error message for a failed memory allocation in three
Message-Id: <29e72072-809b-9e8c-8087-0daa9665430d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e5850db-c07f-add1-919a-be29be9c553d@users.sourceforge.net>
In-Reply-To: <1e5850db-c07f-add1-919a-be29be9c553d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Colin Ian King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, Eric Huang <JinHuiEric.Huang@amd.com>, Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Himanshu Jha <himanshujha199640@gmail.com>, Junwei Zhang <Jerry.Zhang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Feb 2018 20:32:39 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c | 4 +---
 drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c    | 1 -
 drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c | 4 +---
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c
index b314d09d41af..c0699b884894 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/cz_hwmgr.c
@@ -286,10 +286,8 @@ static int cz_init_dynamic_state_adjustment_rule_settings(
 	struct phm_clock_voltage_dependency_table *table_clk_vlt  					kzalloc(table_size, GFP_KERNEL);
 
-	if (NULL = table_clk_vlt) {
-		pr_err("Can not allocate memory!\n");
+	if (!table_clk_vlt)
 		return -ENOMEM;
-	}
 
 	table_clk_vlt->count = 8;
 	table_clk_vlt->entries[0].clk = PP_DAL_POWERLEVEL_0;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
index 0229f774f7a9..ded33ed03f11 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
@@ -815,7 +815,6 @@ int phm_initializa_dynamic_state_adjustment_rule_settings(struct pp_hwmgr *hwmgr
 	table_clk_vlt = kzalloc(table_size, GFP_KERNEL);
 
 	if (NULL = table_clk_vlt) {
-		pr_err("Can not allocate space for vddc_dep_on_dal_pwrl! \n");
 		return -ENOMEM;
 	} else {
 		table_clk_vlt->count = 4;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c
index 569073e3a5a1..967b93e56113 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/rv_hwmgr.c
@@ -107,10 +107,8 @@ static int rv_init_dynamic_state_adjustment_rule_settings(
 	struct phm_clock_voltage_dependency_table *table_clk_vlt  					kzalloc(table_size, GFP_KERNEL);
 
-	if (NULL = table_clk_vlt) {
-		pr_err("Can not allocate memory!\n");
+	if (!table_clk_vlt)
 		return -ENOMEM;
-	}
 
 	table_clk_vlt->count = 8;
 	table_clk_vlt->entries[0].clk = PP_DAL_POWERLEVEL_0;
-- 
2.16.1

