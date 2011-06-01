From: Julia Lawall <julia@diku.dk>
Date: Wed, 01 Jun 2011 17:10:06 +0000
Subject: [PATCH 3/10] drivers/usb/host/ohci-pxa27x.c: add missing clk_put
Message-Id: <1306948213-20767-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Eric Miao <eric.y.miao@gmail.com>, Mike Rapoport <mike@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Add a label before the call to clk_put and jump to that in the error
handling code that occurs after the call to clk_get has succeeded.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression e1,e2;
statement S;
@@

e1 = clk_get@p1(...);
... when != e1 = e2
    when != clk_put(e1)
    when any
if (...) { ... when != clk_put(e1)
               when != if (...) { ... clk_put(e1) ... }
* return@p3 ...;
 } else S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/host/ohci-pxa27x.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index afef7b0..80be547 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -312,8 +312,10 @@ int usb_hcd_pxa27x_probe (const struct hc_driver *driver, struct platform_device
 		return PTR_ERR(usb_clk);
 
 	hcd = usb_create_hcd (driver, &pdev->dev, "pxa27x");
-	if (!hcd)
-		return -ENOMEM;
+	if (!hcd) {
+		retval = -ENOMEM;
+		goto err0;
+	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -368,6 +370,7 @@ int usb_hcd_pxa27x_probe (const struct hc_driver *driver, struct platform_device
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
  err1:
 	usb_put_hcd(hcd);
+ err0:
 	clk_put(usb_clk);
 	return retval;
 }

