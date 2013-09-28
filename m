From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 Sep 2013 09:35:31 +0000
Subject: [patch] drm/radeon/dpm: off by one in si_set_mc_special_registers()
Message-Id: <20130928093530.GA26611@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130702062012.GA24410@elgon.mountain>
In-Reply-To: <20130702062012.GA24410@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

These checks should be ">=" instead of ">".  j is used as an offset into
the table->mc_reg_address[] array and that has
SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE (16) elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index cfe5d4d..4a1220c 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -5184,7 +5184,7 @@ static int si_set_mc_special_registers(struct radeon_device *rdev,
 					table->mc_reg_table_entry[k].mc_data[j] |= 0x100;
 			}
 			j++;
-			if (j > SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE)
+			if (j >= SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE)
 				return -EINVAL;
 
 			if (!pi->mem_gddr5) {
@@ -5194,7 +5194,7 @@ static int si_set_mc_special_registers(struct radeon_device *rdev,
 					table->mc_reg_table_entry[k].mc_data[j]  						(table->mc_reg_table_entry[k].mc_data[i] & 0xffff0000) >> 16;
 				j++;
-				if (j > SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE)
+				if (j >= SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE)
 					return -EINVAL;
 			}
 			break;
@@ -5207,7 +5207,7 @@ static int si_set_mc_special_registers(struct radeon_device *rdev,
 					(temp_reg & 0xffff0000) |
 					(table->mc_reg_table_entry[k].mc_data[i] & 0x0000ffff);
 			j++;
-			if (j > SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE)
+			if (j >= SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE)
 				return -EINVAL;
 			break;
 		default:
