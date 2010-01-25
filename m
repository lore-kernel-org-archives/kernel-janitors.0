From: Dan Carpenter <error27@gmail.com>
Date: Mon, 25 Jan 2010 11:53:33 +0000
Subject: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <20100125115333.GD3061@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Johan Hovold points out that get_string() is basically just a re-implimentation
of usb_string().  It is also buggy.  It does DMA on the stack and it doesn't
handle negative returns from usb_get_descriptor().  Plus unicode_to_ascii() is 
a rubbish function and moving to usb_string() avoids using it.

Let's eliminate get_string() entirely.

Reported-by: Johan Hovold <jhovold@gmail.com>
Signed-off-by: Dan Carpenter <error27@gmail.com>
Cc: stable@kernel.org

--- orig/drivers/usb/serial/io_edgeport.c	2009-12-30 17:20:35.000000000 +0300
+++ devel/drivers/usb/serial/io_edgeport.c	2010-01-25 08:27:41.000000000 +0300
@@ -364,42 +364,6 @@ static void update_edgeport_E2PROM(struc
 	release_firmware(fw);
 }
 
-
-/************************************************************************
- *									*
- *  Get string descriptor from device					*
- *									*
- ************************************************************************/
-static int get_string(struct usb_device *dev, int Id, char *string, int buflen)
-{
-	struct usb_string_descriptor StringDesc;
-	struct usb_string_descriptor *pStringDesc;
-
-	dbg("%s - USB String ID = %d", __func__, Id);
-
-	if (!usb_get_descriptor(dev, USB_DT_STRING, Id,
-					&StringDesc, sizeof(StringDesc)))
-		return 0;
-
-	pStringDesc = kmalloc(StringDesc.bLength, GFP_KERNEL);
-	if (!pStringDesc)
-		return 0;
-
-	if (!usb_get_descriptor(dev, USB_DT_STRING, Id,
-					pStringDesc, StringDesc.bLength)) {
-		kfree(pStringDesc);
-		return 0;
-	}
-
-	unicode_to_ascii(string, buflen,
-				pStringDesc->wData, pStringDesc->bLength/2);
-
-	kfree(pStringDesc);
-	dbg("%s - USB String %s", __func__, string);
-	return strlen(string);
-}
-
-
 #if 0
 /************************************************************************
  *
@@ -2997,10 +2961,12 @@ static int edge_startup(struct usb_seria
 	usb_set_serial_data(serial, edge_serial);
 
 	/* get the name for the device from the device */
-	i = get_string(dev, dev->descriptor.iManufacturer,
+	i = usb_string(dev, dev->descriptor.iManufacturer,
 	    &edge_serial->name[0], MAX_NAME_LEN+1);
+	if (i < 0)
+		i = 0;
 	edge_serial->name[i++] = ' ';
-	get_string(dev, dev->descriptor.iProduct,
+	usb_string(dev, dev->descriptor.iProduct,
 	    &edge_serial->name[i], MAX_NAME_LEN+2 - i);
 
 	dev_info(&serial->dev->dev, "%s detected\n", edge_serial->name);
