From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 02 Aug 2018 07:15:58 +0000
Subject: [PATCH] uio: pruss: fix error handling in probe
Message-Id: <20180802071558.p6p6pmzsrkz26rjr@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are two bugs here.  First the error codes weren't set on several
paths.  And second, if the call to request_threaded_irq() inside
uio_register_device() fails then it would lead to a double free when
we call uio_unregister_device() inside pruss_cleanup().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/uio/uio_pruss.c b/drivers/uio/uio_pruss.c
index 91aea8823af5..1cc175d3c25c 100644
--- a/drivers/uio/uio_pruss.c
+++ b/drivers/uio/uio_pruss.c
@@ -122,7 +122,7 @@ static int pruss_probe(struct platform_device *pdev)
 	struct uio_pruss_dev *gdev;
 	struct resource *regs_prussio;
 	struct device *dev = &pdev->dev;
-	int ret = -ENODEV, cnt = 0, len;
+	int ret, cnt, i, len;
 	struct uio_pruss_pdata *pdata = dev_get_platdata(dev);
 
 	gdev = kzalloc(sizeof(struct uio_pruss_dev), GFP_KERNEL);
@@ -131,8 +131,8 @@ static int pruss_probe(struct platform_device *pdev)
 
 	gdev->info = kcalloc(MAX_PRUSS_EVT, sizeof(*p), GFP_KERNEL);
 	if (!gdev->info) {
-		kfree(gdev);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_gdev;
 	}
 
 	/* Power on PRU in case its not done as part of boot-loader */
@@ -140,29 +140,26 @@ static int pruss_probe(struct platform_device *pdev)
 	if (IS_ERR(gdev->pruss_clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(gdev->pruss_clk);
-		kfree(gdev->info);
-		kfree(gdev);
-		return ret;
-	} else {
-		ret = clk_enable(gdev->pruss_clk);
-		if (ret) {
-			dev_err(dev, "Failed to enable clock\n");
-			clk_put(gdev->pruss_clk);
-			kfree(gdev->info);
-			kfree(gdev);
-			return ret;
-		}
+		goto err_free_info;
+	}
+
+	ret = clk_enable(gdev->pruss_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock\n");
+		goto err_clk_put;
 	}
 
 	regs_prussio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!regs_prussio) {
 		dev_err(dev, "No PRUSS I/O resource specified\n");
-		goto out_free;
+		ret = -EIO;
+		goto err_clk_disable;
 	}
 
 	if (!regs_prussio->start) {
 		dev_err(dev, "Invalid memory resource\n");
-		goto out_free;
+		ret = -EIO;
+		goto err_clk_disable;
 	}
 
 	if (pdata->sram_pool) {
@@ -172,7 +169,8 @@ static int pruss_probe(struct platform_device *pdev)
 					sram_pool_sz, &gdev->sram_paddr);
 		if (!gdev->sram_vaddr) {
 			dev_err(dev, "Could not allocate SRAM pool\n");
-			goto out_free;
+			ret = -ENOMEM;
+			goto err_clk_disable;
 		}
 	}
 
@@ -180,14 +178,16 @@ static int pruss_probe(struct platform_device *pdev)
 				&(gdev->ddr_paddr), GFP_KERNEL | GFP_DMA);
 	if (!gdev->ddr_vaddr) {
 		dev_err(dev, "Could not allocate external memory\n");
-		goto out_free;
+		ret = -ENOMEM;
+		goto err_free_sram;
 	}
 
 	len = resource_size(regs_prussio);
 	gdev->prussio_vaddr = ioremap(regs_prussio->start, len);
 	if (!gdev->prussio_vaddr) {
 		dev_err(dev, "Can't remap PRUSS I/O  address range\n");
-		goto out_free;
+		ret = -ENOMEM;
+		goto err_free_ddr_vaddr;
 	}
 
 	gdev->pintc_base = pdata->pintc_base;
@@ -215,15 +215,36 @@ static int pruss_probe(struct platform_device *pdev)
 		p->priv = gdev;
 
 		ret = uio_register_device(dev, p);
-		if (ret < 0)
-			goto out_free;
+		if (ret < 0) {
+			kfree(p->name);
+			goto err_unloop;
+		}
 	}
 
 	platform_set_drvdata(pdev, gdev);
 	return 0;
 
-out_free:
-	pruss_cleanup(dev, gdev);
+err_unloop:
+	for (i = 0, p = gdev->info; i < cnt; i++, p++) {
+		uio_unregister_device(p);
+		kfree(p->name);
+	}
+	iounmap(gdev->prussio_vaddr);
+err_free_ddr_vaddr:
+	dma_free_coherent(dev, extram_pool_sz, gdev->ddr_vaddr,
+			  gdev->ddr_paddr);
+err_free_sram:
+	if (pdata->sram_pool)
+		gen_pool_free(gdev->sram_pool, gdev->sram_vaddr, sram_pool_sz);
+err_clk_disable:
+	clk_disable(gdev->pruss_clk);
+err_clk_put:
+	clk_put(gdev->pruss_clk);
+err_free_info:
+	kfree(gdev->info);
+err_free_gdev:
+	kfree(gdev);
+
 	return ret;
 }
 
