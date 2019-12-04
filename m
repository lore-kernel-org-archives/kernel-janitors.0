From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Dec 2019 12:15:36 +0000
Subject: Applied "regulator: s5m8767: Fix a warning message" to the regulator tree
Message-Id: <applied-20191203214838.9680-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191203214838.9680-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: broonie@kernel.org, b.zolnierkie@samsung.com, kernel-janitors@vger.kernel.org, krzk@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orgMark Brown <broonie@kernel.org>, sbkim73@samsung.com

The patch

   regulator: s5m8767: Fix a warning message

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f3c7f7b636ef5061906aa119eccc2b8dbbaf7199 Mon Sep 17 00:00:00 2001
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 3 Dec 2019 22:48:38 +0100
Subject: [PATCH] regulator: s5m8767: Fix a warning message

Axe a duplicated word ("property") in a warning message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20191203214838.9680-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/s5m8767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index bdc07739e9a2..12d6b8d2e97e 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -588,7 +588,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 		if (of_property_read_u32(reg_np, "op_mode",
 				&rmode->mode)) {
 			dev_warn(iodev->dev,
-				"no op_mode property property at %pOF\n",
+				"no op_mode property at %pOF\n",
 				reg_np);
 
 			rmode->mode = S5M8767_OPMODE_NORMAL_MODE;
-- 
2.20.1
