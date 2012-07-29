From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Jul 2012 19:46:09 +0000
Subject: [PATCH 5/9] drivers/usb/host/ehci-ixp4xx.c: use devm_ functions
Message-Id: <1343591173-2819-6-git-send-email-Julia.Lawall@lip6.fr>
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

 drivers/usb/host/ehci-ixp4xx.c |   19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/ehci-ixp4xx.c b/drivers/usb/host/ehci-ixp4xx.c
index 488d401..f224c0a 100644
--- a/drivers/usb/host/ehci-ixp4xx.c
+++ b/drivers/usb/host/ehci-ixp4xx.c
@@ -98,30 +98,19 @@ static int ixp4xx_ehci_probe(struct platform_device *pdev)
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
 
-	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len,
-				driver->description)) {
-		dev_dbg(&pdev->dev, "controller already in use\n");
-		retval = -EBUSY;
-		goto fail_request_resource;
-	}
-
-	hcd->regs = ioremap_nocache(hcd->rsrc_start, hcd->rsrc_len);
+	hcd->regs = devm_request_and_ioremap(&pdev->dev, res);
 	if (hcd->regs = NULL) {
 		dev_dbg(&pdev->dev, "error mapping memory\n");
 		retval = -EFAULT;
-		goto fail_ioremap;
+		goto fail_request_resource;
 	}
 
 	retval = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (retval)
-		goto fail_add_hcd;
+		goto fail_request_resource;
 
 	return retval;
 
-fail_add_hcd:
-	iounmap(hcd->regs);
-fail_ioremap:
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 fail_request_resource:
 	usb_put_hcd(hcd);
 fail_create_hcd:
@@ -134,8 +123,6 @@ static int ixp4xx_ehci_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
-	iounmap(hcd->regs);
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 	usb_put_hcd(hcd);
 
 	return 0;
