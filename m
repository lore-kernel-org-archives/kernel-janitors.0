From: Dan Carpenter <error27@gmail.com>
Date: Sat, 25 Dec 2010 22:23:42 +0000
Subject: [patch] USB: cdc_ether: remove unneeded check
Message-Id: <20101225222341.GS1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oliver@neukum.name>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We already verified that "dev->udev->actconfig->extralen" was non-zero
so "len" is non-zero here as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested.

diff --git a/drivers/net/usb/cdc_ether.c b/drivers/net/usb/cdc_ether.c
index b3fe0de..9a60e41 100644
--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -99,9 +99,7 @@ int usbnet_generic_cdc_bind(struct usbnet *dev, struct usb_interface *intf)
 		 */
 		buf = dev->udev->actconfig->extra;
 		len = dev->udev->actconfig->extralen;
-		if (len)
-			dev_dbg(&intf->dev,
-				"CDC descriptors on config\n");
+		dev_dbg(&intf->dev, "CDC descriptors on config\n");
 	}
 
 	/* Maybe CDC descriptors are after the endpoint?  This bug has
