From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Jan 2016 16:54:45 +0000
Subject: [PATCH 1/2] net-qmi_wwan: Refactoring for qmi_wwan_bind()
Message-Id: <5686AF55.5020801@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5686AE52.1020008@users.sourceforge.net>
In-Reply-To: <5686AE52.1020008@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Jan 2016 17:32:07 +0100

Reduce the scope for the local variable "desc" to one branch
of an if statement.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/usb/qmi_wwan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index d0b2973..5b8af06 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -345,7 +345,6 @@ static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
 	int status = -1;
 	u8 *buf = intf->cur_altsetting->extra;
 	int len = intf->cur_altsetting->extralen;
-	struct usb_interface_descriptor *desc = &intf->cur_altsetting->desc;
 	struct usb_cdc_union_desc *cdc_union;
 	struct usb_cdc_ether_desc *cdc_ether;
 	struct usb_driver *driver = driver_of(intf);
@@ -366,6 +365,8 @@ static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
 
 	/* Use separate control and data interfaces if we found a CDC Union */
 	if (cdc_union) {
+		struct usb_interface_descriptor *desc = &intf->cur_altsetting->desc;
+
 		info->data = usb_ifnum_to_if(dev->udev,
 					     cdc_union->bSlaveInterface0);
 		if (desc->bInterfaceNumber != cdc_union->bMasterInterface0 ||
-- 
2.6.3

