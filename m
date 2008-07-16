From: Julia Lawall <julia@diku.dk>
Date: Wed, 16 Jul 2008 16:00:42 +0000
Subject: [PATCH retry] drivers/usb/class/usblp.c: adjust error handling code
Message-Id: <Pine.LNX.4.64.0807161758520.28783@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807161717220.28783@ask.diku.dk>
 <200807161744.59137.oliver@neukum.org>
In-Reply-To: <200807161744.59137.oliver@neukum.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oliver@neukum.org>
Cc: zaitcev@redhat.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this code, it is possible to tell statically whether usblp will be NULL
in the error handling code.

Oliver Neukum suggested to make a goto to the final return rather than 
return directly.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
identifier f,err,l,l1;
type T;
expression x,E;
statement S;
@@

x = NULL
... when != goto l1;
* x = f(...)
... when != x
err = E;
goto l;
...
* if (x != NULL)
  S
return err;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1076,15 +1076,16 @@ static int usblp_probe(struct usb_interf
 		       const struct usb_device_id *id)
 {
 	struct usb_device *dev = interface_to_usbdev (intf);
-	struct usblp *usblp = NULL;
+	struct usblp *usblp;
 	int protocol;
 	int retval;
 
 	/* Malloc and start initializing usblp structure so we can use it
 	 * directly. */
-	if (!(usblp = kzalloc(sizeof(struct usblp), GFP_KERNEL))) {
+	usblp = kzalloc(sizeof(struct usblp), GFP_KERNEL);
+	if (!usblp) {
 		retval = -ENOMEM;
-		goto abort;
+		goto abort_ret;
 	}
 	usblp->dev = dev;
 	mutex_init(&usblp->wmut);
@@ -1179,12 +1180,11 @@ abort_intfdata:
 	usb_set_intfdata (intf, NULL);
 	device_remove_file(&intf->dev, &dev_attr_ieee1284_id);
 abort:
-	if (usblp) {
-		kfree(usblp->readbuf);
-		kfree(usblp->statusbuf);
-		kfree(usblp->device_id_string);
-		kfree(usblp);
-	}
+	kfree(usblp->readbuf);
+	kfree(usblp->statusbuf);
+	kfree(usblp->device_id_string);
+	kfree(usblp);
+abort_ret:
 	return retval;
 }
 
