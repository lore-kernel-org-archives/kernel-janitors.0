From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 Jan 2018 21:15:47 +0000
Subject: [PATCH] mtd/nand/omap2: Delete an error message for a failed memory allocation in omap_nand_probe()
Message-Id: <4b92ade2-5fcd-3213-bf1b-110a1e03472c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jan 2018 22:10:39 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nand/omap2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index dad438c4906a..5c96c291426b 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1947,10 +1947,8 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (!mtd->name) {
 		mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					   "omap2-nand.%d", info->gpmc_cs);
-		if (!mtd->name) {
-			dev_err(&pdev->dev, "Failed to set MTD name\n");
+		if (!mtd->name)
 			return -ENOMEM;
-		}
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.15.1

