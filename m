From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2020 13:26:40 +0000
Subject: [PATCH] mtd: rawnand: ingenic: cleanup ARRAY_SIZE() vs sizeof() use
Message-Id: <20200624132640.GC9972@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>

The ARRAY_SIZE() is the number of elements but we want to use sizeof()
here for the number of bytes.  Fortunately, they are the same thing
because it's an array of u8 so this has no effect on runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
index 13fea645c7f0..54e377754a6c 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
@@ -90,8 +90,8 @@ static int jz4740_ecc_calculate(struct ingenic_ecc *ecc,
 	 * If the written data is completely 0xff, we also want to write 0xff as
 	 * ECC, otherwise we will get in trouble when doing subpage writes.
 	 */
-	if (memcmp(ecc_code, empty_block_ecc, ARRAY_SIZE(empty_block_ecc)) = 0)
-		memset(ecc_code, 0xff, ARRAY_SIZE(empty_block_ecc));
+	if (memcmp(ecc_code, empty_block_ecc, sizeof(empty_block_ecc)) = 0)
+		memset(ecc_code, 0xff, sizeof(empty_block_ecc));
 
 	return 0;
 }
-- 
2.27.0
