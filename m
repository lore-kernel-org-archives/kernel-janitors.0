From: Mark Brown <broonie@kernel.org>
Date: Fri, 10 Jan 2020 13:38:14 +0000
Subject: Applied "regulator: mp8859: tidy up white space in probe" to the regulator tree
Message-Id: <applied-20200110055252.rvelu4ysvoxsbmlg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200110055252.rvelu4ysvoxsbmlg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Markus Reichl <m.reichl@fivetechno.de>

The patch

   regulator: mp8859: tidy up white space in probe

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

From b83380512e955f538366c33dd79d660cdac2875c Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 Jan 2020 08:52:52 +0300
Subject: [PATCH] regulator: mp8859: tidy up white space in probe

These two lines are indented an extra tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/20200110055252.rvelu4ysvoxsbmlg@kili.mountain
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/mp8859.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mp8859.c b/drivers/regulator/mp8859.c
index e804a5267301..1d26b506ee5b 100644
--- a/drivers/regulator/mp8859.c
+++ b/drivers/regulator/mp8859.c
@@ -123,8 +123,8 @@ static int mp8859_i2c_probe(struct i2c_client *i2c)
 		ret = PTR_ERR(rdev);
 		dev_err(&i2c->dev, "failed to register %s: %d\n",
 			mp8859_regulators[0].name, ret);
-			return ret;
-		}
+		return ret;
+	}
 	return 0;
 }
 
-- 
2.20.1
