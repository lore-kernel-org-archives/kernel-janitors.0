From: Dan Carpenter <error27@gmail.com>
Date: Thu, 26 May 2011 08:50:18 +0000
Subject: [patch 2/2] usbhid: fix some error codes in hiddev_connect()
Message-Id: <20110526085018.GE14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>
Cc: "open list:USB HID/HIDBP DRI..." <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:HID CORE LAYER" <linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Returning -1 is -EPERM which is inappropriate here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index b2f9a3a..80b8e76 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -890,8 +890,9 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 			return -1;
 	}
 
-	if (!(hiddev = kzalloc(sizeof(struct hiddev), GFP_KERNEL)))
-		return -1;
+	hiddev = kzalloc(sizeof(struct hiddev), GFP_KERNEL);
+	if (!hiddev)
+		return -ENOMEM;
 
 	init_waitqueue_head(&hiddev->wait);
 	INIT_LIST_HEAD(&hiddev->list);
@@ -905,7 +906,7 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 		hid_err(hid, "Not able to get a minor for this device\n");
 		hid->hiddev = NULL;
 		kfree(hiddev);
-		return -1;
+		return retval;
 	}
 	return 0;
 }
