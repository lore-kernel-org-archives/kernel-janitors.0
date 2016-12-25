From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:50:23 +0000
Subject: [PATCH 17/19] [media] uvc_video: Fix a typo in a comment line
Message-Id: <29689504-fa08-b8c2-436b-22668123a5bb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
In-Reply-To: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:42:58 +0100

The script "checkpatch.pl" pointed out that a word may be misspelled.

Add a missing character there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 617f2090aa55..61320ef82553 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1794,7 +1794,7 @@ int uvc_video_init(struct uvc_streaming *stream)
 	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
 
 	/* Set the streaming probe control with default streaming parameters
-	 * retrieved from the device. Webcams that don't suport GET_DEF
+	 * retrieved from the device. Webcams that don't support GET_DEF
 	 * requests on the probe control will just keep their current streaming
 	 * parameters.
 	 */
-- 
2.11.0

