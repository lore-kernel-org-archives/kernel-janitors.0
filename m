From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 06:58:16 +0000
Subject: [patch] USB: whci-hcd: fix NULL dereference on allocation failure
Message-Id: <20120720065816.GB11710@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If usb_create_hcd() fails here then we dereference "whc" inside the call
to whc_clean_up() before it has been set.  The compiler would have
warned about this if we hadn't initialized all the pointers to NULL at
the start of the function.  I've cleaned that up as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/host/whci/hcd.c b/drivers/usb/host/whci/hcd.c
index 1e141f7..c3a6478 100644
--- a/drivers/usb/host/whci/hcd.c
+++ b/drivers/usb/host/whci/hcd.c
@@ -238,16 +238,16 @@ static struct hc_driver whc_hc_driver = {
 
 static int whc_probe(struct umc_dev *umc)
 {
-	int ret = -ENOMEM;
+	int ret;
 	struct usb_hcd *usb_hcd;
-	struct wusbhc *wusbhc = NULL;
-	struct whc *whc = NULL;
+	struct wusbhc *wusbhc;
+	struct whc *whc;
 	struct device *dev = &umc->dev;
 
 	usb_hcd = usb_create_hcd(&whc_hc_driver, dev, "whci");
 	if (usb_hcd = NULL) {
 		dev_err(dev, "unable to create hcd\n");
-		goto error;
+		return -ENOMEM;
 	}
 
 	usb_hcd->wireless = 1;
