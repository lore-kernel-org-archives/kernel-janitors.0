From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2019 08:32:52 +0000
Subject: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Message-Id: <20190815083252.GD27238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

The problem is that if "ret" is negative then when we check if
"ret > len", that condition is going to be true because of type
promotion.  So this patch re-orders the code to check for negatives
first and preserve those error codes.

Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 63af87609bac..986b0754495d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2903,10 +2903,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
 
 	while (len) {
 		ret = spi_nor_read_data(nor, addr, len, buf);
-		if (!ret || ret > len)
-			return -EIO;
 		if (ret < 0)
 			return ret;
+		if (!ret || ret > len)
+			return -EIO;
 
 		buf += ret;
 		addr += ret;
-- 
2.20.1
