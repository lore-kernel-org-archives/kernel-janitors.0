From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Oct 2014 07:57:21 +0000
Subject: [patch] [media] usbvision-video: two use after frees
Message-Id: <20141016075721.GC29096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The lock has been freed in usbvision_release() so there is no need to
call mutex_unlock() here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
index 68bc961..9bfa041 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -446,6 +446,7 @@ static int usbvision_v4l2_close(struct file *file)
 	if (usbvision->remove_pending) {
 		printk(KERN_INFO "%s: Final disconnect\n", __func__);
 		usbvision_release(usbvision);
+		return 0;
 	}
 	mutex_unlock(&usbvision->v4l2_lock);
 
@@ -1221,6 +1222,7 @@ static int usbvision_radio_close(struct file *file)
 	if (usbvision->remove_pending) {
 		printk(KERN_INFO "%s: Final disconnect\n", __func__);
 		usbvision_release(usbvision);
+		return err_code;
 	}
 
 	mutex_unlock(&usbvision->v4l2_lock);
