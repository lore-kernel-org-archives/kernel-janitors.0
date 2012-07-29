From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Jul 2012 19:46:07 +0000
Subject: [PATCH 3/9] drivers/usb/host/ehci-cns3xxx.c: use devm_ functions
Message-Id: <1343591173-2819-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343591173-2819-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1343591173-2819-1-git-send-email-Julia.Lawall@lip6.fr>
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
Not compiled.

 drivers/usb/host/ehci-cns3xxx.c |   16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/ehci-cns3xxx.c b/drivers/usb/host/ehci-cns3xxx.c
index caaa3e5..d91708d 100644
--- a/drivers/usb/host/ehci-cns3xxx.c
+++ b/drivers/usb/host/ehci-cns3xxx.c
@@ -105,27 +105,17 @@ static int cns3xxx_ehci_probe(struct platform_device *pdev)
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
 
-	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len,
-				driver->description)) {
-		dev_dbg(dev, "controller already in use\n");
-		retval = -EBUSY;
-		goto err1;
-	}
-
-	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
+	hcd->regs = devm_request_and_ioremap(&pdev->dev, res);
 	if (hcd->regs = NULL) {
 		dev_dbg(dev, "error mapping memory\n");
 		retval = -EFAULT;
-		goto err2;
+		goto err1;
 	}
 
 	retval = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (retval = 0)
 		return retval;
 
-	iounmap(hcd->regs);
-err2:
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 err1:
 	usb_put_hcd(hcd);
 
@@ -137,8 +127,6 @@ static int cns3xxx_ehci_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
-	iounmap(hcd->regs);
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 
 	/*
 	 * EHCI and OHCI share the same clock and power,
