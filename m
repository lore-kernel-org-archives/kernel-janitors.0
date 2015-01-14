From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jan 2015 21:03:08 +0000
Subject: [patch 4/6] usb: gadget: uvc: memory leak in uvcg_frame_make()
Message-Id: <20150114210308.GD23203@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to add a kfree(h) on an error path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 738d68f..1af2686 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1300,6 +1300,7 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 		h->fmt_type = UVCG_MJPEG;
 	} else {
 		mutex_unlock(&opts->lock);
+		kfree(h);
 		return ERR_PTR(-EINVAL);
 	}
 	++fmt->num_frames;
