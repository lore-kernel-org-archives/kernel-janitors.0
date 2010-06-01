From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 08:17:27 +0000
Subject: [patch] V4L/DVB: cpia_usb: remove unneeded variable
Message-Id: <20100601081727.GL5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This is just a cleanup patch.  We never use the "udev" variable so I
have removed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/cpia_usb.c b/drivers/media/video/cpia_usb.c
index ef1f893..58d193f 100644
--- a/drivers/media/video/cpia_usb.c
+++ b/drivers/media/video/cpia_usb.c
@@ -584,7 +584,6 @@ static void cpia_disconnect(struct usb_interface *intf)
 {
 	struct cam_data *cam = usb_get_intfdata(intf);
 	struct usb_cpia *ucpia;
-	struct usb_device *udev;
 
 	usb_set_intfdata(intf, NULL);
 	if (!cam)
@@ -606,8 +605,6 @@ static void cpia_disconnect(struct usb_interface *intf)
 	if (waitqueue_active(&ucpia->wq_stream))
 		wake_up_interruptible(&ucpia->wq_stream);
 
-	udev = interface_to_usbdev(intf);
-
 	ucpia->curbuff = ucpia->workbuff = NULL;
 
 	vfree(ucpia->buffers[2]);
