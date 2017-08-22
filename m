From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Aug 2017 20:36:52 +0000
Subject: [PATCH 2/2] drm/amdgpu/ci: tidy up some limit checks
Message-Id: <20170822203652.oofm6lcyht7naiv5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822203033.u7ltp2xjaqmoqrl4@mwanda>
In-Reply-To: <20170822203033.u7ltp2xjaqmoqrl4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

This is partly to silence a static checker warning:

    drivers/gpu/drm/amd/amdgpu/ci_dpm.c:4553 ci_set_mc_special_registers()
    error: buffer overflow 'table->mc_reg_address' 16 <= 16

The story is that it's valid to exit the loop with "j" less than or equal
to SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE".  That value for "j" gets saved
as table->last.  We're not allow to access "table->mc_reg_address[j]"
when j = SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE because that's one past
the end of the array.

The tests for "if (j > SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)" in
ci_set_mc_special_registers() are always false because we start with
j less than the array size and we increment it once so at most it can be
equal.

Then there is a bogus check in ci_register_patching_mc_seq() where
it complains if "table->last >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE".
The "table->last" value can't possibly be greater than the array size
and it is allowed to be equal to it.  So let's just remove that test
entirely.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  Please review this one carefully.

diff --git a/drivers/gpu/drm/amd/amdgpu/ci_dpm.c b/drivers/gpu/drm/amd/amdgpu/ci_dpm.c
index cb508a211b2f..c885388bdc3c 100644
--- a/drivers/gpu/drm/amd/amdgpu/ci_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/ci_dpm.c
@@ -4546,10 +4546,10 @@ static int ci_set_mc_special_registers(struct amdgpu_device *adev,
 					table->mc_reg_table_entry[k].mc_data[j] |= 0x100;
 			}
 			j++;
-			if (j > SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
-				return -EINVAL;
 
 			if (adev->mc.vram_type != AMDGPU_VRAM_TYPE_GDDR5) {
+				if (j >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
+					return -EINVAL;
 				table->mc_reg_address[j].s1 = mmMC_PMG_AUTO_CMD;
 				table->mc_reg_address[j].s0 = mmMC_PMG_AUTO_CMD;
 				for (k = 0; k < table->num_entries; k++) {
@@ -4725,8 +4725,6 @@ static int ci_register_patching_mc_seq(struct amdgpu_device *adev,
 	    ((adev->pdev->device = 0x67B0) ||
 	     (adev->pdev->device = 0x67B1))) {
 		for (i = 0; i < table->last; i++) {
-			if (table->last >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
-				return -EINVAL;
 			switch (table->mc_reg_address[i].s1) {
 			case mmMC_SEQ_MISC1:
 				for (k = 0; k < table->num_entries; k++) {
