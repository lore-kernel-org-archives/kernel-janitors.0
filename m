From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Dec 2016 11:35:50 +0000
Subject: [PATCH 3/5] staging: comedi: usbdux: Move an assignment in usbdux_alloc_usb_buffers()
Message-Id: <92a56e39-6472-415c-0fa6-e2786b006f98@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
In-Reply-To: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Dec 2016 10:13:56 +0100

Move one assignment for the local variable "usb" so that its setting
will only be performed after some memory allocations succeeded
by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/comedi/drivers/usbdux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index d7d683bd669c..7efeac71161b 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -1446,7 +1446,7 @@ static int usbdux_firmware_upload(struct comedi_device *dev,
 
 static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
 {
-	struct usb_device *usb = comedi_to_usb_dev(dev);
+	struct usb_device *usb;
 	struct usbdux_private *devpriv = dev->private;
 	struct urb *urb;
 	int i, x;
@@ -1473,6 +1473,7 @@ static int usbdux_alloc_usb_buffers(struct comedi_device *dev)
 	if (!devpriv->ao_urbs)
 		goto free_ai_urbs;
 
+	usb = comedi_to_usb_dev(dev);
 	for (i = 0; i < devpriv->n_ai_urbs; i++) {
 		/* one frame: 1ms */
 		urb = usb_alloc_urb(1, GFP_KERNEL);
-- 
2.11.0

