From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Jun 2016 12:24:03 +0000
Subject: [patch] mtd: nand: sunxi: prevent a small memory leak
Message-Id: <20160624122403.GC23169@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

I moved the sanity check on ecc->size before the allocation so that we
don't leak memory on error.

Fixes: 05af074a4b73 ('mtd: nand: sunxi: check ecc->size values')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index f582fe4..9f4e1c7 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1812,13 +1812,13 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
 	int ret;
 	int i;
 
+	if (ecc->size != 512 && ecc->size != 1024)
+		return -EINVAL;
+
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	if (ecc->size != 512 && ecc->size != 1024)
-		return -EINVAL;
-
 	/* Prefer 1k ECC chunk over 512 ones */
 	if (ecc->size = 512 && mtd->writesize > 512) {
 		ecc->size = 1024;
