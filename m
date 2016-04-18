From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 Apr 2016 13:10:46 +0000
Subject: Applied "regulator: lp3971: Silence uninitialized variable warning" to the regulator tree
Message-Id: <E1as8ww-00021s-0A@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160414093441.GF16549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The patch

   regulator: lp3971: Silence uninitialized variable warning

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

From 40e1d79ee16968bff7b3cf12c65d5740c02be1b6 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 12:34:41 +0300
Subject: [PATCH] regulator: lp3971: Silence uninitialized variable warning

This is harmless but if lp3971_i2c_read() fails then "tmp" can be
uninitialized.  Silence the warning by moving the error handling up a
line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/lp3971.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/lp3971.c b/drivers/regulator/lp3971.c
index 15c25c622edf..204b5c5270e0 100644
--- a/drivers/regulator/lp3971.c
+++ b/drivers/regulator/lp3971.c
@@ -365,8 +365,8 @@ static int lp3971_set_bits(struct lp3971 *lp3971, u8 reg, u16 mask, u16 val)
 	mutex_lock(&lp3971->io_lock);
 
 	ret = lp3971_i2c_read(lp3971->i2c, reg, 1, &tmp);
-	tmp = (tmp & ~mask) | val;
 	if (ret = 0) {
+		tmp = (tmp & ~mask) | val;
 		ret = lp3971_i2c_write(lp3971->i2c, reg, 1, &tmp);
 		dev_dbg(lp3971->dev, "reg write 0x%02x -> 0x%02x\n", (int)reg,
 			(unsigned)val&0xff);
-- 
2.8.0.rc3

