From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Jun 2019 10:58:59 +0000
Subject: [PATCH][next] mtd: rawnand: gpmi: remove double assignment to block_size
Message-Id: <20190604105859.16627-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable block_size is being assigned to itself and to
geo->ecc_chunk_size.  Clean up the double assignment by removing
the assignment to itself.

Addresses-Coverity: ("Evaluation order violation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 5db84178edff..334fe3130285 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1428,7 +1428,7 @@ static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
 	struct bch_geometry *geo = &this->bch_geometry;
 	unsigned int ecc_strength = geo->ecc_strength >> 1;
 	unsigned int gf_len = geo->gf_len;
-	unsigned int block_size = block_size = geo->ecc_chunk_size;
+	unsigned int block_size = geo->ecc_chunk_size;
 
 	this->bch_flashlayout0  		BF_BCH_FLASH0LAYOUT0_NBLOCKS(geo->ecc_chunk_count - 1) |
-- 
2.20.1
