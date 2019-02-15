From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Feb 2019 15:15:47 +0000
Subject: [PATCH][next] mtd: spi-nor: cadence-quadspi: fix spelling mistake: "Couldnt't" -> "Couldn't"
Message-Id: <20190215151547.17532-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 56512c0368f9..792628750eec 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1249,7 +1249,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 
 	ddata = of_device_get_match_data(dev);
 	if (!ddata) {
-		dev_err(dev, "Couldnt't find driver data\n");
+		dev_err(dev, "Couldn't find driver data\n");
 		return -EINVAL;
 	}
 	hwcaps.mask = ddata->hwcaps_mask;
-- 
2.20.1
