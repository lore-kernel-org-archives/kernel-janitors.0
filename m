From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:02:30 +0000
Subject: [PATCH 7/7] mtd: nand: fully initialize mtd_oob_ops
Message-Id: <1425117750-22298-8-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

We're not initializing the ooblen field. Our users don't care, since
they check that oobbuf = NULL first, but it's good practice to zero
unused fields out.

We can drop the NULL initializations since we're memset()ing the whole
thing.

Noticed by Coverity, CID #200821, #200822

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5488a7ad63e7..d4cec2f8a016 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -386,7 +386,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	uint8_t buf[2] = { 0, 0 };
 	int ret = 0, res, i = 0;
 
-	ops.datbuf = NULL;
+	memset(&ops, 0, sizeof(ops));
 	ops.oobbuf = buf;
 	ops.ooboffs = chip->badblockpos;
 	if (chip->options & NAND_BUSWIDTH_16) {
@@ -1716,9 +1716,9 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int ret;
 
 	nand_get_device(mtd, FL_READING);
+	memset(&ops, 0, sizeof(ops));
 	ops.len = len;
 	ops.datbuf = buf;
-	ops.oobbuf = NULL;
 	ops.mode = MTD_OPS_PLACE_OOB;
 	ret = nand_do_read_ops(mtd, from, &ops);
 	*retlen = ops.retlen;
@@ -2508,9 +2508,9 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Grab the device */
 	panic_nand_get_device(chip, mtd, FL_WRITING);
 
+	memset(&ops, 0, sizeof(ops));
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
-	ops.oobbuf = NULL;
 	ops.mode = MTD_OPS_PLACE_OOB;
 
 	ret = nand_do_write_ops(mtd, to, &ops);
@@ -2536,9 +2536,9 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int ret;
 
 	nand_get_device(mtd, FL_WRITING);
+	memset(&ops, 0, sizeof(ops));
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
-	ops.oobbuf = NULL;
 	ops.mode = MTD_OPS_PLACE_OOB;
 	ret = nand_do_write_ops(mtd, to, &ops);
 	*retlen = ops.retlen;
-- 
2.1.0

