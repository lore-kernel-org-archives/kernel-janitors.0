From: Mark Brown <broonie@kernel.org>
Date: Fri, 23 Nov 2018 14:14:38 +0000
Subject: Applied "spi: npcm: Fix an error code in the probe function" to the spi tree
Message-Id: <20181123141438.8D3DD440078@finisterre.ee.mobilebroadband>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20181123072024.5vtjzta4rcmqtyph@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>Mark Brown <broonie@kernel.org>, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.orglinux-spi@vger.kernel.org

The patch

   spi: npcm: Fix an error code in the probe function

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

From 428f977a6a6b43154928571b01fa8415c11a9244 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Nov 2018 10:20:24 +0300
Subject: [PATCH] spi: npcm: Fix an error code in the probe function

There is an IS_ERR() vs PTR_ERR() typo here.  The current code returns 1
but we want to return the negative error code.

Fixes: 2a22f1b30cee ("spi: npcm: add NPCM PSPI controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-npcm-pspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 342178e282bc..fed05b02007c 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -381,7 +381,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 		syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
 	if (IS_ERR(priv->rst_regmap)) {
 		dev_err(&pdev->dev, "failed to find nuvoton,npcm750-rst\n");
-		return IS_ERR(priv->rst_regmap);
+		return PTR_ERR(priv->rst_regmap);
 	}
 
 	/* reset SPI-HW block */
-- 
2.19.1
