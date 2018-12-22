From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 11:26:08 +0000
Subject: [PATCH][next] regulator: axp20x: check rdev is null before dereferencing it
Message-Id: <20181222112608.30681-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently rdev is dereferenced when assigning desc before rdev is null
checked, hence there is a potential null pointer dereference on rdev.
Fix this by null checking rdev first.

Detected by CoverityScan, CID#1476031 ("Dereference before null check")

Fixes: 77e3e3b165db ("regulator: axp20x: add software based soft_start for AXP209 LDO3")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/axp20x-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 48af859fd053..eaa7a487924c 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -436,11 +436,13 @@ static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
 static int axp20x_regulator_enable_regmap(struct regulator_dev *rdev)
 {
 	struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
-	const struct regulator_desc *desc = rdev->desc;
+	const struct regulator_desc *desc;
 
 	if (!rdev)
 		return -EINVAL;
 
+	desc = rdev->desc;
+
 	switch (axp20x->variant) {
 	case AXP209_ID:
 		if ((desc->id = AXP20X_LDO3) &&
-- 
2.19.1
