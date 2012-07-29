From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Jul 2012 19:46:10 +0000
Subject: [PATCH 6/9] drivers/usb/host/ehci-ls1x.c: use devm_ functions
Message-Id: <1343591173-2819-7-git-send-email-Julia.Lawall@lip6.fr>
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

 drivers/usb/host/ehci-ls1x.c |   18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/ehci-ls1x.c b/drivers/usb/host/ehci-ls1x.c
index a283e59..aa0f328 100644
--- a/drivers/usb/host/ehci-ls1x.c
+++ b/drivers/usb/host/ehci-ls1x.c
@@ -106,29 +106,19 @@ static int ehci_hcd_ls1x_probe(struct platform_device *pdev)
 	hcd->rsrc_start	= res->start;
 	hcd->rsrc_len	= resource_size(res);
 
-	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
-		dev_dbg(&pdev->dev, "controller already in use\n");
-		ret = -EBUSY;
-		goto err_put_hcd;
-	}
-
-	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
+	hcd->regs = devm_request_and_ioremap(&pdev->dev, res);
 	if (hcd->regs = NULL) {
 		dev_dbg(&pdev->dev, "error mapping memory\n");
 		ret = -EFAULT;
-		goto err_release_region;
+		goto err_put_hcd;
 	}
 
 	ret = usb_add_hcd(hcd, irq, IRQF_DISABLED | IRQF_SHARED);
 	if (ret)
-		goto err_iounmap;
+		goto err_put_hcd;
 
 	return ret;
 
-err_iounmap:
-	iounmap(hcd->regs);
-err_release_region:
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 err_put_hcd:
 	usb_put_hcd(hcd);
 	return ret;
@@ -139,8 +129,6 @@ static int ehci_hcd_ls1x_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
-	iounmap(hcd->regs);
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 	usb_put_hcd(hcd);
 
 	return 0;
