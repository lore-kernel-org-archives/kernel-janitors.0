From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 16:08:25 +0000
Subject: [patch] mtd: cafe_nand: fix an & vs | mistake
Message-Id: <20120609160825.GC6488@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20110103191415.GA15176@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mike Dunn <mikedunn@newsguy.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>

The intent here was clearly to set result to true if the 0x40000000 flag
was set.  But instead there was a | vs & typo and we always set result
to true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I do not have the hardware to test this.  The original code is clearly
buggy, but what about if 0x40000000 is the wrong flag?

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index f3594a6..ac0d967 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -102,7 +102,7 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 static int cafe_device_ready(struct mtd_info *mtd)
 {
 	struct cafe_priv *cafe = mtd->priv;
-	int result = !!(cafe_readl(cafe, NAND_STATUS) | 0x40000000);
+	int result = !!(cafe_readl(cafe, NAND_STATUS) & 0x40000000);
 	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
 
 	cafe_writel(cafe, irqs, NAND_IRQ);
