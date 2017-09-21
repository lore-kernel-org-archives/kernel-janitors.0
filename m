From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Sep 2017 19:26:23 +0000
Subject: [PATCH 3/3] [media] uvcvideo: Add some spaces for better code readability
Message-Id: <74183bb1-f78e-9ca1-06ab-9de5c00a5fe5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20a8d1a5-45f1-2f98-e4b3-cfc24e9c04b0@users.sourceforge.net>
In-Reply-To: <20a8d1a5-45f1-2f98-e4b3-cfc24e9c04b0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Sep 2017 21:12:29 +0200

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 184edf8a0885..cebaba5c4e86 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -123,13 +123,13 @@ static __u32 uvc_try_frame_interval(struct uvc_frame *frame, __u32 interval)
 			best = dist;
 		}
 
-		interval = frame->dwFrameInterval[i-1];
+		interval = frame->dwFrameInterval[i - 1];
 	} else {
 		const __u32 min = frame->dwFrameInterval[0];
 		const __u32 max = frame->dwFrameInterval[1];
 		const __u32 step = frame->dwFrameInterval[2];
 
-		interval = min + (interval - min + step/2) / step * step;
+		interval = min + (interval - min + step / 2) / step * step;
 		if (interval > max)
 			interval = max;
 	}
@@ -201,7 +201,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 		__u16 h = format->frame[i].wHeight;
 
 		d = min(w, rw) * min(h, rh);
-		d = w*h + rw*rh - 2*d;
+		d = w * h + rw * rh - 2 * d;
 		if (d < maxd) {
 			maxd = d;
 			frame = &format->frame[i];
@@ -219,9 +219,10 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 
 	/* Use the default frame interval. */
 	interval = frame->dwDefaultFrameInterval;
-	uvc_trace(UVC_TRACE_FORMAT, "Using default frame interval %u.%u us "
-		"(%u.%u fps).\n", interval/10, interval%10, 10000000/interval,
-		(100000000/interval)%10);
+	uvc_trace(UVC_TRACE_FORMAT,
+		  "Using default frame interval %u.%u us (%u.%u fps).\n",
+		  interval / 10, interval % 10,
+		  10000000 / interval, (100000000 / interval) % 10);
 
 	/* Set the format index, frame index and frame interval. */
 	memset(probe, 0, sizeof *probe);
-- 
2.14.1

