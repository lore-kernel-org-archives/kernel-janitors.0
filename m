From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 Jan 2016 06:46:39 +0000
Subject: [PATCH] mtd: nand: mpc5121: use 'of_machine_is_compatible' to simplify code
Message-Id: <1452408399-5840-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The current code is the same as 'of_machine_is_compatible'.
So use it in order to remove a few lines of code and to be more
consistent with other parts of the kernel.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/nand/mpc5121_nfc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 6b93e89..5d7843f 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -626,7 +626,7 @@ static void mpc5121_nfc_free(struct device *dev, struct mtd_info *mtd)
 
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
-	struct device_node *rootnode, *dn = op->dev.of_node;
+	struct device_node *dn = op->dev.of_node;
 	struct clk *clk;
 	struct device *dev = &op->dev;
 	struct mpc5121_nfc_prv *prv;
@@ -712,18 +712,15 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip->ecc.mode = NAND_ECC_SOFT;
 
 	/* Support external chip-select logic on ADS5121 board */
-	rootnode = of_find_node_by_path("/");
-	if (of_device_is_compatible(rootnode, "fsl,mpc5121ads")) {
+	if (of_machine_is_compatible("fsl,mpc5121ads")) {
 		retval = ads5121_chipselect_init(mtd);
 		if (retval) {
 			dev_err(dev, "Chipselect init error!\n");
-			of_node_put(rootnode);
 			return retval;
 		}
 
 		chip->select_chip = ads5121_select_chip;
 	}
-	of_node_put(rootnode);
 
 	/* Enable NFC clock */
 	clk = devm_clk_get(dev, "ipg");
-- 
2.5.0

