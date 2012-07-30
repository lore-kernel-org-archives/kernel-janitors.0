From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Jul 2012 14:43:43 +0000
Subject: [PATCH 3/7] drivers/usb/host/ehci-sead3.c: use devm_ functions
Message-Id: <1343659425-24563-5-git-send-email-Julia.Lawall@lip6.fr>
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

 drivers/usb/host/ehci-sead3.c |   15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/ehci-sead3.c b/drivers/usb/host/ehci-sead3.c
index 58c96bd..802dad8 100644
--- a/drivers/usb/host/ehci-sead3.c
+++ b/drivers/usb/host/ehci-sead3.c
@@ -112,17 +112,11 @@ static int ehci_hcd_sead3_drv_probe(struct platform_device *pdev)
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
 
-	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
-		pr_debug("request_mem_region failed");
-		ret = -EBUSY;
-		goto err1;
-	}
-
-	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
+	hcd->regs = devm_request_and_ioremap(&pdev->dev, res);
 	if (!hcd->regs) {
 		pr_debug("ioremap failed");
 		ret = -ENOMEM;
-		goto err2;
+		goto err1;
 	}
 
 	/* Root hub has integrated TT. */
@@ -135,9 +129,6 @@ static int ehci_hcd_sead3_drv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	iounmap(hcd->regs);
-err2:
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 err1:
 	usb_put_hcd(hcd);
 	return ret;
@@ -148,8 +139,6 @@ static int ehci_hcd_sead3_drv_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
-	iounmap(hcd->regs);
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 	usb_put_hcd(hcd);
 	platform_set_drvdata(pdev, NULL);
 

