From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Jul 2012 14:43:39 +0000
Subject: [PATCH 7/7] drivers/usb/host/ehci-xilinx-of.c: use devm_ functions
Message-Id: <1343659425-24563-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The various devm_ functions allocate memory that is released when a driver
detaches.  This patch uses these functions for data that is allocated in
the probe function of a platform device and is only freed in the remove
function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Not compiled

 drivers/usb/host/ehci-xilinx-of.c |   20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/ehci-xilinx-of.c b/drivers/usb/host/ehci-xilinx-of.c
index 39f24fa..6a3f921 100644
--- a/drivers/usb/host/ehci-xilinx-of.c
+++ b/drivers/usb/host/ehci-xilinx-of.c
@@ -152,12 +152,6 @@ static int __devinit ehci_hcd_xilinx_of_probe(struct platform_device *op)
 	hcd->rsrc_start = res.start;
 	hcd->rsrc_len = resource_size(&res);
 
-	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
-		printk(KERN_ERR "%s: request_mem_region failed\n", __FILE__);
-		rv = -EBUSY;
-		goto err_rmr;
-	}
-
 	irq = irq_of_parse_and_map(dn, 0);
 	if (!irq) {
 		printk(KERN_ERR "%s: irq_of_parse_and_map failed\n", __FILE__);
@@ -165,11 +159,11 @@ static int __devinit ehci_hcd_xilinx_of_probe(struct platform_device *op)
 		goto err_irq;
 	}
 
-	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
+	hcd->regs = devm_request_and_ioremap(&op->dev, &res);
 	if (!hcd->regs) {
-		printk(KERN_ERR "%s: ioremap failed\n", __FILE__);
+		pr_err("%s: devm_request_and_ioremap failed\n", __FILE__);
 		rv = -ENOMEM;
-		goto err_ioremap;
+		goto err_irq;
 	}
 
 	ehci = hcd_to_ehci(hcd);
@@ -200,12 +194,7 @@ static int __devinit ehci_hcd_xilinx_of_probe(struct platform_device *op)
 	if (rv = 0)
 		return 0;
 
-	iounmap(hcd->regs);
-
-err_ioremap:
 err_irq:
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-err_rmr:
 	usb_put_hcd(hcd);
 
 	return rv;
@@ -227,9 +216,6 @@ static int ehci_hcd_xilinx_of_remove(struct platform_device *op)
 
 	usb_remove_hcd(hcd);
 
-	iounmap(hcd->regs);
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-
 	usb_put_hcd(hcd);
 
 	return 0;

