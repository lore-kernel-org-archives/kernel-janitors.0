From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Feb 2019 08:30:09 +0000
Subject: [PATCH 2/3] mtd: rawnand: meson: fix a loop in meson_nand_bch_mode()
Message-Id: <20190201083009.GD8459@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liang Yang <liang.yang@amlogic.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

There is a sizeof() vs ARRAY_SIZE() bug here.  We want the number of
elements in the array, not the number of bytes.  It means we potentially
read beyond the end of the array.

Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 94c90be7e1e0..0d93d0b9c1af 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1143,7 +1143,7 @@ static int meson_nand_bch_mode(struct nand_chip *nand)
 	if (nand->ecc.strength > 60 || nand->ecc.strength < 8)
 		return -EINVAL;
 
-	for (i = 0; i < sizeof(meson_ecc); i++) {
+	for (i = 0; i < ARRAY_SIZE(meson_ecc); i++) {
 		if (meson_ecc[i].strength = nand->ecc.strength) {
 			meson_chip->bch_mode = meson_ecc[i].bch;
 			return 0;
-- 
2.17.1
