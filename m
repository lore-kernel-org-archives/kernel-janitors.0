From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jul 2019 08:20:09 +0000
Subject: [PATCH] regulator: max77620: remove redundant assignment to variable ret
Message-Id: <20190703082009.18779-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/max77620-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 2ae2d319321b..8d9731e4052b 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -467,7 +467,7 @@ static int max77620_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	struct max77620_regulator *pmic = rdev_get_drvdata(rdev);
 	int id = rdev_get_id(rdev);
-	int ret = 1;
+	int ret;
 
 	if (pmic->active_fps_src[id] != MAX77620_FPS_SRC_NONE)
 		return 1;
-- 
2.20.1
