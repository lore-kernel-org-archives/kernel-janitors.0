From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 04 Nov 2017 20:12:04 +0000
Subject: [PATCH] USB: core: Improve unlocking of a mutex in two functions
Message-Id: <0ff5f74e-ae23-5c97-8998-0e598ceae96b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Eugene Korenevsky <ekorenevsky@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Jaejoong Kim <climbbb.kim@gmail.com>, Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Nov 2017 21:00:46 +0100

* Add jump targets so that a call of the function "mutex_unlock" is stored
  only twice in these function implementations.

* Replace five calls by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/core/hub.c     |  8 ++++----
 drivers/usb/core/message.c | 18 ++++++++++--------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 196a0a5540ed..8f3067c2015c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5518,8 +5518,7 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
 		dev_warn(&udev->dev,
 				"Busted HC?  Not enough HCD resources for "
 				"old configuration.\n");
-		mutex_unlock(hcd->bandwidth_mutex);
-		goto re_enumerate;
+		goto unlock;
 	}
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 			USB_REQ_SET_CONFIGURATION, 0,
@@ -5529,8 +5528,7 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
 		dev_err(&udev->dev,
 			"can't restore configuration #%d (error=%d)\n",
 			udev->actconfig->desc.bConfigurationValue, ret);
-		mutex_unlock(hcd->bandwidth_mutex);
-		goto re_enumerate;
+		goto unlock;
 	}
 	mutex_unlock(hcd->bandwidth_mutex);
 	usb_set_device_state(udev, USB_STATE_CONFIGURED);
@@ -5583,6 +5581,8 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
 	udev->bos = bos;
 	return 0;
 
+unlock:
+	mutex_unlock(hcd->bandwidth_mutex);
 re_enumerate:
 	usb_release_bos_descriptor(udev);
 	udev->bos = bos;
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 371a07d874a3..fe8e36cc7def 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1321,8 +1321,8 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
 	 */
 	if (usb_disable_lpm(dev)) {
 		dev_err(&iface->dev, "%s Failed to disable LPM\n.", __func__);
-		mutex_unlock(hcd->bandwidth_mutex);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto unlock;
 	}
 	/* Changing alt-setting also frees any allocated streams */
 	for (i = 0; i < iface->cur_altsetting->desc.bNumEndpoints; i++)
@@ -1332,9 +1332,7 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
 	if (ret < 0) {
 		dev_info(&dev->dev, "Not enough bandwidth for altsetting %d\n",
 				alternate);
-		usb_enable_lpm(dev);
-		mutex_unlock(hcd->bandwidth_mutex);
-		return ret;
+		goto enable_lpm;
 	}
 
 	if (dev->quirks & USB_QUIRK_NO_SET_INTF)
@@ -1355,9 +1353,7 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
 	} else if (ret < 0) {
 		/* Re-instate the old alt setting */
 		usb_hcd_alloc_bandwidth(dev, NULL, alt, iface->cur_altsetting);
-		usb_enable_lpm(dev);
-		mutex_unlock(hcd->bandwidth_mutex);
-		return ret;
+		goto enable_lpm;
 	}
 	mutex_unlock(hcd->bandwidth_mutex);
 
@@ -1413,6 +1409,12 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
 		create_intf_ep_devs(iface);
 	}
 	return 0;
+
+enable_lpm:
+	usb_enable_lpm(dev);
+unlock:
+	mutex_unlock(hcd->bandwidth_mutex);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(usb_set_interface);
 
-- 
2.15.0

