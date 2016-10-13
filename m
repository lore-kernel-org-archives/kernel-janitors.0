From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:30:39 +0000
Subject: [patch 2/2] mtd: spi-nor: Fix some error codes in cqspi_setup_flash()
Message-Id: <20161013080857.GC3389@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

We return success or possibly uninitialized values on these error paths
instead of proper error codes.

Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 944863b..d489fbd 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1077,12 +1077,14 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 
 	/* Get flash device data */
 	for_each_available_child_of_node(dev->of_node, np) {
-		if (of_property_read_u32(np, "reg", &cs)) {
+		ret = of_property_read_u32(np, "reg", &cs);
+		if (ret) {
 			dev_err(dev, "Couldn't determine chip select.\n");
 			goto err;
 		}
 
 		if (cs >= CQSPI_MAX_CHIPSELECT) {
+			ret = -EINVAL;
 			dev_err(dev, "Chip select %d out of range.\n", cs);
 			goto err;
 		}
