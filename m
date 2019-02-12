From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Feb 2019 13:46:16 +0000
Subject: [PATCH] regulator: max77802-regulator: fix indentation in if statement
Message-Id: <20190212134616.8270-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Martinez Canillas <javier@dowhile0.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several lines in an if statement that are not indented
correctly. Fix these by removing the tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/max77802-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/max77802-regulator.c b/drivers/regulator/max77802-regulator.c
index c30cf5c9f2de..ea7b50397300 100644
--- a/drivers/regulator/max77802-regulator.c
+++ b/drivers/regulator/max77802-regulator.c
@@ -248,9 +248,9 @@ static int max77802_set_ramp_delay_2bit(struct regulator_dev *rdev,
 	unsigned int ramp_value;
 
 	if (id > MAX77802_BUCK4) {
-			dev_warn(&rdev->dev,
-				 "%s: regulator: ramp delay not supported\n",
-				 rdev->desc->name);
+		dev_warn(&rdev->dev,
+			 "%s: regulator: ramp delay not supported\n",
+			 rdev->desc->name);
 		return -EINVAL;
 	}
 	ramp_value = max77802_find_ramp_value(rdev, ramp_table_77802_2bit,
-- 
2.20.1
