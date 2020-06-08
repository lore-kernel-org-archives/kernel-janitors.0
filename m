From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jun 2020 14:17:27 +0000
Subject: [PATCH] i2c: npcm7xx: Fix a couple error codes in probe
Message-Id: <20200608141727.GC1912173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tali Perry <tali.perry1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org

The code here is accidentally returning IS_ERR() which is 1 but it
should be returning negative error codes with PTR_ERR().

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index a8e75c3484f12..d679a04be0fd0 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2239,12 +2239,12 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 
 	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
 	if (IS_ERR(gcr_regmap))
-		return IS_ERR(gcr_regmap);
+		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
 
 	clk_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk");
 	if (IS_ERR(clk_regmap))
-		return IS_ERR(clk_regmap);
+		return PTR_ERR(clk_regmap);
 
 	bus->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->reg))
-- 
2.26.2
