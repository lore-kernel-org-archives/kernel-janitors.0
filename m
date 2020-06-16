From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jun 2020 11:51:25 +0000
Subject: [PATCH][next] mtd: rawnand: qcom: fix incorrect masking operator, used & instead of |
Message-Id: <20200616115125.74298-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the expression (nand_ctrl | BAM_MODE_EN) is always true no
matter the value of nand_ctrl because the incorrect masking operator
is being used.  Fix this by using bit-wise & instead of |.

Addresses-Coverity: ("Wrong operator used")
Fixes: dd0c1fc8de12 ("mtd: rawnand: qcom: set BAM mode only if not set already")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index a3ef4288be27..37d95532ba7e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2790,7 +2790,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 		 * only if it is not in BAM mode. In most cases BAM
 		 * mode will be enabled in bootloader
 		 */
-		if (!(nand_ctrl | BAM_MODE_EN))
+		if (!(nand_ctrl & BAM_MODE_EN))
 			nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
 	} else {
 		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
-- 
2.27.0.rc0
