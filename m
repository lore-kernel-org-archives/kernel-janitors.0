From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:24 +0000
Subject: [PATCH 08/25] sm_common: remove casts from void*
Message-Id: <1277806525-30976-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/mtd/nand/sm_common.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index ac80fb3..4a8f367 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -109,7 +109,7 @@ static struct nand_flash_dev nand_xd_flash_ids[] = {
 
 int sm_register_device(struct mtd_info *mtd, int smartmedia)
 {
-	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
+	struct nand_chip *chip = mtd->priv;
 	int ret;
 
 	chip->options |= NAND_SKIP_BBTSCAN;
-- 
1.7.0.4

