From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Nov 2014 14:06:49 +0000
Subject: [patch] USB: adutux: NULL dereferences on disconnect
Message-Id: <20141126140649.GB18740@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Both "dev->udev" and "interface->dev" are NULL.  These printks are not
very interesting so I just deleted them.

Fixes: 03270634e242 ('USB: Add ADU support for Ontrak ADU devices')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 493c7f2..3071c0e 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -814,15 +814,10 @@ static void adu_disconnect(struct usb_interface *interface)
 	usb_set_intfdata(interface, NULL);
 
 	/* if the device is not opened, then we clean up right now */
-	dev_dbg(&dev->udev->dev, "%s : open count %d\n",
-		__func__, dev->open_count);
 	if (!dev->open_count)
 		adu_delete(dev);
 
 	mutex_unlock(&adutux_mutex);
-
-	dev_info(&interface->dev, "ADU device adutux%d now disconnected\n",
-		 (minor - ADU_MINOR_BASE));
 }
 
 /* usb specific object needed to register this driver with the usb subsystem */
