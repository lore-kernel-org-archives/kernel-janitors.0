From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sun, 25 Nov 2012 01:58:19 +0000
Subject: [PATCH v2] UVC: use GFP_ATOMIC under spin lock.
Message-Id: <1353808699-17224-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50ADDDD5.1080709@bfs.de>
In-Reply-To: <50ADDDD5.1080709@bfs.de>
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
 drivers/usb/gadget/uvc_video.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/uvc_video.c b/drivers/usb/gadget/uvc_video.c
index b0e53a8..cd067a6 100644
--- a/drivers/usb/gadget/uvc_video.c
+++ b/drivers/usb/gadget/uvc_video.c
@@ -309,7 +309,8 @@ uvc_video_pump(struct uvc_video *video)
 		video->encode(req, video, buf);
 
 		/* Queue the USB request */
-		if ((ret = usb_ep_queue(video->ep, req, GFP_KERNEL)) < 0) {
+		ret = usb_ep_queue(video->ep, req, GFP_ATOMIC);
+		if (ret < 0) {
 			printk(KERN_INFO "Failed to queue request (%d)\n", ret);
 			usb_ep_set_halt(video->ep);
 			spin_unlock_irqrestore(&video->queue.irqlock, flags);
-- 
1.7.10.4

