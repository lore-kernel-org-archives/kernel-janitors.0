From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Apr 2017 13:06:15 +0000
Subject: [PATCH] mtd: spi-nor: Potential oops on error path in quad_enable()
Message-Id: <20170428130614.w4cmbwvprgzv7sky@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Huang Shijie <b32955@freescale.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

Before commit cff959958832 ("mtd: spi-nor: introduce SPI 1-2-2 and SPI
1-4-4 protocols") then we treated 1 as -EINVAL in the caller but after
that commit we changed to propagate the return.  My static checker
complains that it's eventually passed to an ERR_PTR() and later
dereferenced, but I'm not totally certain if that's true.  Regardless,
returning 1 is wrong.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 060a59e716be..a05db3371ebb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1390,7 +1390,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	write_sr(nor, val | SR_QUAD_EN_MX);
 
 	if (spi_nor_wait_till_ready(nor))
-		return 1;
+		return -EINVAL;
 
 	ret = read_sr(nor);
 	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
