From: Mark Brown <broonie@kernel.org>
Date: Mon, 26 Feb 2018 11:18:02 +0000
Subject: Applied "regmap: Remove unnecessary printk for failed allocation" to the regmap tree
Message-Id: <E1eqGnC-0005cx-9Z@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <56cba529-03eb-9088-3fea-8fbb50c355af@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>linux-kernel@vger.kernel.org

The patch

   regmap: Remove unnecessary printk for failed allocation

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

From b4ecfec5ee3f282a4ac0876de332876fec9b488c Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Thu, 22 Feb 2018 12:59:11 +0000
Subject: [PATCH] regmap: Remove unnecessary printk for failed allocation

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 8fe6e08fa41e..707b0450ad72 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2050,10 +2050,9 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 			return -EINVAL;
 
 		wval = kmemdup(val, val_count * val_bytes, map->alloc_flags);
-		if (!wval) {
-			dev_err(map->dev, "Error in memory allocation\n");
+		if (!wval)
 			return -ENOMEM;
-		}
+
 		for (i = 0; i < val_count * val_bytes; i += val_bytes)
 			map->format.parse_inplace(wval + i);
 
-- 
2.16.1

