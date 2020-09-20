From: Colin King <colin.king@canonical.com>
Date: Sun, 20 Sep 2020 14:24:54 +0000
Subject: [PATCH] regulator: fix indentation issue
Message-Id: <20200920142454.33352-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a return statement that is indented with an extra
space, fix this by removing it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7fed8cd134f8..6aa648019702 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3070,7 +3070,7 @@ int regulator_get_hardware_vsel_register(struct regulator *regulator,
 	*vsel_reg = rdev->desc->vsel_reg;
 	*vsel_mask = rdev->desc->vsel_mask;
 
-	 return 0;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regulator_get_hardware_vsel_register);
 
-- 
2.27.0
