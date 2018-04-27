From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Apr 2018 14:07:33 +0000
Subject: [PATCH] staging: fsl-mc/dpio: Fix the error handling in probe()
Message-Id: <20180427140733.GE19583@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

First of all devm_memremap() function returns an error pointer, it
doesn't return NULL.  And second we need to set the error code on these
paths.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/fsl-mc/bus/dpio/dpio-driver.c b/drivers/staging/fsl-mc/bus/dpio/dpio-driver.c
index 9e125769a4e7..11a90a90d827 100644
--- a/drivers/staging/fsl-mc/bus/dpio/dpio-driver.c
+++ b/drivers/staging/fsl-mc/bus/dpio/dpio-driver.c
@@ -150,14 +150,16 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 	desc.regs_cena = devm_memremap(dev, dpio_dev->regions[1].start,
 				       resource_size(&dpio_dev->regions[1]),
 				       MEMREMAP_WC);
-	if (!desc.regs_cena) {
+	if (IS_ERR(desc.regs_cena)) {
 		dev_err(dev, "devm_memremap failed\n");
+		err = PTR_ERR(desc.regs_cena);
 		goto err_allocate_irqs;
 	}
 
 	desc.regs_cinh = devm_ioremap(dev, dpio_dev->regions[1].start,
 				      resource_size(&dpio_dev->regions[1]));
 	if (!desc.regs_cinh) {
+		err = -ENOMEM;
 		dev_err(dev, "devm_ioremap failed\n");
 		goto err_allocate_irqs;
 	}
@@ -175,6 +177,7 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 	priv->io = dpaa2_io_create(&desc);
 	if (!priv->io) {
 		dev_err(dev, "dpaa2_io_create failed\n");
+		err = -ENOMEM;
 		goto err_dpaa2_io_create;
 	}
 
