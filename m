From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Feb 2019 08:30:54 +0000
Subject: [PATCH 3/3] mtd: rawnand: meson: remove unnecessary condition in meson_nfc_select_chip()
Message-Id: <20190201083053.GE8459@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liang Yang <liang.yang@amlogic.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

If chip is negative then we return at the very start of the function.
Removing the check lets us pull everything in one indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 0d93d0b9c1af..105d12103ca6 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -234,23 +234,19 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
 	nfc->timing.tadl = meson_chip->tadl;
 	nfc->timing.tbers_max = meson_chip->tbers_max;
 
-	if (chip >= 0) {
-		if (nfc->clk_rate != meson_chip->clk_rate) {
-			ret = clk_set_rate(nfc->device_clk,
-					   meson_chip->clk_rate);
-			if (ret) {
-				dev_err(nfc->dev, "failed to set clock rate\n");
-				return;
-			}
-			nfc->clk_rate = meson_chip->clk_rate;
-		}
-		if (nfc->bus_timing != meson_chip->bus_timing) {
-			value = (NFC_CLK_CYCLE - 1)
-				| (meson_chip->bus_timing << 5);
-			writel(value, nfc->reg_base + NFC_REG_CFG);
-			writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
-			nfc->bus_timing =  meson_chip->bus_timing;
+	if (nfc->clk_rate != meson_chip->clk_rate) {
+		ret = clk_set_rate(nfc->device_clk, meson_chip->clk_rate);
+		if (ret) {
+			dev_err(nfc->dev, "failed to set clock rate\n");
+			return;
 		}
+		nfc->clk_rate = meson_chip->clk_rate;
+	}
+	if (nfc->bus_timing != meson_chip->bus_timing) {
+		value = (NFC_CLK_CYCLE - 1) | (meson_chip->bus_timing << 5);
+		writel(value, nfc->reg_base + NFC_REG_CFG);
+		writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
+		nfc->bus_timing =  meson_chip->bus_timing;
 	}
 }
 
-- 
2.17.1
