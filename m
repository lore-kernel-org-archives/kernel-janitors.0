From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Sep 2019 18:00:23 +0000
Subject: Applied "spi: npcm-fiu: fix spelling mistake "frequancy" -> "frequency"" to the spi tree
Message-Id: <20190903180023.769DA2740A97@ypsilon.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190903122812.3986-1-colin.king@canonical.com>
In-Reply-To: <20190903122812.3986-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Nancy Yuen <yuenn@google.com>, openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>, Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>

The patch

   spi: npcm-fiu: fix spelling mistake "frequancy" -> "frequency"

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.4

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

From 0d6fccc1b6fbaf9c24e71efbbe9c3826a7b6a03d Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 3 Sep 2019 13:28:12 +0100
Subject: [PATCH] spi: npcm-fiu: fix spelling mistake "frequancy" ->
 "frequency"

There is a spelling mistake in a dev_warning message. Fix it. Also
break line to clear up checkpatch warning.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190903122812.3986-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-npcm-fiu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index 3ea1ec68147e..d9e2f58b104b 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -544,7 +544,8 @@ static int npcm_fiu_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	if (fiu->clkrate != chip->clkrate) {
 		ret = clk_set_rate(fiu->clk, chip->clkrate);
 		if (ret < 0)
-			dev_warn(fiu->dev, "Failed setting %lu frequancy, stay at %lu frequancy\n", chip->clkrate, fiu->clkrate);
+			dev_warn(fiu->dev, "Failed setting %lu frequency, stay at %lu frequency\n",
+				 chip->clkrate, fiu->clkrate);
 		else
 			fiu->clkrate = chip->clkrate;
 	}
-- 
2.20.1
