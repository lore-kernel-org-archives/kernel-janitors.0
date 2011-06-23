From: Dan Carpenter <error27@gmail.com>
Date: Thu, 23 Jun 2011 05:56:37 +0000
Subject: [patch] net/usb/kalmia: signedness bug in kalmia_bind()
Message-Id: <20110623055637.GL14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:NETWORKING DRIVERS" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"status" should be an int here for the error handling to work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/usb/kalmia.c b/drivers/net/usb/kalmia.c
index d965fb1..c08fecf 100644
--- a/drivers/net/usb/kalmia.c
+++ b/drivers/net/usb/kalmia.c
@@ -127,7 +127,7 @@ kalmia_init_and_get_ethernet_addr(struct usbnet *dev, u8 *ethernet_addr)
 static int
 kalmia_bind(struct usbnet *dev, struct usb_interface *intf)
 {
-	u8 status;
+	int status;
 	u8 ethernet_addr[ETH_ALEN];
 
 	/* Don't bind to AT command interface */
