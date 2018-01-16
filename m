From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jan 2018 12:57:48 +0000
Subject: [PATCH][next] mtd: nand: remove redundant variable 'oob_len'
Message-Id: <20180116125748.26042-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable oob_len is assigned and never read, hence it is redundant and
can be removed.

Cleans up clang warnings:

drivers/mtd/nand/marvell_nand.c:1356:6: warning: Value stored to 'oob_len'
during its initialization is never read
drivers/mtd/nand/marvell_nand.c:1369:4: warning: Value stored to 'oob_len'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/marvell_nand.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
index 4bd53b360277..f15ab37edf4e 100644
--- a/drivers/mtd/nand/marvell_nand.c
+++ b/drivers/mtd/nand/marvell_nand.c
@@ -1353,7 +1353,6 @@ static int marvell_nfc_hw_ecc_bch_write_page_raw(struct mtd_info *mtd,
 	int data_len = lt->data_bytes;
 	int spare_len = lt->spare_bytes;
 	int ecc_len = lt->ecc_bytes;
-	int oob_len = spare_len + ecc_len;
 	int spare_offset = 0;
 	int ecc_offset = (lt->full_chunk_cnt * lt->spare_bytes) +
 		lt->last_spare_bytes;
@@ -1366,7 +1365,6 @@ static int marvell_nfc_hw_ecc_bch_write_page_raw(struct mtd_info *mtd,
 			data_len = lt->last_data_bytes;
 			spare_len = lt->last_spare_bytes;
 			ecc_len = lt->last_ecc_bytes;
-			oob_len = spare_len + ecc_len;
 		}
 
 		/* Point to the column of the next chunk */
-- 
2.15.1

