From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Jul 2012 19:46:11 +0000
Subject: [PATCH 7/9] drivers/usb/host/ehci-msm.c: use devm_ functions
Message-Id: <1343591173-2819-8-git-send-email-Julia.Lawall@lip6.fr>
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

The original code was also missing a call to iounmap(hcd->regs); in the
remove function, so this patch also implicitly fixes a bug.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Not compiled.

 drivers/usb/host/ehci-msm.c |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/ehci-msm.c b/drivers/usb/host/ehci-msm.c
index 17dd9e9..4af4dc5 100644
--- a/drivers/usb/host/ehci-msm.c
+++ b/drivers/usb/host/ehci-msm.c
@@ -133,7 +133,7 @@ static int ehci_msm_probe(struct platform_device *pdev)
 
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
-	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
+	hcd->regs = devm_ioremap(&pdev->dev, hcd->rsrc_start, hcd->rsrc_len);
 	if (!hcd->regs) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		ret = -ENOMEM;
@@ -145,17 +145,17 @@ static int ehci_msm_probe(struct platform_device *pdev)
 	 * powering up VBUS, mapping of registers address space and power
 	 * management.
 	 */
-	phy = usb_get_phy(USB_PHY_TYPE_USB2);
+	phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR_OR_NULL(phy)) {
 		dev_err(&pdev->dev, "unable to find transceiver\n");
 		ret = -ENODEV;
-		goto unmap;
+		goto put_hcd;
 	}
 
 	ret = otg_set_host(phy->otg, &hcd->self);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "unable to register with transceiver\n");
-		goto put_transceiver;
+		goto put_hcd;
 	}
 
 	device_init_wakeup(&pdev->dev, 1);
@@ -168,10 +168,6 @@ static int ehci_msm_probe(struct platform_device *pdev)
 
 	return 0;
 
-put_transceiver:
-	usb_put_phy(phy);
-unmap:
-	iounmap(hcd->regs);
 put_hcd:
 	usb_put_hcd(hcd);
 
@@ -187,7 +183,6 @@ static int __devexit ehci_msm_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 
 	otg_set_host(phy->otg, NULL);
-	usb_put_phy(phy);
 
 	usb_put_hcd(hcd);
 
