From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2013 09:31:36 +0000
Subject: [patch] drm/radeon: signedness bug in kv_dpm.c
Message-Id: <20130904093136.GA13892@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The problem here is that "unsigned i" is always greater than or equal to
zero.  These loops mostly have a second check for "(i = 0)" so only the
last two are actually buggy.  The rest is just cleanup.

Bug 1:  kv_force_dpm_highest() doesn't have an "(i = 0)" check so it's
a potential forever loop.

Bug 2: In kv_get_sleep_divider_id_from_clock() there is a typo and the
test is reversed "<=" vs ">" so we never enter the loop.  That means
normally we return KV_MAX_DEEPSLEEP_DIVIDER_ID (5).  The return value
from here is saved in ->DeepSleepDivId and I wasn't able to determine
how that is used.  This is a static checker fix and I have not tested
it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I considered making "i" signed but that doesn't actually change anything
because the tests have to end on zero anyway.

diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_dpm.c
index ecd6080..c499daf 100644
--- a/drivers/gpu/drm/radeon/kv_dpm.c
+++ b/drivers/gpu/drm/radeon/kv_dpm.c
@@ -667,9 +667,8 @@ static int kv_program_bootup_state(struct radeon_device *rdev)
 		&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk;
 
 	if (table && table->count) {
-		for (i = pi->graphics_dpm_level_count - 1; i >= 0; i--) {
-			if ((table->entries[i].clk = pi->boot_pl.sclk) ||
-			    (i = 0))
+		for (i = pi->graphics_dpm_level_count - 1; i > 0; i--) {
+			if (table->entries[i].clk = pi->boot_pl.sclk)
 				break;
 		}
 
@@ -682,9 +681,8 @@ static int kv_program_bootup_state(struct radeon_device *rdev)
 		if (table->num_max_dpm_entries = 0)
 			return -EINVAL;
 
-		for (i = pi->graphics_dpm_level_count - 1; i >= 0; i--) {
-			if ((table->entries[i].sclk_frequency = pi->boot_pl.sclk) ||
-			    (i = 0))
+		for (i = pi->graphics_dpm_level_count - 1; i > 0; i--) {
+			if (table->entries[i].sclk_frequency = pi->boot_pl.sclk)
 				break;
 		}
 
@@ -1588,13 +1586,11 @@ static void kv_set_valid_clock_range(struct radeon_device *rdev,
 			}
 		}
 
-		for (i = pi->graphics_dpm_level_count - 1; i >= 0; i--) {
-			if ((table->entries[i].clk <= new_ps->levels[new_ps->num_levels -1].sclk) ||
-			    (i = 0)) {
-				pi->highest_valid = i;
+		for (i = pi->graphics_dpm_level_count - 1; i > 0; i--) {
+			if (table->entries[i].clk <= new_ps->levels[new_ps->num_levels - 1].sclk)
 				break;
-			}
 		}
+		pi->highest_valid = i;
 
 		if (pi->lowest_valid > pi->highest_valid) {
 			if ((new_ps->levels[0].sclk - table->entries[pi->highest_valid].clk) >
@@ -1615,14 +1611,12 @@ static void kv_set_valid_clock_range(struct radeon_device *rdev,
 			}
 		}
 
-		for (i = pi->graphics_dpm_level_count - 1; i >= 0; i--) {
+		for (i = pi->graphics_dpm_level_count - 1; i > 0; i--) {
 			if (table->entries[i].sclk_frequency <-			    new_ps->levels[new_ps->num_levels - 1].sclk ||
-			    i = 0) {
-				pi->highest_valid = i;
+			    new_ps->levels[new_ps->num_levels - 1].sclk)
 				break;
-			}
 		}
+		pi->highest_valid = i;
 
 		if (pi->lowest_valid > pi->highest_valid) {
 			if ((new_ps->levels[0].sclk -
@@ -1871,7 +1865,7 @@ static int kv_force_dpm_highest(struct radeon_device *rdev)
 	if (ret)
 		return ret;
 
-	for (i = SMU7_MAX_LEVELS_GRAPHICS - 1; i >= 0; i--) {
+	for (i = SMU7_MAX_LEVELS_GRAPHICS - 1; i > 0; i--) {
 		if (enable_mask & (1 << i))
 			break;
 	}
@@ -1911,9 +1905,9 @@ static u8 kv_get_sleep_divider_id_from_clock(struct radeon_device *rdev,
 	if (!pi->caps_sclk_ds)
 		return 0;
 
-	for (i = KV_MAX_DEEPSLEEP_DIVIDER_ID; i <= 0; i--) {
+	for (i = KV_MAX_DEEPSLEEP_DIVIDER_ID; i > 0; i--) {
 		temp = sclk / sumo_get_sleep_divider_from_id(i);
-		if ((temp >= min) || (i = 0))
+		if (temp >= min)
 			break;
 	}
 
