From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 06:00:12 +0000
Subject: [patch] Staging: vt6656: problems in error handling
Message-Id: <20100810060012.GR9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Andres More <more.andres@gmail.com>, Forest Bond <forest@alittletooquiet.net>, Jim Lieb <lieb@canonical.com>, devel@driverdev.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The first kfree(pDevice) is pointless because pDevice is NULL.  The
second kfree(pDevice) is a double free because pDevice is the driver's
private data and that is already freed by free_netdev(netdev).  Also the
free_netdev() error path doesn't call usb_put_dev().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index c528ef0..4fdf837 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -771,10 +771,9 @@ vt6656_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	udev = usb_get_dev(udev);
 	netdev = alloc_etherdev(sizeof(DEVICE_INFO));
-
 	if (!netdev) {
 		printk(KERN_ERR DEVICE_NAME ": allocate net device failed\n");
-		kfree(pDevice);
+		rc = -ENOMEM;
 		goto err_nomem;
 	}
 
@@ -800,9 +799,7 @@ vt6656_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	rc = register_netdev(netdev);
 	if (rc) {
 		printk(KERN_ERR DEVICE_NAME " Failed to register netdev\n");
-		free_netdev(netdev);
-		kfree(pDevice);
-		return -ENODEV;
+		goto err_netdev;
 	}
 
 	usb_device_reset(pDevice);
@@ -820,10 +817,12 @@ vt6656_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	return 0;
 
+err_netdev:
+	free_netdev(netdev);
 err_nomem:
 	usb_put_dev(udev);
 
-	return -ENOMEM;
+	return rc;
 }
 
 static void device_free_tx_bufs(PSDevice pDevice)
