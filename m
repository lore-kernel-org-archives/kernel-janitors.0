From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Dec 2016 11:37:01 +0000
Subject: [PATCH 4/5] staging: comedi: usbduxsigma: Split a condition check in usbduxsigma_alloc_usb_buffers()
Message-Id: <b50256ca-37c4-622a-fe69-d7419bdda0d4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
In-Reply-To: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Dec 2016 11:15:40 +0100

The functions "kcalloc" and "kzalloc" were called in four cases by the
function "usbduxsigma_alloc_usb_buffers" without checking immediately
if they succeded.
This issue was detected by using the Coccinelle software.

Allocated memory was also not released if one of these function
calls failed.

* Reduce memory allocation sizes for two function calls.

* Split a condition check for memory allocation failures.

* Add more exception handling.

Fixes: 65989c030bbca96be45ed137f6384dbd46030d10 ("staging: comedi: usbduxsigma: factor usb buffer allocation out of (*probe)")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/comedi/drivers/usbduxsigma.c | 61 ++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
index 456e9f13becb..8c04aa5339f3 100644
--- a/drivers/staging/comedi/drivers/usbduxsigma.c
+++ b/drivers/staging/comedi/drivers/usbduxsigma.c
@@ -1341,22 +1341,37 @@ static int usbduxsigma_alloc_usb_buffers(struct comedi_device *dev)
 	struct usb_device *usb = comedi_to_usb_dev(dev);
 	struct usbduxsigma_private *devpriv = dev->private;
 	struct urb *urb;
-	int i;
+	int i, x;
 
 	devpriv->dux_commands = kzalloc(SIZEOFDUXBUFFER, GFP_KERNEL);
+	if (!devpriv->dux_commands)
+		return -ENOMEM;
+
 	devpriv->in_buf = kzalloc(SIZEINBUF, GFP_KERNEL);
+	if (!devpriv->in_buf)
+		goto free_commands;
+
 	devpriv->insn_buf = kzalloc(SIZEINSNBUF, GFP_KERNEL);
-	devpriv->ai_urbs = kcalloc(devpriv->n_ai_urbs, sizeof(urb), GFP_KERNEL);
-	devpriv->ao_urbs = kcalloc(devpriv->n_ao_urbs, sizeof(urb), GFP_KERNEL);
-	if (!devpriv->dux_commands || !devpriv->in_buf || !devpriv->insn_buf ||
-	    !devpriv->ai_urbs || !devpriv->ao_urbs)
-		return -ENOMEM;
+	if (!devpriv->insn_buf)
+		goto free_in_buf;
+
+	devpriv->ai_urbs = kcalloc(devpriv->n_ai_urbs,
+				   sizeof(*devpriv->ai_urbs),
+				   GFP_KERNEL);
+	if (!devpriv->ai_urbs)
+		goto free_insn_buf;
+
+	devpriv->ao_urbs = kcalloc(devpriv->n_ao_urbs,
+				   sizeof(*devpriv->ao_urbs),
+				   GFP_KERNEL);
+	if (!devpriv->ao_urbs)
+		goto free_ai_urbs;
 
 	for (i = 0; i < devpriv->n_ai_urbs; i++) {
 		/* one frame: 1ms */
 		urb = usb_alloc_urb(1, GFP_KERNEL);
 		if (!urb)
-			return -ENOMEM;
+			goto free_n_ai_urbs;
 		devpriv->ai_urbs[i] = urb;
 		urb->dev = usb;
 		/* will be filled later with a pointer to the comedi-device */
@@ -1366,7 +1381,7 @@ static int usbduxsigma_alloc_usb_buffers(struct comedi_device *dev)
 		urb->transfer_flags = URB_ISO_ASAP;
 		urb->transfer_buffer = kzalloc(SIZEINBUF, GFP_KERNEL);
 		if (!urb->transfer_buffer)
-			return -ENOMEM;
+			goto free_n_ai_urbs;
 		urb->complete = usbduxsigma_ai_urb_complete;
 		urb->number_of_packets = 1;
 		urb->transfer_buffer_length = SIZEINBUF;
@@ -1378,7 +1393,7 @@ static int usbduxsigma_alloc_usb_buffers(struct comedi_device *dev)
 		/* one frame: 1ms */
 		urb = usb_alloc_urb(1, GFP_KERNEL);
 		if (!urb)
-			return -ENOMEM;
+			goto free_n_ao_urbs;
 		devpriv->ao_urbs[i] = urb;
 		urb->dev = usb;
 		/* will be filled later with a pointer to the comedi-device */
@@ -1388,7 +1403,7 @@ static int usbduxsigma_alloc_usb_buffers(struct comedi_device *dev)
 		urb->transfer_flags = URB_ISO_ASAP;
 		urb->transfer_buffer = kzalloc(SIZEOUTBUF, GFP_KERNEL);
 		if (!urb->transfer_buffer)
-			return -ENOMEM;
+			goto free_n_ao_urbs;
 		urb->complete = usbduxsigma_ao_urb_complete;
 		urb->number_of_packets = 1;
 		urb->transfer_buffer_length = SIZEOUTBUF;
@@ -1400,16 +1415,38 @@ static int usbduxsigma_alloc_usb_buffers(struct comedi_device *dev)
 	if (devpriv->pwm_buf_sz) {
 		urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!urb)
-			return -ENOMEM;
+			goto free_n_ao_urbs;
 		devpriv->pwm_urb = urb;
 
 		urb->transfer_buffer = kzalloc(devpriv->pwm_buf_sz,
 					       GFP_KERNEL);
 		if (!urb->transfer_buffer)
-			return -ENOMEM;
+			goto free_pwm_urb;
 	}
 
 	return 0;
+free_pwm_urb:
+	usb_free_urb(urb);
+free_n_ao_urbs:
+	for (x = 0; x < i; ++x) {
+		kfree(devpriv->ao_urbs[x]->transfer_buffer);
+		usb_free_urb(devpriv->ao_urbs[x]);
+	}
+free_n_ai_urbs:
+	for (x = 0; x < i; ++x) {
+		kfree(devpriv->ai_urbs[x]->transfer_buffer);
+		usb_free_urb(devpriv->ai_urbs[x]);
+	}
+	kfree(devpriv->ao_urbs);
+free_ai_urbs:
+	kfree(devpriv->ai_urbs);
+free_insn_buf:
+	kfree(devpriv->insn_buf);
+free_in_buf:
+	kfree(devpriv->in_buf);
+free_commands:
+	kfree(devpriv->dux_commands);
+	return -ENOMEM;
 }
 
 static void usbduxsigma_free_usb_buffers(struct comedi_device *dev)
-- 
2.11.0

