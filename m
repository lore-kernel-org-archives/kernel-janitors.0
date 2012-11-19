From: Cyril Roelandt <tipecaml@gmail.com>
Date: Mon, 19 Nov 2012 21:34:02 +0000
Subject: [PATCH] UVC: use GFP_ATOMIC under spin lock.
Message-Id: <1353360842-18384-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, laurent.pinchart@ideasonboard.com, kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>

Found using the following semantic patch:
<spml>
@@
@@
spin_lock_irqsave(...);
... when != spin_unlock_irqrestore(...);
* GFP_KERNEL
</spml>

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/usb/gadget/uvc_video.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/uvc_video.c b/drivers/usb/gadget/uvc_video.c
index b0e53a8..79b4132 100644
--- a/drivers/usb/gadget/uvc_video.c
+++ b/drivers/usb/gadget/uvc_video.c
@@ -309,7 +309,7 @@ uvc_video_pump(struct uvc_video *video)
 		video->encode(req, video, buf);
 
 		/* Queue the USB request */
-		if ((ret = usb_ep_queue(video->ep, req, GFP_KERNEL)) < 0) {
+		if ((ret = usb_ep_queue(video->ep, req, GFP_ATOMIC)) < 0) {
 			printk(KERN_INFO "Failed to queue request (%d)\n", ret);
 			usb_ep_set_halt(video->ep);
 			spin_unlock_irqrestore(&video->queue.irqlock, flags);
-- 
1.7.10.4

