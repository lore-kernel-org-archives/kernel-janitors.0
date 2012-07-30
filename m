From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Jul 2012 14:43:44 +0000
Subject: [PATCH 2/7] drivers/usb/host/ehci-s5p.c: use devm_ functions
Message-Id: <1343659425-24563-6-git-send-email-Julia.Lawall@lip6.fr>
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

 drivers/usb/host/ehci-s5p.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 9d8f1dd..d055503 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -128,7 +128,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	}
 
 	s5p_ehci->hcd = hcd;
-	s5p_ehci->clk = clk_get(&pdev->dev, "usbhost");
+	s5p_ehci->clk = devm_clk_get(&pdev->dev, "usbhost");
 
 	if (IS_ERR(s5p_ehci->clk)) {
 		dev_err(&pdev->dev, "Failed to get usbhost clock\n");
@@ -138,7 +138,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 
 	err = clk_enable(s5p_ehci->clk);
 	if (err)
-		goto fail_clken;
+		goto fail_clk;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -184,8 +184,6 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 
 fail_io:
 	clk_disable(s5p_ehci->clk);
-fail_clken:
-	clk_put(s5p_ehci->clk);
 fail_clk:
 	usb_put_hcd(hcd);
 	return err;
@@ -203,7 +201,6 @@ static int __devexit s5p_ehci_remove(struct platform_device *pdev)
 		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
 
 	clk_disable(s5p_ehci->clk);
-	clk_put(s5p_ehci->clk);
 
 	usb_put_hcd(hcd);
 

