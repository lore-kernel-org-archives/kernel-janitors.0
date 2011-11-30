From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2011 08:43:41 +0000
Subject: [patch] Staging: line6: NULL dereference in dev_err()
Message-Id: <20111130084341.GC6268@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"line6" hasn't been set at this point and we should be using
&interface->dev instead.

Gcc would have complained about this if it weren't for the fact that we
initialized line6 to NULL.  I removed the initialization.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/line6/driver.c b/drivers/staging/line6/driver.c
index a71a5af..a2f48ee 100644
--- a/drivers/staging/line6/driver.c
+++ b/drivers/staging/line6/driver.c
@@ -726,8 +726,8 @@ static int line6_probe(struct usb_interface *interface,
 		       const struct usb_device_id *id)
 {
 	int devtype;
-	struct usb_device *usbdev = NULL;
-	struct usb_line6 *line6 = NULL;
+	struct usb_device *usbdev;
+	struct usb_line6 *line6;
 	const struct line6_properties *properties;
 	int devnum;
 	int interface_number, alternate = 0;
@@ -936,7 +936,7 @@ static int line6_probe(struct usb_interface *interface,
 	}
 
 	if (size = 0) {
-		dev_err(line6->ifcdev,
+		dev_err(&interface->dev,
 			"driver bug: interface data size not set\n");
 		ret = -ENODEV;
 		goto err_put;
