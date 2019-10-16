From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 16 Oct 2019 18:14:36 +0000
Subject: [PATCH 03/10] mtd: nand: qcom: remove unneeded conversions to bool
Message-Id: <20191016181443.24790-2-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191016181443.24790-1-afd@ti.com>
In-Reply-To: <20191016181443.24790-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 7bb9a7e8e1e7..b437b0c79cf2 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1767,8 +1767,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 			 * ERASED_CW bits are set.
 			 */
 			if (host->bch_enabled) {
-				erased = (erased_cw & ERASED_CW) = ERASED_CW ?
-					 true : false;
+				erased = (erased_cw & ERASED_CW) = ERASED_CW;
 			/*
 			 * For RS ECC, HW reports the erased CW by placing
 			 * special characters at certain offsets in the buffer.
-- 
2.17.1
