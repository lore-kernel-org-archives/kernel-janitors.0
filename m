From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Jul 2018 08:12:14 +0000
Subject: [PATCH] mtd: rawnand: gpmi: remove redundant variable payload_virt
Message-Id: <20180703081214.32754-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable payload_virt is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'payload_virt' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index f6aa358a3452..58d4e4a93a93 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -957,7 +957,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	void          *payload_virt;
 	dma_addr_t    payload_phys;
 	unsigned int  i;
 	unsigned char *status;
@@ -967,7 +966,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 
 	dev_dbg(this->dev, "page number is : %d\n", page);
 
-	payload_virt = this->payload_virt;
 	payload_phys = this->payload_phys;
 
 	if (virt_addr_valid(buf)) {
@@ -976,7 +974,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 		dest_phys = dma_map_single(this->dev, buf, nfc_geo->payload_size,
 					   DMA_FROM_DEVICE);
 		if (!dma_mapping_error(this->dev, dest_phys)) {
-			payload_virt = buf;
 			payload_phys = dest_phys;
 			direct = true;
 		}
-- 
2.17.1

