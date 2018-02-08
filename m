From: Mark Brown <broonie@kernel.org>
Date: Thu, 08 Feb 2018 15:41:45 +0000
Subject: Applied "regmap-i2c: Off by one in regmap_i2c_smbus_i2c_read/write()" to the regmap tree
Message-Id: <E1ejoKX-0008Uq-88@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180208072528.GB18158@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regmap-i2c: Off by one in regmap_i2c_smbus_i2c_read/write()

has been applied to the regmap tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git 

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

From 86effbe0d198aaf57459ec9ad3855e88e29ecb1c Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 8 Feb 2018 10:25:28 +0300
Subject: [PATCH] regmap-i2c: Off by one in regmap_i2c_smbus_i2c_read/write()

The commit message says that we are allowed to read and write up to 32
bytes but the code only allows us to write 31 bytes.  In other words,
the ">=" should be changed to ">".  But this is already checked in
regmap_raw_read()/write() so we can just remove the if statemetents.

Fixes: 29332534e2b6 ("regmap-i2c: Add smbus i2c block support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regmap-i2c.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 4735318f4268..056acde5e7d3 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -217,8 +217,6 @@ static int regmap_i2c_smbus_i2c_write(void *context, const void *data,
 
 	if (count < 1)
 		return -EINVAL;
-	if (count >= I2C_SMBUS_BLOCK_MAX)
-		return -E2BIG;
 
 	--count;
 	return i2c_smbus_write_i2c_block_data(i2c, ((u8 *)data)[0], count,
@@ -235,8 +233,6 @@ static int regmap_i2c_smbus_i2c_read(void *context, const void *reg,
 
 	if (reg_size != 1 || val_size < 1)
 		return -EINVAL;
-	if (val_size >= I2C_SMBUS_BLOCK_MAX)
-		return -E2BIG;
 
 	ret = i2c_smbus_read_i2c_block_data(i2c, ((u8 *)reg)[0], val_size, val);
 	if (ret = val_size)
-- 
2.15.1

