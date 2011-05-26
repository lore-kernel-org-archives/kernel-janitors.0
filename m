From: Dan Carpenter <error27@gmail.com>
Date: Thu, 26 May 2011 08:49:16 +0000
Subject: [patch 1/2] usbhid: use after free
Message-Id: <20110526084916.GD14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There are a couple use after free bugs here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.  Please review carefully.

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index ff3c644..b2f9a3a 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -248,12 +248,15 @@ static int hiddev_release(struct inode * inode, struct file * file)
 			usbhid_close(list->hiddev->hid);
 			usbhid_put_power(list->hiddev->hid);
 		} else {
+			mutex_unlock(&list->hiddev->existancelock);
 			kfree(list->hiddev);
+			kfree(list);
+			return 0;
 		}
 	}
 
-	kfree(list);
 	mutex_unlock(&list->hiddev->existancelock);
+	kfree(list);
 
 	return 0;
 }
@@ -926,7 +929,9 @@ void hiddev_disconnect(struct hid_device *hid)
 		usbhid_close(hiddev->hid);
 		wake_up_interruptible(&hiddev->wait);
 	} else {
+		mutex_unlock(&hiddev->existancelock);
 		kfree(hiddev);
+		return;
 	}
 	mutex_unlock(&hiddev->existancelock);
 }
