From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Fri, 01 Nov 2019 21:42:54 +0000
Subject: [PATCH 2/3] staging: axis-fifo: request resources using managed functions
Message-Id: <20191101214232.16960-3-quentin.deslandes@itdev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101214232.16960-1-quentin.deslandes@itdev.co.uk>
In-Reply-To: <20191101214232.16960-1-quentin.deslandes@itdev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quentin Deslandes <quentin.deslandes@itdev.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cristian Sicilia <sicilia.cristian@gmail.com>

Request device's resources (memory, interrupt...) using managed
function.

Signed-off-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
---
 drivers/staging/axis-fifo/axis-fifo.c | 45 ++++++++-------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index b436f48a9d50..2e6e2f149a26 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -809,24 +809,13 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->mem = r_mem;
 
 	/* request physical memory */
-	if (!request_mem_region(fifo->mem->start, resource_size(fifo->mem),
-				DRIVER_NAME)) {
-		dev_err(fifo->dt_device,
-			"couldn't lock memory region at 0x%pa\n",
-			&fifo->mem->start);
-		rc = -EBUSY;
+	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, fifo->mem);
+	if (IS_ERR(fifo->base_addr)) {
+		rc = PTR_ERR(fifo->base_addr);
+		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
 		goto err_initial;
 	}
-	dev_dbg(fifo->dt_device, "got memory location [0x%pa - 0x%pa]\n",
-		&fifo->mem->start, &fifo->mem->end);
-
-	/* map physical memory to kernel virtual address space */
-	fifo->base_addr = ioremap(fifo->mem->start, resource_size(fifo->mem));
-	if (!fifo->base_addr) {
-		dev_err(fifo->dt_device, "couldn't map physical memory\n");
-		rc = -ENOMEM;
-		goto err_mem;
-	}
+
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
 	/* create unique device name */
@@ -842,7 +831,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	rc = axis_fifo_parse_dt(fifo);
 	if (rc)
-		goto err_unmap;
+		goto err_initial;
 
 	reset_ip_core(fifo);
 
@@ -857,16 +846,17 @@ static int axis_fifo_probe(struct platform_device *pdev)
 		dev_err(fifo->dt_device, "no IRQ found for 0x%pa\n",
 			&fifo->mem->start);
 		rc = -EIO;
-		goto err_unmap;
+		goto err_initial;
 	}
 
 	/* request IRQ */
 	fifo->irq = r_irq->start;
-	rc = request_irq(fifo->irq, &axis_fifo_irq, 0, DRIVER_NAME, fifo);
+	rc = devm_request_irq(fifo->dt_device, fifo->irq, &axis_fifo_irq, 0,
+			      DRIVER_NAME, fifo);
 	if (rc) {
 		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
 			fifo->irq);
-		goto err_unmap;
+		goto err_initial;
 	}
 
 	/* ----------------------------
@@ -877,7 +867,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	/* allocate device number */
 	rc = alloc_chrdev_region(&fifo->devt, 0, 1, DRIVER_NAME);
 	if (rc < 0)
-		goto err_irq;
+		goto err_initial;
 	dev_dbg(fifo->dt_device, "allocated device number major %i minor %i\n",
 		MAJOR(fifo->devt), MINOR(fifo->devt));
 
@@ -901,7 +891,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	}
 
 	/* create sysfs entries */
-	rc = sysfs_create_group(&fifo->device->kobj, &axis_fifo_attrs_group);
+	rc = devm_device_add_group(fifo->device, &axis_fifo_attrs_group);
 	if (rc < 0) {
 		dev_err(fifo->dt_device, "couldn't register sysfs group\n");
 		goto err_cdev;
@@ -919,12 +909,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	device_destroy(axis_fifo_driver_class, fifo->devt);
 err_chrdev_region:
 	unregister_chrdev_region(fifo->devt, 1);
-err_irq:
-	free_irq(fifo->irq, fifo);
-err_unmap:
-	iounmap(fifo->base_addr);
-err_mem:
-	release_mem_region(fifo->mem->start, resource_size(fifo->mem));
 err_initial:
 	dev_set_drvdata(dev, NULL);
 	return rc;
@@ -935,15 +919,12 @@ static int axis_fifo_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = dev_get_drvdata(dev);
 
-	sysfs_remove_group(&fifo->device->kobj, &axis_fifo_attrs_group);
 	cdev_del(&fifo->char_device);
 	dev_set_drvdata(fifo->device, NULL);
 	device_destroy(axis_fifo_driver_class, fifo->devt);
 	unregister_chrdev_region(fifo->devt, 1);
-	free_irq(fifo->irq, fifo);
-	iounmap(fifo->base_addr);
-	release_mem_region(fifo->mem->start, resource_size(fifo->mem));
 	dev_set_drvdata(dev, NULL);
+
 	return 0;
 }
 
-- 
2.23.0
