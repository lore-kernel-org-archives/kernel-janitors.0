From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 14 Aug 2013 09:11:09 +0000
Subject: [PATCH 5/29] spi/spi-{bcm63xx.c,bfin-v3.c}: simplify use of devm_ioremap_resource
Message-Id: <1376471493-22215-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

Move the call to platform_get_resource adjacent to the call to
devm_ioremap_resource to make the connection between them more clear.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res = NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/spi/spi-bcm63xx.c |    8 +-------
 drivers/spi/spi-bfin-v3.c |    8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
index 4ac028d..2b5c692 100644
--- a/drivers/spi/spi-bcm63xx.c
+++ b/drivers/spi/spi-bcm63xx.c
@@ -342,13 +342,6 @@ static int bcm63xx_spi_probe(struct platform_device *pdev)
 	struct bcm63xx_spi *bs;
 	int ret;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(dev, "no iomem\n");
-		ret = -ENXIO;
-		goto out;
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(dev, "no irq\n");
@@ -375,6 +368,7 @@ static int bcm63xx_spi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, master);
 	bs->pdev = pdev;
 
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	bs->regs = devm_ioremap_resource(&pdev->dev, r);
 	if (IS_ERR(bs->regs)) {
 		ret = PTR_ERR(bs->regs);
diff --git a/drivers/spi/spi-bfin-v3.c b/drivers/spi/spi-bfin-v3.c
index 603d7e9..d5bab00 100644
--- a/drivers/spi/spi-bfin-v3.c
+++ b/drivers/spi/spi-bfin-v3.c
@@ -792,13 +792,6 @@ static int bfin_spi_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	/* get register base and tx/rx dma */
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(dev, "can not get register base\n");
-		return -ENXIO;
-	}
-
 	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
 	if (!res) {
 		dev_err(dev, "can not get tx dma resource\n");
@@ -838,6 +831,7 @@ static int bfin_spi_probe(struct platform_device *pdev)
 	drv_data->pin_req = info->pin_req;
 	drv_data->sclk = sclk;
 
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	drv_data->regs = devm_ioremap_resource(dev, mem);
 	if (IS_ERR(drv_data->regs)) {
 		ret = PTR_ERR(drv_data->regs);

