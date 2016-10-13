From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:06:47 +0000
Subject: [patch 1/2] mtd: spi-nor: Off by one in cqspi_setup_flash()
Message-Id: <20161013080646.GB3389@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

There are CQSPI_MAX_CHIPSELECT elements in the ->f_pdata array so the >
should be >=.

Fixes: 140623410536 ('mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d403ba7..944863b 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1082,7 +1082,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 			goto err;
 		}
 
-		if (cs > CQSPI_MAX_CHIPSELECT) {
+		if (cs >= CQSPI_MAX_CHIPSELECT) {
 			dev_err(dev, "Chip select %d out of range.\n", cs);
 			goto err;
 		}
