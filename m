From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Sep 2013 20:18:39 +0000
Subject: [patch -next] drm/radeon/dpm/btc: off by one in btc_set_mc_special_registers()
Message-Id: <20130927201838.GJ6247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jerome Glisse <jglisse@redhat.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

It should be ">=" instead of ">" here.  The table->mc_reg_address[]
array has SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE (16) elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Resend.

diff --git a/drivers/gpu/drm/radeon/btc_dpm.c b/drivers/gpu/drm/radeon/btc_dpm.c
index bab0185..55491e7 100644
--- a/drivers/gpu/drm/radeon/btc_dpm.c
+++ b/drivers/gpu/drm/radeon/btc_dpm.c
@@ -1913,7 +1913,7 @@ static int btc_set_mc_special_registers(struct radeon_device *rdev,
 			}
 			j++;
 
-			if (j > SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
+			if (j >= SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
 				return -EINVAL;
 
 			tmp = RREG32(MC_PMG_CMD_MRS);
@@ -1928,7 +1928,7 @@ static int btc_set_mc_special_registers(struct radeon_device *rdev,
 			}
 			j++;
 
-			if (j > SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
+			if (j >= SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
 				return -EINVAL;
 			break;
 		case MC_SEQ_RESERVE_M >> 2:
@@ -1942,7 +1942,7 @@ static int btc_set_mc_special_registers(struct radeon_device *rdev,
 			}
 			j++;
 
-			if (j > SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
+			if (j >= SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE)
 				return -EINVAL;
 			break;
 		default:
