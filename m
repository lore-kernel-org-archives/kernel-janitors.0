From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 09:39:31 +0000
Subject: [PATCH] regulator: fix spelling mistake "Cant" -> "Can't"
Message-Id: <20200810093931.50624-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/fixed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index d54830e48b8d..142a70a89153 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -182,7 +182,7 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 
 		drvdata->enable_clock = devm_clk_get(dev, NULL);
 		if (IS_ERR(drvdata->enable_clock)) {
-			dev_err(dev, "Cant get enable-clock from devicetree\n");
+			dev_err(dev, "Can't get enable-clock from devicetree\n");
 			return -ENOENT;
 		}
 	} else {
-- 
2.27.0
