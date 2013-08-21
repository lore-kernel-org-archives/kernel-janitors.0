From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 08:31:18 +0000
Subject: [patch] staging: gdm7240: fix error handling of probe()
Message-Id: <20130821083118.GE5240@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error handling is messy and not in kernel style.  On some paths it
frees "mux_dev" twice.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm724x/gdm_mux.c b/drivers/staging/gdm724x/gdm_mux.c
index 9e217ff..5b1ef40 100644
--- a/drivers/staging/gdm724x/gdm_mux.c
+++ b/drivers/staging/gdm724x/gdm_mux.c
@@ -509,11 +509,11 @@ static int init_usb(struct mux_dev *mux_dev)
 
 static int gdm_mux_probe(struct usb_interface *intf, const struct usb_device_id *id)
 {
-	struct mux_dev *mux_dev = NULL;
-	struct tty_dev *tty_dev = NULL;
+	struct mux_dev *mux_dev;
+	struct tty_dev *tty_dev;
 	u16 idVendor, idProduct;
 	int bInterfaceNumber;
-	int ret = 0;
+	int ret;
 	int i;
 	struct usb_device *usbdev = interface_to_usbdev(intf);
 	bInterfaceNumber = intf->cur_altsetting->desc.bInterfaceNumber;
@@ -523,61 +523,54 @@ static int gdm_mux_probe(struct usb_interface *intf, const struct usb_device_id
 
 	pr_info("mux vid = 0x%04x pid = 0x%04x\n", idVendor, idProduct);
 
-	if (bInterfaceNumber != 2) {
-		ret = -ENODEV;
-		goto out;
-	}
+	if (bInterfaceNumber != 2)
+		return -ENODEV;
 
 	mux_dev = kzalloc(sizeof(struct mux_dev), GFP_KERNEL);
-	if (!mux_dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!mux_dev)
+		return -ENOMEM;
 
 	tty_dev = kzalloc(sizeof(struct tty_dev), GFP_KERNEL);
 	if (!tty_dev) {
-		kfree(mux_dev);
 		ret = -ENOMEM;
-		goto out;
+		goto err_free_mux;
 	}
 
 	mux_dev->usbdev = usbdev;
 	mux_dev->control_intf = intf;
 
 	ret = init_usb(mux_dev);
-	if (ret < 0)
-		goto out;
+	if (ret)
+		goto err_free_tty;
 
 	tty_dev->priv_dev = (void *)mux_dev;
 	tty_dev->send_func = gdm_mux_send;
 	tty_dev->recv_func = gdm_mux_recv;
 	tty_dev->send_control = gdm_mux_send_control;
 
-	if (register_lte_tty_device(tty_dev, &intf->dev) < 0) {
-		unregister_lte_tty_device(tty_dev);
-		mux_dev = tty_dev->priv_dev;
+	ret = register_lte_tty_device(tty_dev, &intf->dev);
+	if (ret)
+		goto err_unregister_tty;
 
-		ret = -1;
-		goto out;
-	}
 	for (i = 0; i < TTY_MAX_COUNT; i++)
 		mux_dev->tty_dev = tty_dev;
 
-out:
-	if (ret < 0) {
-		kfree(tty_dev);
-		if (mux_dev) {
-			release_usb(mux_dev);
-			kfree(mux_dev);
-		}
-	} else {
-		mux_dev->intf = intf;
-		mux_dev->usb_state = PM_NORMAL;
-	}
+	mux_dev->intf = intf;
+	mux_dev->usb_state = PM_NORMAL;
 
 	usb_get_dev(usbdev);
 	usb_set_intfdata(intf, tty_dev);
 
+	return 0;
+
+err_unregister_tty:
+	unregister_lte_tty_device(tty_dev);
+	release_usb(mux_dev);
+err_free_tty:
+	kfree(tty_dev);
+err_free_mux:
+	kfree(mux_dev);
+
 	return ret;
 }
 
