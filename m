From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:28:18 +0000
Subject: [patch] WUSB: remove an unnused variable
Message-Id: <20121002082818.GG12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "wusb_cap_descr_default" is never used.  GCC doesn't complain about
it because we have that line ".bLength = sizeof(wusb_cap_descr_default)"
inside the definition itself.  Clang complains though.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
It could be instead that the intent was to actually use this variable.
In that case, could someone send a patch and give me a Reported-by
token?

diff --git a/drivers/usb/wusbcore/devconnect.c b/drivers/usb/wusbcore/devconnect.c
index 231009a..1d36531 100644
--- a/drivers/usb/wusbcore/devconnect.c
+++ b/drivers/usb/wusbcore/devconnect.c
@@ -847,19 +847,6 @@ static void wusb_dev_bos_rm(struct wusb_dev *wusb_dev)
 	wusb_dev->wusb_cap_descr = NULL;
 };
 
-static struct usb_wireless_cap_descriptor wusb_cap_descr_default = {
-	.bLength = sizeof(wusb_cap_descr_default),
-	.bDescriptorType = USB_DT_DEVICE_CAPABILITY,
-	.bDevCapabilityType = USB_CAP_TYPE_WIRELESS_USB,
-
-	.bmAttributes = USB_WIRELESS_BEACON_NONE,
-	.wPHYRates = cpu_to_le16(USB_WIRELESS_PHY_53),
-	.bmTFITXPowerInfo = 0,
-	.bmFFITXPowerInfo = 0,
-	.bmBandGroup = cpu_to_le16(0x0001),	/* WUSB1.0[7.4.1] bottom */
-	.bReserved = 0
-};
-
 /*
  * USB stack's device addition Notifier Callback
  *
