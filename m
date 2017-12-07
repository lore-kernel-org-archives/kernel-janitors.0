From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Dec 2017 13:30:09 +0000
Subject: [PATCH] regulator: fix incorrect indentation of two assignment statements
Message-Id: <20171207133009.24948-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove extraneous space to fix indentation on a couple of assignment
statements.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b64b7916507f..365b32e3f505 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2605,8 +2605,8 @@ int regulator_get_hardware_vsel_register(struct regulator *regulator,
 	if (ops->set_voltage_sel != regulator_set_voltage_sel_regmap)
 		return -EOPNOTSUPP;
 
-	 *vsel_reg = rdev->desc->vsel_reg;
-	 *vsel_mask = rdev->desc->vsel_mask;
+	*vsel_reg = rdev->desc->vsel_reg;
+	*vsel_mask = rdev->desc->vsel_mask;
 
 	 return 0;
 }
-- 
2.14.1

