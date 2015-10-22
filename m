From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2015 09:09:05 +0000
Subject: [patch] [media] uvcvideo: small cleanup in uvc_video_clock_update()
Message-Id: <20151022090905.GB9202@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch is not smart enough to see that "&stream->clock.lock" and
"&clock->lock" are the same thing so it complains about the locking
here.  Let's make it more consistent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2b276ab..4abe3e9 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -709,7 +709,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	vbuf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
 
 done:
-	spin_unlock_irqrestore(&stream->clock.lock, flags);
+	spin_unlock_irqrestore(&clock->lock, flags);
 }
 
 /* ------------------------------------------------------------------------
