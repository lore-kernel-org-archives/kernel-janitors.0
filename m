From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 May 2017 05:33:56 +0000
Subject: [PATCH v2] mtd: spi-nor: Potential oops on error path in quad_enable()
Message-Id: <20170505053356.vcgboleyqigluhc3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <82655033-06b0-a310-07b4-1c8fa2591da2@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

Before commit cff959958832 ("mtd: spi-nor: introduce SPI 1-2-2 and SPI
1-4-4 protocols") then we treated 1 as -EINVAL in the caller but after
that commit we changed to propagate the return.  My static checker
complains that it's eventually passed to an ERR_PTR() and later
dereferenced, but I'm not totally certain if that's true.  Regardless,
returning 1 is wrong.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Propogate the error code from spi_nor_wait_till_ready() instead of
    just returning -EINVAL

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 060a59e716be..eef55b597ec7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1389,8 +1389,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
 
 	write_sr(nor, val | SR_QUAD_EN_MX);
 
-	if (spi_nor_wait_till_ready(nor))
-		return 1;
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
 
 	ret = read_sr(nor);
 	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
