From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:15 +0000
Subject: [PATCH 07/14] mtd: nand: qcom: remove unneeded conversions to bool
Message-Id: <20170315162322.12096-7-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/mtd/nand/qcom_nandc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 57d483ac5765..d1cec4311dde 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1037,8 +1037,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 
 			/* ignore erased codeword errors */
 			if (host->bch_enabled) {
-				erased = (erased_cw & ERASED_CW) = ERASED_CW ?
-					 true : false;
+				erased = (erased_cw & ERASED_CW) = ERASED_CW;
 			} else {
 				erased = erased_chunk_check_and_fixup(data_buf,
 								      data_len);
-- 
2.11.0

