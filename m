From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Dec 2013 07:29:24 +0000
Subject: [patch v2] [media] v4l: omap4iss: Restore irq flags correctly in omap4iss_video_buffer_next()
Message-Id: <20131216150612.GA15506@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sergio Aguirre <sergio.a.aguirre@gmail.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

The spin_lock_irqsave() macro is not nestable.  The second call will
overwrite the first record of "flags" so the IRQs will not be enabled
correctly at the end of the function.

In the current code, this function is always called from the IRQ handler
so everything works fine and this fix doesn't change anything.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  Updated the change log

diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 766491e6a8d0..c9b71c750b15 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -451,9 +451,9 @@ struct iss_buffer *omap4iss_video_buffer_next(struct iss_video *video)
 	}
 
 	if (video->type = V4L2_BUF_TYPE_VIDEO_CAPTURE && pipe->input != NULL) {
-		spin_lock_irqsave(&pipe->lock, flags);
+		spin_lock(&pipe->lock);
 		pipe->state &= ~ISS_PIPELINE_STREAM;
-		spin_unlock_irqrestore(&pipe->lock, flags);
+		spin_unlock(&pipe->lock);
 	}
 
 	buf = list_first_entry(&video->dmaqueue, struct iss_buffer,
_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

