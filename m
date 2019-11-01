From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Fri, 01 Nov 2019 21:42:59 +0000
Subject: [PATCH 3/3] staging: axis-fifo: remove unused pointer to memory resource
Message-Id: <20191101214232.16960-4-quentin.deslandes@itdev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101214232.16960-1-quentin.deslandes@itdev.co.uk>
In-Reply-To: <20191101214232.16960-1-quentin.deslandes@itdev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quentin Deslandes <quentin.deslandes@itdev.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cristian Sicilia <sicilia.cristian@gmail.com>

Remove unused resource pointer from the device's internal structure.

Signed-off-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
---
 drivers/staging/axis-fifo/axis-fifo.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 2e6e2f149a26..39e6c59df1e9 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -125,7 +125,6 @@ MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write() timing out;
 
 struct axis_fifo {
 	int irq; /* interrupt */
-	struct resource *mem; /* physical memory */
 	void __iomem *base_addr; /* kernel space memory */
 
 	unsigned int rx_fifo_depth; /* max words in the receive fifo */
@@ -806,10 +805,8 @@ static int axis_fifo_probe(struct platform_device *pdev)
 		goto err_initial;
 	}
 
-	fifo->mem = r_mem;
-
 	/* request physical memory */
-	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, fifo->mem);
+	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
 	if (IS_ERR(fifo->base_addr)) {
 		rc = PTR_ERR(fifo->base_addr);
 		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
@@ -820,7 +817,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	/* create unique device name */
 	snprintf(device_name, sizeof(device_name), "%s_%pa",
-		 DRIVER_NAME, &fifo->mem->start);
+		 DRIVER_NAME, &r_mem->start);
 
 	dev_dbg(fifo->dt_device, "device name [%s]\n", device_name);
 
@@ -844,7 +841,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	r_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!r_irq) {
 		dev_err(fifo->dt_device, "no IRQ found for 0x%pa\n",
-			&fifo->mem->start);
+			&r_mem->start);
 		rc = -EIO;
 		goto err_initial;
 	}
@@ -898,7 +895,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	}
 
 	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%pa, irq=%i, major=%i, minor=%i\n",
-		 &fifo->mem->start, &fifo->base_addr, fifo->irq,
+		 &r_mem->start, &fifo->base_addr, fifo->irq,
 		 MAJOR(fifo->devt), MINOR(fifo->devt));
 
 	return 0;
-- 
2.23.0
