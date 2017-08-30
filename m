From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Aug 2017 15:23:03 +0000
Subject: Applied "regulator: da9063: Return an error code on probe failure" to the regulator tree
Message-Id: <E1dn4pb-0003aS-Jz@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170830140358.k3i3rehnrtdrys4t@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: da9063: Return an error code on probe failure

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

From b6615659827839f3031c6bd4c1599c3c705778ac Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Aug 2017 17:03:58 +0300
Subject: [PATCH] regulator: da9063: Return an error code on probe failure

If "regl_pdata->n_regulators = 0" is true then we accidentally return
PTR_ERR(<some_valid_pointer>) instead of an error code.  I've changed it
to return -ENODEV instead.

Fixes: 69ca3e58d178 ("regulator: da9063: Add Dialog DA9063 voltage regulators support.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/da9063-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index c6af343f54ea..6a8f9cd69f52 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -736,7 +736,7 @@ static int da9063_regulator_probe(struct platform_device *pdev)
 	if (IS_ERR(regl_pdata) || regl_pdata->n_regulators = 0) {
 		dev_err(&pdev->dev,
 			"No regulators defined for the platform\n");
-		return PTR_ERR(regl_pdata);
+		return -ENODEV;
 	}
 
 	/* Find regulators set for particular device model */
-- 
2.14.1

