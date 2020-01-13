From: Mark Brown <broonie@kernel.org>
Date: Mon, 13 Jan 2020 15:13:22 +0000
Subject: Applied "regulator: mpq7920: Check the correct variable in mpq7920_regulator_register()" to the regu
Message-Id: <applied-20200113125805.xri6jqoxy2ldzqyg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200113125805.xri6jqoxy2ldzqyg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>

The patch

   regulator: mpq7920: Check the correct variable in mpq7920_regulator_register()

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.6

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

From 7eec67869893bc34bd3a3126e5124a4ef017e0cd Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2020 15:59:33 +0300
Subject: [PATCH] regulator: mpq7920: Check the correct variable in
 mpq7920_regulator_register()

There is a typo in the error checking.  We should be checking
"->rdev[i]" instead of just "->rdev".

Fixes: 6501c1f54a17 ("regulator: mpq7920: add mpq7920 regulator driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/20200113125805.xri6jqoxy2ldzqyg@kili.mountain
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/mpq7920.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mpq7920.c b/drivers/regulator/mpq7920.c
index ab1b847c57e5..80f3131f0d1b 100644
--- a/drivers/regulator/mpq7920.c
+++ b/drivers/regulator/mpq7920.c
@@ -274,8 +274,8 @@ static inline int mpq7920_regulator_register(
 
 		info->rdev[i] = devm_regulator_register(info->dev, rdesc,
 					 config);
-		if (IS_ERR(info->rdev))
-			return PTR_ERR(info->rdev);
+		if (IS_ERR(info->rdev[i]))
+			return PTR_ERR(info->rdev[i]);
 	}
 
 	return 0;
-- 
2.20.1
