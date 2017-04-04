From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Apr 2017 08:15:46 +0000
Subject: [patch] mtd: nand: Fix a couple error codes
Message-Id: <20170404081545.GA25533@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wenyou Yang <wenyou.yang@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Josh Wu <rainyfeeling@outlook.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

We accidentally return 1 on error instead of proper error codes.

Fixes: 07b23e3db9ed ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 27301603f394..b8d17a024dbd 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -1686,7 +1686,7 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	nc->smc = syscon_node_to_regmap(np);
 	of_node_put(np);
 	if (IS_ERR(nc->smc)) {
-		ret = IS_ERR(nc->smc);
+		ret = PTR_ERR(nc->smc);
 		dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
 		return ret;
 	}
@@ -1719,7 +1719,7 @@ atmel_smc_nand_controller_init(struct atmel_smc_nand_controller *nc)
 	nc->matrix = syscon_node_to_regmap(np);
 	of_node_put(np);
 	if (IS_ERR(nc->matrix)) {
-		ret = IS_ERR(nc->matrix);
+		ret = PTR_ERR(nc->matrix);
 		dev_err(dev, "Could not get Matrix regmap (err = %d)\n", ret);
 		return ret;
 	}
