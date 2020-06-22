From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jun 2020 14:10:36 +0000
Subject: [PATCH] media: uvc: Fix list_for_each() checking
Message-Id: <20200622141036.GA13774@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If the UVC_QUIRK_IGNORE_SELECTOR_UNIT flag is set, then there is a
problem that the code uses "iterm" after the end of the
list_for_each_entry() loop.  It should only be used when the
UVC_ENTITY_IS_ITERM() condition is true and we break from the loop.

Fixes: d5e90b7a6cd1 ("[media] uvcvideo: Move to video_ioctl2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Please review this one extra carefully because it's from static analysis
and I'm not 100% sure it's correct.

 drivers/media/usb/uvc/uvc_v4l2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..945862afa829 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -827,28 +827,32 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 	const struct uvc_entity *selector = chain->selector;
 	struct uvc_entity *iterm = NULL;
 	u32 index = input->index;
-	int pin = 0;
+	bool found = false;
+	int pin;
 
 	if (selector = NULL ||
 	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
 		if (index != 0)
 			return -EINVAL;
 		list_for_each_entry(iterm, &chain->entities, chain) {
-			if (UVC_ENTITY_IS_ITERM(iterm))
+			if (UVC_ENTITY_IS_ITERM(iterm)) {
+				found = true;
 				break;
+			}
 		}
-		pin = iterm->id;
 	} else if (index < selector->bNrInPins) {
 		pin = selector->baSourceID[index];
 		list_for_each_entry(iterm, &chain->entities, chain) {
 			if (!UVC_ENTITY_IS_ITERM(iterm))
 				continue;
-			if (iterm->id = pin)
+			if (iterm->id = pin) {
+				found = true;
 				break;
+			}
 		}
 	}
 
-	if (iterm = NULL || iterm->id != pin)
+	if (!found)
 		return -EINVAL;
 
 	memset(input, 0, sizeof(*input));
-- 
2.27.0
