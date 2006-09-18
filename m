From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 18 Sep 2006 22:34:12 +0000
Subject: [KJ] [Patch] BUG_ON conversion for drivers/usb/input/wacom.c
Message-Id: <1158618852.19853.1.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158615536.21907.1.camel@alice>
In-Reply-To: <1158615536.21907.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts two if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc7/drivers/usb/input/wacom.c.orig	2006-09-18 23:45:10.000000000 +0200
+++ linux-2.6.18-rc7/drivers/usb/input/wacom.c	2006-09-18 23:45:37.000000000 +0200
@@ -870,8 +870,7 @@ static int wacom_probe(struct usb_interf
 	strlcat(wacom->phys, "/input0", sizeof(wacom->phys));
 
 	wacom->features = wacom_features + (id - wacom_ids);
-	if (wacom->features->pktlen > 10)
-		BUG();
+	BUG_ON(wacom->features->pktlen > 10);
 
 	input_dev->name = wacom->features->name;
 	usb_to_input_id(dev, &input_dev->id);
@@ -936,8 +935,7 @@ static int wacom_probe(struct usb_interf
 
 	endpoint = &intf->cur_altsetting->endpoint[0].desc;
 
-	if (wacom->features->pktlen > 10)
-		BUG();
+	BUG_ON(wacom->features->pktlen > 10);
 
 	usb_fill_int_urb(wacom->irq, dev,
 			 usb_rcvintpipe(dev, endpoint->bEndpointAddress),


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
