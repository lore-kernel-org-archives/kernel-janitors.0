From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Jul 2012 14:43:45 +0000
Subject: [PATCH 1/7] drivers/usb/host/ehci-ppc-of.c: use devm_ functions
Message-Id: <1343659425-24563-7-git-send-email-Julia.Lawall@lip6.fr>
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

 drivers/usb/host/ehci-ppc-of.c |   28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
index bbbe89d..fa937d0 100644
--- a/drivers/usb/host/ehci-ppc-of.c
+++ b/drivers/usb/host/ehci-ppc-of.c
@@ -114,12 +114,6 @@ static int __devinit ehci_hcd_ppc_of_probe(struct platform_device *op)
 	hcd->rsrc_start = res.start;
 	hcd->rsrc_len = resource_size(&res);
 
-	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
-		printk(KERN_ERR "%s: request_mem_region failed\n", __FILE__);
-		rv = -EBUSY;
-		goto err_rmr;
-	}
-
 	irq = irq_of_parse_and_map(dn, 0);
 	if (irq = NO_IRQ) {
 		printk(KERN_ERR "%s: irq_of_parse_and_map failed\n", __FILE__);
@@ -127,9 +121,9 @@ static int __devinit ehci_hcd_ppc_of_probe(struct platform_device *op)
 		goto err_irq;
 	}
 
-	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
+	hcd->regs = devm_request_and_ioremap(&op->dev, &res);
 	if (!hcd->regs) {
-		printk(KERN_ERR "%s: ioremap failed\n", __FILE__);
+		pr_err("%s: devm_request_and_ioremap failed\n", __FILE__);
 		rv = -ENOMEM;
 		goto err_ioremap;
 	}
@@ -139,8 +133,10 @@ static int __devinit ehci_hcd_ppc_of_probe(struct platform_device *op)
 	if (np != NULL) {
 		/* claim we really affected by usb23 erratum */
 		if (!of_address_to_resource(np, 0, &res))
-			ehci->ohci_hcctrl_reg = ioremap(res.start +
-					OHCI_HCCTRL_OFFSET, OHCI_HCCTRL_LEN);
+			ehci->ohci_hcctrl_reg +				devm_ioremap(&op->dev,
+					     res.start + OHCI_HCCTRL_OFFSET,
+					     OHCI_HCCTRL_LEN);
 		else
 			pr_debug("%s: no ohci offset in fdt\n", __FILE__);
 		if (!ehci->ohci_hcctrl_reg) {
@@ -169,19 +165,13 @@ static int __devinit ehci_hcd_ppc_of_probe(struct platform_device *op)
 
 	rv = usb_add_hcd(hcd, irq, 0);
 	if (rv)
-		goto err_ehci;
+		goto err_ioremap;
 
 	return 0;
 
-err_ehci:
-	if (ehci->has_amcc_usb23)
-		iounmap(ehci->ohci_hcctrl_reg);
-	iounmap(hcd->regs);
 err_ioremap:
 	irq_dispose_mapping(irq);
 err_irq:
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-err_rmr:
 	usb_put_hcd(hcd);
 
 	return rv;
@@ -202,9 +192,7 @@ static int ehci_hcd_ppc_of_remove(struct platform_device *op)
 
 	usb_remove_hcd(hcd);
 
-	iounmap(hcd->regs);
 	irq_dispose_mapping(hcd->irq);
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 
 	/* use request_mem_region to test if the ohci driver is loaded.  if so
 	 * ensure the ohci core is operational.
@@ -222,8 +210,6 @@ static int ehci_hcd_ppc_of_remove(struct platform_device *op)
 				pr_debug("%s: no ohci offset in fdt\n", __FILE__);
 			of_node_put(np);
 		}
-
-		iounmap(ehci->ohci_hcctrl_reg);
 	}
 	usb_put_hcd(hcd);
 

