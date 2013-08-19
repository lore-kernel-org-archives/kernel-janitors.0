From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 08:51:53 +0000
Subject: [PATCH 3/6] mtd: fsmc_nand: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <1376902316-18520-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource_byname when the value is passed to devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,e,e1;
expression ret != 0;
identifier l;
@@

  res = platform_get_resource_byname(...);
- if (res = NULL) { ... \(goto l;\|return ret;\) }
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/nand/fsmc_nand.c |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 2a3b1b9..3dc1a75 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -958,9 +958,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
-	if (!res)
-		return -EINVAL;
-
 	host->data_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->data_va))
 		return PTR_ERR(host->data_va);
@@ -968,25 +965,16 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	host->data_pa = (dma_addr_t)res->start;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_addr");
-	if (!res)
-		return -EINVAL;
-
 	host->addr_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->addr_va))
 		return PTR_ERR(host->addr_va);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cmd");
-	if (!res)
-		return -EINVAL;
-
 	host->cmd_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->cmd_va))
 		return PTR_ERR(host->cmd_va);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "fsmc_regs");
-	if (!res)
-		return -EINVAL;
-
 	host->regs_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->regs_va))
 		return PTR_ERR(host->regs_va);

