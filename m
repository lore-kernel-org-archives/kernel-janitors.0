From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Nov 2018 07:20:24 +0000
Subject: [PATCH] spi: npcm: Fix an error code in the probe function
Message-Id: <20181123072024.5vtjzta4rcmqtyph@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Cc: Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, Mark Brown <broonie@kernel.org>, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an IS_ERR() vs PTR_ERR() typo here.  The current code returns 1
but we want to return the negative error code.

Fixes: 2a22f1b30cee ("spi: npcm: add NPCM PSPI controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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
2.11.0
