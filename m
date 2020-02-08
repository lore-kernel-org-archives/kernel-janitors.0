From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 11:36:12 +0000
Subject: [PATCH] mtd: fix spelling mistake "BlockMultiplerBits" -> "BlockMultiplierBits"
Message-Id: <20200208113612.817988-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake (missing i) in pr_info messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/inftlmount.c          | 2 +-
 drivers/mtd/nand/raw/diskonchip.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 54b176d4319f..af16d3485de0 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -130,7 +130,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 			 "    NoOfBootImageBlocks   = %d\n"
 			 "    NoOfBinaryPartitions  = %d\n"
 			 "    NoOfBDTLPartitions    = %d\n"
-			 "    BlockMultiplerBits    = %d\n"
+			 "    BlockMultiplierBits   = %d\n"
 			 "    FormatFlgs            = %d\n"
 			 "    OsakVersion           = 0x%x\n"
 			 "    PercentUsed           = %d\n",
diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index c0e1a8ebe820..2833c49c1378 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1169,7 +1169,7 @@ static inline int __init inftl_partscan(struct mtd_info *mtd, struct mtd_partiti
 		"    NoOfBootImageBlocks   = %d\n"
 		"    NoOfBinaryPartitions  = %d\n"
 		"    NoOfBDTLPartitions    = %d\n"
-		"    BlockMultiplerBits    = %d\n"
+		"    BlockMultiplierBits   = %d\n"
 		"    FormatFlgs            = %d\n"
 		"    OsakVersion           = %d.%d.%d.%d\n"
 		"    PercentUsed           = %d\n",
-- 
2.25.0
