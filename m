From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2013 09:32:52 +0000
Subject: [patch] drm/radeon: clean up r600_free_extended_power_table()
Message-Id: <20130904093251.GB13892@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

kfree() can accept NULL pointers so I have removed the checks.  Also
I've used a pointer to shorten the lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
index fa0de46..e65f211 100644
--- a/drivers/gpu/drm/radeon/r600_dpm.c
+++ b/drivers/gpu/drm/radeon/r600_dpm.c
@@ -1219,30 +1219,20 @@ int r600_parse_extended_power_table(struct radeon_device *rdev)
 
 void r600_free_extended_power_table(struct radeon_device *rdev)
 {
-	if (rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk.entries)
-		kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk.entries);
-	if (rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk.entries)
-		kfree(rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk.entries);
-	if (rdev->pm.dpm.dyn_state.vddc_dependency_on_mclk.entries)
-		kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_mclk.entries);
-	if (rdev->pm.dpm.dyn_state.mvdd_dependency_on_mclk.entries)
-		kfree(rdev->pm.dpm.dyn_state.mvdd_dependency_on_mclk.entries);
-	if (rdev->pm.dpm.dyn_state.cac_leakage_table.entries)
-		kfree(rdev->pm.dpm.dyn_state.cac_leakage_table.entries);
-	if (rdev->pm.dpm.dyn_state.phase_shedding_limits_table.entries)
-		kfree(rdev->pm.dpm.dyn_state.phase_shedding_limits_table.entries);
-	if (rdev->pm.dpm.dyn_state.ppm_table)
-		kfree(rdev->pm.dpm.dyn_state.ppm_table);
-	if (rdev->pm.dpm.dyn_state.cac_tdp_table)
-		kfree(rdev->pm.dpm.dyn_state.cac_tdp_table);
-	if (rdev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries)
-		kfree(rdev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries);
-	if (rdev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries)
-		kfree(rdev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries);
-	if (rdev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries)
-		kfree(rdev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries);
-	if (rdev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries)
-		kfree(rdev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries);
+	struct radeon_dpm_dynamic_state *dyn_state = &rdev->pm.dpm.dyn_state;
+
+	kfree(dyn_state->vddc_dependency_on_sclk.entries);
+	kfree(dyn_state->vddci_dependency_on_mclk.entries);
+	kfree(dyn_state->vddc_dependency_on_mclk.entries);
+	kfree(dyn_state->mvdd_dependency_on_mclk.entries);
+	kfree(dyn_state->cac_leakage_table.entries);
+	kfree(dyn_state->phase_shedding_limits_table.entries);
+	kfree(dyn_state->ppm_table);
+	kfree(dyn_state->cac_tdp_table);
+	kfree(dyn_state->vce_clock_voltage_dependency_table.entries);
+	kfree(dyn_state->uvd_clock_voltage_dependency_table.entries);
+	kfree(dyn_state->samu_clock_voltage_dependency_table.entries);
+	kfree(dyn_state->acp_clock_voltage_dependency_table.entries);
 }
 
 enum radeon_pcie_gen r600_get_pcie_gen_support(struct radeon_device *rdev,
