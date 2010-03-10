From: Dan Carpenter <error27@gmail.com>
Date: Wed, 10 Mar 2010 10:57:03 +0000
Subject: [patch] omap24xxcam: potential buffer overflow
Message-Id: <20100310105703.GD6321@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman <gregkh@suse.de>, Trent Piepho <xyzzy@speakeasy.org>, Hans Verkuil <hverkuil@xs4all.nl>, kernel-janitors@vger.kernel.org, sakari.ailus@nokia.com

The previous loop goes until last = VIDEO_MAX_FRAME, so this could 
potentially go one past the end of the loop.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/omap24xxcam.c b/drivers/media/video/omap24xxcam.c
index 142c327..bedbee9 100644
--- a/drivers/media/video/omap24xxcam.c
+++ b/drivers/media/video/omap24xxcam.c
@@ -1404,7 +1404,7 @@ static int omap24xxcam_mmap_buffers(struct file *file,
 	}
 
 	size = 0;
-	for (i = first; i <= last; i++) {
+	for (i = first; i <= last && i < VIDEO_MAX_FRAME; i++) {
 		struct videobuf_dmabuf *dma = videobuf_to_dma(vbq->bufs[i]);
 
 		for (j = 0; j < dma->sglen; j++) {
