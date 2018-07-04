From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 04 Jul 2018 08:34:58 +0000
Subject: [PATCH -next] mtd: spinand: Fix error return code in spinand_init()
Message-Id: <1530693298-14271-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704102829.6b29c6cb@bbrezillon>
In-Reply-To: <20180704102829.6b29c6cb@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Peter Pan <peterpandong@micron.com>, Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENOMEM from the kzalloc() error handling
case instead of 0, as done elsewhere in this function.

Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/nand/spi/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17d207a..011683e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -985,8 +985,10 @@ static int spinand_init(struct spinand_device *spinand)
 	spinand->databuf = kzalloc(nanddev_page_size(nand) +
 			       nanddev_per_page_oobsize(nand),
 			       GFP_KERNEL);
-	if (!spinand->databuf)
+	if (!spinand->databuf) {
+		ret = -ENOMEM;
 		goto err_free_bufs;
+	}
 
 	spinand->oobbuf = spinand->databuf + nanddev_page_size(nand);

