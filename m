From: eladwexler77@yahoo.com
Date: Mon, 09 Sep 2013 20:25:02 +0000
Subject: [PATCH] Staging: usbip: stub_dev: Fixed checkpatch warnings
Message-Id: <1378758302-26966-1-git-send-email-eladwexler77@yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Elad Wexler <eladwexler77@yahoo.com>

Coding style issues

Signed-off-by: Elad Wexler <eladwexler77@yahoo.com>
---
 drivers/staging/usbip/stub_dev.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/usbip/stub_dev.c b/drivers/staging/usbip/stub_dev.c
index d8957a5..76a1ff0 100644
--- a/drivers/staging/usbip/stub_dev.c
+++ b/drivers/staging/usbip/stub_dev.c
@@ -357,8 +357,9 @@ static int stub_probe(struct usb_interface *interface,
 	busid_priv = get_busid_priv(udev_busid);
 	if (!busid_priv || (busid_priv->status = STUB_BUSID_REMOV) ||
 	    (busid_priv->status = STUB_BUSID_OTHER)) {
-		dev_info(&interface->dev, "%s is not in match_busid table... "
-			 "skip!\n", udev_busid);
+		dev_info(&interface->dev,
+			"%s is not in match_busid table... skip!\n",
+			udev_busid);
 
 		/*
 		 * Return value should be ENODEV or ENOXIO to continue trying
@@ -375,8 +376,10 @@ static int stub_probe(struct usb_interface *interface,
 	}
 
 	if (!strcmp(udev->bus->bus_name, "vhci_hcd")) {
-		dev_dbg(&udev->dev, "%s is attached on vhci_hcd... skip!\n",
-			 udev_busid);
+		dev_dbg(&udev->dev,
+			"%s is attached on vhci_hcd... skip!\n",
+			udev_busid);
+
 		return -ENODEV;
 	}
 
@@ -386,10 +389,10 @@ static int stub_probe(struct usb_interface *interface,
 			return -ENODEV;
 
 		busid_priv->interf_count++;
-		dev_info(&interface->dev, "usbip-host: register new interface "
-			 "(bus %u dev %u ifn %u)\n",
-			 udev->bus->busnum, udev->devnum,
-			 interface->cur_altsetting->desc.bInterfaceNumber);
+		dev_info(&interface->dev,
+			"usbip-host: register new interface (bus %u dev %u ifn %u)\n",
+			udev->bus->busnum, udev->devnum,
+			interface->cur_altsetting->desc.bInterfaceNumber);
 
 		/* set private data to usb_interface */
 		usb_set_intfdata(interface, sdev);
@@ -412,9 +415,10 @@ static int stub_probe(struct usb_interface *interface,
 	if (!sdev)
 		return -ENOMEM;
 
-	dev_info(&interface->dev, "usbip-host: register new device "
-		 "(bus %u dev %u ifn %u)\n", udev->bus->busnum, udev->devnum,
-		 interface->cur_altsetting->desc.bInterfaceNumber);
+	dev_info(&interface->dev,
+		"usbip-host: register new device (bus %u dev %u ifn %u)\n",
+		udev->bus->busnum, udev->devnum,
+		interface->cur_altsetting->desc.bInterfaceNumber);
 
 	busid_priv->interf_count = 0;
 	busid_priv->shutdown_busid = 0;
-- 
1.8.3.1

