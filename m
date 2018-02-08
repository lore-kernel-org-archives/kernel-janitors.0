From: Mark Brown <broonie@kernel.org>
Date: Thu, 08 Feb 2018 15:41:48 +0000
Subject: Applied "regmap: Fix reversed bounds check in regmap_raw_write()" to the regmap tree
Message-Id: <E1ejoKa-0008W5-S4@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180208072344.GA18158@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, stable@vger.kernel.orgMark Brown <broonie@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regmap: Fix reversed bounds check in regmap_raw_write()

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

From f00e71091ab92eba52122332586c6ecaa9cd1a56 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 8 Feb 2018 10:23:44 +0300
Subject: [PATCH] regmap: Fix reversed bounds check in regmap_raw_write()

We're supposed to be checking that "val_len" is not too large but
instead we check if it is smaller than the max.

The only function affected would be regmap_i2c_smbus_i2c_write() in
drivers/base/regmap/regmap-i2c.c.  Strangely that function has its own
limit check which returns an error if (count >= I2C_SMBUS_BLOCK_MAX) so
it doesn't look like it has ever been able to do anything except return
an error.

Fixes: c335931ed9d2 ("regmap: Add raw_write/read checks for max_raw_write/read sizes")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/base/regmap/regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index ee302ccdfbc8..453116fd4362 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1831,7 +1831,7 @@ int regmap_raw_write(struct regmap *map, unsigned int reg,
 		return -EINVAL;
 	if (val_len % map->format.val_bytes)
 		return -EINVAL;
-	if (map->max_raw_write && map->max_raw_write > val_len)
+	if (map->max_raw_write && map->max_raw_write < val_len)
 		return -E2BIG;
 
 	map->lock(map->lock_arg);
-- 
2.15.1

