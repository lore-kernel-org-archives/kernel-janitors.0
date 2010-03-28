From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:29:09 +0000
Subject: [patch] video/s255drv: cleanup. remove uneeded NULL check
Message-Id: <20100328112909.GP5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Dean Anderson <dean@sensoray.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mike Isely <isely@pobox.com>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"dev" can never be NULL there so there is no need to check it.
Also I made a couple of white space changes to the declaration of "dev".

This eliminates a smatch warning about checking for NULL after a
dereference.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/s2255drv.c b/drivers/media/video/s2255drv.c
index fb742f1..e70af5d 100644
--- a/drivers/media/video/s2255drv.c
+++ b/drivers/media/video/s2255drv.c
@@ -2582,8 +2582,9 @@ error:
 /* disconnect routine. when board is removed physically or with rmmod */
 static void s2255_disconnect(struct usb_interface *interface)
 {
-	struct s2255_dev *dev = NULL;
+	struct s2255_dev *dev;
 	int i;
+
 	dprintk(1, "s2255: disconnect interface %p\n", interface);
 	dev = usb_get_intfdata(interface);
 
@@ -2602,11 +2603,9 @@ static void s2255_disconnect(struct usb_interface *interface)
 	usb_set_intfdata(interface, NULL);
 	mutex_unlock(&dev->open_lock);
 
-	if (dev) {
-		kref_put(&dev->kref, s2255_destroy);
-		dprintk(1, "s2255drv: disconnect\n");
-		dev_info(&interface->dev, "s2255usb now disconnected\n");
-	}
+	kref_put(&dev->kref, s2255_destroy);
+	dprintk(1, "s2255drv: disconnect\n");
+	dev_info(&interface->dev, "s2255usb now disconnected\n");
 }
 
 static struct usb_driver s2255_driver = {
